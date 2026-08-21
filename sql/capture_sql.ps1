# Capture every statement SQL Server runs during a window, so a legacy action
# can be replayed and re-implemented faithfully.
#
# Built for one job: watch what the legacy app does when it saves a Sales
# Invoice, then mimic it. Guessing the write path from table names is how you
# miss the running-number update, the stock movement, or the tax rounding that
# happens three statements later.
#
# Uses Extended Events rather than Profiler: far lower overhead, scriptable,
# and it records the *parameter values* of RPC calls, which is what you need to
# replay a parameterised INSERT.
#
#   .\capture_sql.ps1 -Action Start          # begin capturing
#   ... perform the Sales Invoice save in the legacy app ...
#   .\capture_sql.ps1 -Action Stop
#   .\capture_sql.ps1 -Action Export         # write the timeline to CSV + SQL
#
param(
    [ValidateSet('Start', 'Stop', 'Export', 'Status', 'Cleanup')]
    [string]$Action = 'Status',

    [string]$Server   = '192.168.16.75',
    [int]$Port        = 54112,
    [string]$DbUser   = 'vsnet2020',
    [string]$DbPassword,

    # Databases to watch. MP_Invoice lives in both RMS and RMS_100, and which
    # one the legacy app writes to is exactly what we're trying to learn — so
    # capture both by default rather than assume.
    [string[]]$Databases = @('RMS', 'RMS_100'),

    [string]$SessionName = 'ims_si_capture',

    # Where the export lands (on THIS machine).
    [string]$OutDir = "$PSScriptRoot\capture",

    # Only keep exported events whose text mentions one of these. Blank keeps
    # everything — recommended for the first run, because the interesting
    # statements are often the ones you didn't predict.
    [string[]]$Contains = @()
)

$ErrorActionPreference = 'Stop'

function Say-Ok   { param($m) Write-Host "[OK]   $m" -ForegroundColor Green }
function Say-Info { param($m) Write-Host "[..]   $m" -ForegroundColor Cyan }
function Say-Warn { param($m) Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Say-Fail { param($m) Write-Host "[FAIL] $m" -ForegroundColor Red }

if (-not $DbPassword) {
    $sec = Read-Host "SQL password for $DbUser" -AsSecureString
    $DbPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec))
}

$connStr = "Server=$Server,$Port;Database=master;User ID=$DbUser;Password=$DbPassword;" +
           "TrustServerCertificate=True;Connect Timeout=15"

function Invoke-Sql {
    param([string]$Sql, [int]$Timeout = 120)
    $c = New-Object System.Data.SqlClient.SqlConnection $connStr
    try {
        $c.Open()
        $cmd = $c.CreateCommand()
        $cmd.CommandText = $Sql
        $cmd.CommandTimeout = $Timeout
        $da = New-Object System.Data.SqlClient.SqlDataAdapter $cmd
        $ds = New-Object System.Data.DataSet
        [void]$da.Fill($ds)
        # Comma operator, deliberately: PowerShell ENUMERATES a DataTable on
        # output, so `return $ds.Tables[0]` hands back a stream of DataRows and
        # the caller's $r.Rows is null. Wrapping in a single-element array
        # returns the table itself.
        if ($ds.Tables.Count -gt 0) { return ,$ds.Tables[0] }
        return $null
    } finally { $c.Close() }
}

# The .xel file is written by the SQL Server SERVICE, not by us — so it must
# live somewhere that service account can write. Its own LOG folder always
# qualifies, which avoids a permissions dead end on a remote box.
function Get-LogPath {
    $r = Invoke-Sql "SELECT p = LEFT(CAST(SERVERPROPERTY('ErrorLogFileName') AS nvarchar(500)),
                          LEN(CAST(SERVERPROPERTY('ErrorLogFileName') AS nvarchar(500)))
                          - CHARINDEX('\', REVERSE(CAST(SERVERPROPERTY('ErrorLogFileName') AS nvarchar(500)))))"
    return $r.Rows[0].p
}

function Session-Exists {
    $r = Invoke-Sql "SELECT n = COUNT(*) FROM sys.server_event_sessions WHERE name = N'$SessionName'"
    return [int]$r.Rows[0].n -gt 0
}

function Session-Running {
    $r = Invoke-Sql "SELECT n = COUNT(*) FROM sys.dm_xe_sessions WHERE name = N'$SessionName'"
    return [int]$r.Rows[0].n -gt 0
}

switch ($Action) {

  'Start' {
    Say-Info "target: $Server,$Port   databases: $($Databases -join ', ')"

    if (Session-Exists) {
        Say-Info "dropping previous session"
        Invoke-Sql "IF EXISTS (SELECT 1 FROM sys.dm_xe_sessions WHERE name = N'$SessionName')
                        ALTER EVENT SESSION [$SessionName] ON SERVER STATE = STOP;
                    DROP EVENT SESSION [$SessionName] ON SERVER;" | Out-Null
    }

    $logPath = Get-LogPath
    $xel = Join-Path $logPath "$SessionName.xel"
    Say-Info "event file: $xel"

    # Database filter, OR-ed across the list.
    $dbFilter = ($Databases | ForEach-Object { "[sqlserver].[database_name] = N'$_'" }) -join ' OR '

    # Three events, because one alone is never enough:
    #   rpc_completed          - parameterised calls WITH their parameter values
    #   sql_batch_completed    - ad-hoc batches the app sends
    #   sql_statement_completed- individual statements INSIDE batches and procs,
    #                            which is where the real work usually hides
    #
    # TRACK_CAUSALITY stamps each event with an activity id, so related
    # statements can be stitched back into the order they actually ran —
    # essential when several connections are busy at once.
    $create = @"
CREATE EVENT SESSION [$SessionName] ON SERVER
ADD EVENT sqlserver.rpc_completed(
    SET collect_statement = (1)
    ACTION (sqlserver.client_app_name, sqlserver.client_hostname, sqlserver.database_name,
            sqlserver.session_id, sqlserver.username, sqlserver.transaction_id)
    WHERE ($dbFilter)),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION (sqlserver.client_app_name, sqlserver.client_hostname, sqlserver.database_name,
            sqlserver.session_id, sqlserver.username, sqlserver.transaction_id)
    WHERE ($dbFilter)),
ADD EVENT sqlserver.sql_statement_completed(
    ACTION (sqlserver.client_app_name, sqlserver.client_hostname, sqlserver.database_name,
            sqlserver.session_id, sqlserver.username, sqlserver.transaction_id)
    WHERE ($dbFilter))
ADD TARGET package0.event_file(
    SET filename = N'$xel', max_file_size = (100), max_rollover_files = (4))
WITH (MAX_MEMORY = 16384 KB,
      EVENT_RETENTION_MODE = ALLOW_SINGLE_EVENT_LOSS,
      MAX_DISPATCH_LATENCY = 5 SECONDS,
      TRACK_CAUSALITY = ON,
      STARTUP_STATE = OFF);
"@
    Invoke-Sql $create | Out-Null
    Invoke-Sql "ALTER EVENT SESSION [$SessionName] ON SERVER STATE = START;" | Out-Null
    Say-Ok "capturing"
    Write-Host ""
    Write-Host "  Now perform the Sales Invoice save in the legacy app." -ForegroundColor White
    Write-Host "  Keep it to that ONE action - the less unrelated traffic, the"
    Write-Host "  cleaner the trace. Then run:  .\capture_sql.ps1 -Action Stop"
  }

  'Stop' {
    if (-not (Session-Running)) { Say-Warn "session is not running"; break }
    # Give the 5s dispatch latency time to flush before stopping.
    Say-Info "flushing buffered events"
    Start-Sleep -Seconds 7
    Invoke-Sql "ALTER EVENT SESSION [$SessionName] ON SERVER STATE = STOP;" | Out-Null
    Say-Ok "stopped - run -Action Export to read it"
  }

  'Status' {
    $exists  = Session-Exists
    $running = if ($exists) { Session-Running } else { $false }
    Write-Host "session '$SessionName': exists=$exists running=$running"
    if ($exists) {
        $logPath = Get-LogPath
        $r = Invoke-Sql @"
SELECT events = COUNT(*)
FROM sys.fn_xe_file_target_read_file(N'$logPath\$SessionName*.xel', NULL, NULL, NULL);
"@
        Write-Host "captured events: $($r.Rows[0].events)"
    }
  }

  'Export' {
    if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Force -Path $OutDir | Out-Null }
    $logPath = Get-LogPath

    # Shred the event XML server-side: pulling raw XML across the wire and
    # parsing it here would be slower and lose the typed columns.
    $read = @"
WITH raw_events AS (
    SELECT x = CAST(event_data AS xml)
    FROM sys.fn_xe_file_target_read_file(N'$logPath\$SessionName*.xel', NULL, NULL, NULL)
)
SELECT
    event_time   = x.value('(event/@timestamp)[1]', 'datetime2'),
    event_name   = x.value('(event/@name)[1]', 'nvarchar(60)'),
    database_name= x.value('(event/action[@name="database_name"]/value)[1]', 'nvarchar(128)'),
    app_name     = x.value('(event/action[@name="client_app_name"]/value)[1]', 'nvarchar(200)'),
    host_name    = x.value('(event/action[@name="client_hostname"]/value)[1]', 'nvarchar(128)'),
    login_name   = x.value('(event/action[@name="username"]/value)[1]', 'nvarchar(128)'),
    session_id   = x.value('(event/action[@name="session_id"]/value)[1]', 'int'),
    tran_id      = x.value('(event/action[@name="transaction_id"]/value)[1]', 'bigint'),
    duration_ms  = x.value('(event/data[@name="duration"]/value)[1]', 'bigint') / 1000.0,
    rows_affected= x.value('(event/data[@name="row_count"]/value)[1]', 'bigint'),
    statement    = COALESCE(
                     x.value('(event/data[@name="statement"]/value)[1]', 'nvarchar(max)'),
                     x.value('(event/data[@name="batch_text"]/value)[1]', 'nvarchar(max)'))
FROM raw_events
ORDER BY event_time, session_id;
"@
    Say-Info "reading events"
    $tbl = Invoke-Sql $read 300
    if (-not $tbl -or $tbl.Rows.Count -eq 0) {
        Say-Warn "no events captured - was the session running while you saved?"
        break
    }

    $rows = @($tbl.Rows)
    Say-Ok "$($rows.Count) events"

    if ($Contains.Count -gt 0) {
        $rows = $rows | Where-Object {
            $s = [string]$_.statement
            $keep = $false
            foreach ($t in $Contains) { if ($s -like "*$t*") { $keep = $true; break } }
            $keep
        }
        Say-Info "$($rows.Count) match -Contains ($($Contains -join ', '))"
    }

    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $csv = Join-Path $OutDir "sql-capture-$stamp.csv"
    $sqlOut = Join-Path $OutDir "sql-capture-$stamp.sql"

    $rows | Select-Object event_time, event_name, database_name, app_name, host_name,
                          login_name, session_id, tran_id, duration_ms, rows_affected, statement |
        Export-Csv -Path $csv -NoTypeInformation -Encoding UTF8
    Say-Ok "csv: $csv"

    # A readable, replay-oriented transcript. Ordered as executed, annotated so
    # the write sequence can be followed without opening a spreadsheet.
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("-- SQL captured $stamp from $Server,$Port")
    [void]$sb.AppendLine("-- databases: $($Databases -join ', ')")
    [void]$sb.AppendLine("-- $($rows.Count) statements, in execution order")
    [void]$sb.AppendLine("")
    foreach ($r in $rows) {
        [void]$sb.AppendLine("-- [$($r.event_time)] spid=$($r.session_id) tran=$($r.tran_id) db=$($r.database_name) rows=$($r.rows_affected) $($r.duration_ms)ms  app=$($r.app_name)")
        [void]$sb.AppendLine(([string]$r.statement).Trim())
        [void]$sb.AppendLine("GO")
        [void]$sb.AppendLine("")
    }
    [System.IO.File]::WriteAllText($sqlOut, $sb.ToString(), [System.Text.Encoding]::UTF8)
    Say-Ok "sql: $sqlOut"

    # The headline: which tables were actually written to.
    Write-Host ""
    Write-Host "Tables written during the capture:" -ForegroundColor White
    # Matches bare, schema-qualified and bracketed names, plus temp tables.
    # The LAST identifier is the table: [RMS].[dbo].[MP_Invoice] -> MP_Invoice.
    $pattern = '(?i)\b(?:insert\s+into|update|delete\s+from)\s+((?:\[?[#\w]+\]?\.){0,2}\[?[#\w]+\]?)'
    $tables = $rows | ForEach-Object {
        foreach ($m in [regex]::Matches([string]$_.statement, $pattern)) {
            $parts = $m.Groups[1].Value -split '\.'
            ($parts[-1] -replace '[\[\]]', '')
        }
    }
    if ($tables) {
        $tables | Group-Object | Sort-Object Count -Descending |
            ForEach-Object { "  {0,-34} {1} statement(s)" -f $_.Name, $_.Count }
        Write-Host ""
        Write-Host "  (#names are the app's own temp tables, not schema)" -ForegroundColor DarkGray
    } else {
        Write-Host "  (none - the save may not have run, or ran against another database)"
    }
  }

  'Cleanup' {
    if (-not (Session-Exists)) { Say-Info "nothing to remove"; break }
    Invoke-Sql "IF EXISTS (SELECT 1 FROM sys.dm_xe_sessions WHERE name = N'$SessionName')
                    ALTER EVENT SESSION [$SessionName] ON SERVER STATE = STOP;
                DROP EVENT SESSION [$SessionName] ON SERVER;" | Out-Null
    Say-Ok "session removed (the .xel files stay in the SQL log folder)"
  }
}
