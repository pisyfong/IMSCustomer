-- =====================================================================
-- IMS Customer — pick/pack deployment, all migrations in order.
--
-- Generated from the six scripts in sql/. Every statement is guarded, so
-- running this more than once is a no-op — safe to re-run after a partial
-- failure.
--
--   sqlcmd -S <server> -U <user> -P <pass> -d RMS -i deploy_all.sql
--
-- ⚠️  TARGET [RMS]. The app's login defaults to ACC; if these objects land
--     there the server fails with:  Invalid object name 'RMS.dbo....'
--     Each section re-asserts USE [RMS] so a runner that strips the first
--     one still can't misfile the rest.
-- =====================================================================


-- ---------------------------------------------------------------------
-- create_pick_pack_tables.sql
--   MP_Pick_List, MP_Pick_List_Item, MP_Pack_List, MP_Pack_List_Item
-- ---------------------------------------------------------------------
-- ============================================================
-- Pick / Pack tables — types matched to MP_Quote / MP_Quote_Item
-- Run against [RMS] database.
-- ============================================================

USE [RMS];
GO

-- ------------------------------------------------------------
-- MP_Pick_List (header)
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.MP_Pick_List', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MP_Pick_List (
        Company_Code         tinyint         NOT NULL,
        Pick_PreLabel        nvarchar(15)    NOT NULL,
        Location_Code        char(3)         NULL,
        Remark               nvarchar(300)   NULL,
        Batch_Count          smallint        NULL,
        Pick_Date            datetime        NULL,
        Status               char(1)         NULL,
        Total_Pick_Qty       decimal(12,4)   NULL CONSTRAINT DF_MP_Pick_List_Total_Qty  DEFAULT ((0.00)),
        Total_Pick_Item      smallint        NULL,
        Last_Modified_By     int             NULL,
        LastWriteTimeStamp   datetime        NULL,
        Added_By             int             NULL,
        Added_Date           datetime        NULL CONSTRAINT DF_MP_Pick_List_Added_Date DEFAULT (getdate()),
        Cancelled_By         int             NULL,
        Cancelled_Date       datetime        NULL,
        CONSTRAINT PK_MP_Pick_List PRIMARY KEY CLUSTERED (Company_Code, Pick_PreLabel)
    );

    CREATE INDEX IX_MP_Pick_List_Status_Date ON dbo.MP_Pick_List (Company_Code, Status, Pick_Date DESC);
    CREATE INDEX IX_MP_Pick_List_LWT         ON dbo.MP_Pick_List (LastWriteTimeStamp);
END
GO

-- ------------------------------------------------------------
-- MP_Pick_List_Item
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.MP_Pick_List_Item', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MP_Pick_List_Item (
        Company_Code         tinyint         NOT NULL,
        Pick_PreLabel        nvarchar(15)    NOT NULL,
        Sequence_No          bigint          NOT NULL,
        Sku_No               int             NOT NULL,
        Uom                  nvarchar(8)     NOT NULL,
        Parent_PreLabel      nvarchar(15)    NULL,
        Location_Code        char(3)         NULL,
        Remark               nvarchar(1000)  NULL,
        Batch                smallint        NULL,
        Status               char(1)         NULL,
        Factor               decimal(12,2)   NULL,
        Qty                  decimal(18,4)   NULL,
        Pick_Qty             decimal(18,4)   NULL,
        Last_Modified_By     int             NULL,
        LastWriteTimeStamp   datetime        NULL,
        Added_By             int             NULL,
        Added_Date           datetime        NULL,
        Cancelled_By         int             NULL,
        Cancelled_Date       datetime        NULL,
        CONSTRAINT PK_MP_Pick_List_Item PRIMARY KEY CLUSTERED
            (Company_Code, Pick_PreLabel, Sequence_No, Sku_No, Uom)
    );

    CREATE INDEX IX_MP_Pick_List_Item_Parent ON dbo.MP_Pick_List_Item (Company_Code, Parent_PreLabel);
    CREATE INDEX IX_MP_Pick_List_Item_Sku    ON dbo.MP_Pick_List_Item (Company_Code, Sku_No);
    CREATE INDEX IX_MP_Pick_List_Item_LWT    ON dbo.MP_Pick_List_Item (LastWriteTimeStamp);
END
GO

-- ------------------------------------------------------------
-- MP_Pack_List (header)
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.MP_Pack_List', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MP_Pack_List (
        Company_Code         tinyint         NOT NULL,
        Pack_PreLabel        nvarchar(15)    NOT NULL,
        Location_Code        char(3)         NULL,
        Remark               nvarchar(300)   NULL,
        Status               char(1)         NULL,
        Total_Pack_Qty       decimal(12,4)   NULL CONSTRAINT DF_MP_Pack_List_Total_Qty  DEFAULT ((0.00)),
        Total_Pack_Item      smallint        NULL,
        Last_Upload_Token    nvarchar(40)    NULL,
        Last_Modified_By     int             NULL,
        LastWriteTimeStamp   datetime        NULL,
        Added_By             int             NULL,
        Added_Date           datetime        NULL CONSTRAINT DF_MP_Pack_List_Added_Date DEFAULT (getdate()),
        Cancelled_By         int             NULL,
        Cancelled_Date       datetime        NULL,
        CONSTRAINT PK_MP_Pack_List PRIMARY KEY CLUSTERED (Company_Code, Pack_PreLabel)
    );

    CREATE INDEX IX_MP_Pack_List_Status ON dbo.MP_Pack_List (Company_Code, Status);
    CREATE INDEX IX_MP_Pack_List_LWT    ON dbo.MP_Pack_List (LastWriteTimeStamp);
END
GO

-- ------------------------------------------------------------
-- MP_Pack_List_Item
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.MP_Pack_List_Item', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MP_Pack_List_Item (
        Company_Code         tinyint         NOT NULL,
        Pack_PreLabel        nvarchar(15)    NOT NULL,
        Sequence_No          bigint          NOT NULL,
        Sku_No               int             NOT NULL,
        Uom                  nvarchar(8)     NOT NULL,
        Parent_PreLabel      nvarchar(15)    NULL,   -- source Pick_PreLabel
        Source_SQ            nvarchar(15)    NULL,   -- source SQ (distinguishes multi-SQ lines)
        Location_Code        char(3)         NULL,
        Remark               nvarchar(1000)  NULL,
        Status               char(1)         NULL,
        Factor               decimal(12,2)   NULL,
        Qty                  decimal(18,4)   NULL,   -- target = parent pick's Pick_Qty
        Pack_Qty             decimal(18,4)   NULL,
        Last_Modified_By     int             NULL,
        LastWriteTimeStamp   datetime        NULL,
        Added_By             int             NULL,
        Added_Date           datetime        NULL,
        Cancelled_By         int             NULL,
        Cancelled_Date       datetime        NULL,
        CONSTRAINT PK_MP_Pack_List_Item PRIMARY KEY CLUSTERED
            (Company_Code, Pack_PreLabel, Sequence_No, Sku_No, Uom)
    );

    CREATE INDEX IX_MP_Pack_List_Item_Parent ON dbo.MP_Pack_List_Item (Company_Code, Parent_PreLabel);
    CREATE INDEX IX_MP_Pack_List_Item_Sku    ON dbo.MP_Pack_List_Item (Company_Code, Sku_No);
    CREATE INDEX IX_MP_Pack_List_Item_LWT    ON dbo.MP_Pack_List_Item (LastWriteTimeStamp);
END
GO


-- ---------------------------------------------------------------------
-- add_pick_upload_token.sql
--   MP_Pick_List.Last_Upload_Token
-- ---------------------------------------------------------------------
-- ============================================================
-- Additive pick sync support: per-pick idempotency token.
-- Run once against [RMS] after create_pick_pack_tables.sql.
-- ============================================================
USE [RMS];
GO

IF COL_LENGTH('dbo.MP_Pick_List', 'Last_Upload_Token') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pick_List ADD Last_Upload_Token nvarchar(40) NULL;
END
GO


-- ---------------------------------------------------------------------
-- create_txn_history.sql
--   MP_Txn_History (audit + delete-propagation feed)
-- ---------------------------------------------------------------------
-- ============================================================
-- MP_Txn_History — shared, append-only action log for all modules
-- (PICK now; PACK / ORDER can reuse the same table + sync feed).
-- Modeled on Oracle MTL_MATERIAL_TRANSACTIONS: every add / pick /
-- remove / adjust / cancel / complete is recorded here.
--
-- It is BOTH the audit trail AND the delete-propagation feed: a
-- removed line is HARD deleted from its current-state table (which
-- is invisible to the LWT delta sync), so the REMOVE row here is how
-- other devices learn to drop it. It is also the tombstone consulted
-- by the server's delete-wins guard to reject stale re-inserts.
--
-- Transaction_Id is a monotonic IDENTITY → doubles as the keyset
-- cursor devices page through on download.
-- Run against [RMS].
-- ============================================================

USE [RMS];
GO

IF OBJECT_ID('dbo.MP_Txn_History', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MP_Txn_History (
        Transaction_Id     bigint          IDENTITY(1,1) NOT NULL,  -- PK + sync cursor
        Company_Code       tinyint         NOT NULL,
        Module             nvarchar(8)     NOT NULL,                -- PICK | PACK | ORDER
        Doc_PreLabel       nvarchar(15)    NOT NULL,                -- header label (Pick_/Pack_/Quote_PreLabel)
        Parent_PreLabel    nvarchar(15)    NULL,                    -- source doc (SQ for pick, pick for pack)
        Source_SQ          nvarchar(15)    NULL,                    -- pack: the source SQ (distinguishes multi-SQ lines)
        Sequence_No        bigint          NULL,
        Sku_No             int             NULL,
        Uom                nvarchar(8)     NULL,
        Action             nvarchar(12)    NOT NULL,                -- ADD | PICK | REMOVE | ADJUST | CANCEL | COMPLETE
        Qty_Change         decimal(18,4)   NULL,                    -- signed delta applied by this action
        Qty_After          decimal(18,4)   NULL,                    -- resulting current-state qty (NULL for REMOVE)
        Planned_Qty        decimal(18,4)   NULL,                    -- line planned Qty at the time
        Location_Code      char(3)         NULL,
        Remark             nvarchar(300)   NULL,
        Upload_Token       nvarchar(40)    NULL,                    -- links rows to the upload batch that produced them
        Action_By          int             NULL,                    -- user who performed it
        Action_Date        datetime        NULL,                    -- client business time of the action
        Server_Date        datetime        NOT NULL
            CONSTRAINT DF_MP_Txn_History_Server_Date DEFAULT (getdate()),
        CONSTRAINT PK_MP_Txn_History PRIMARY KEY CLUSTERED (Transaction_Id)
    );

    -- Download feed: pull a module's rows for a company since a cursor, in order.
    CREATE INDEX IX_MP_Txn_History_Feed
        ON dbo.MP_Txn_History (Company_Code, Module, Transaction_Id);

    -- Delete-wins lookup: what was the latest action on this line?
    CREATE INDEX IX_MP_Txn_History_Line
        ON dbo.MP_Txn_History (Company_Code, Module, Doc_PreLabel, Sku_No, Uom);
END
GO


-- ---------------------------------------------------------------------
-- add_pack_writeback_cols.sql
--   MP_Pack_List.Last_Upload_Token, MP_Pack_List_Item.Qty
-- ---------------------------------------------------------------------
-- ============================================================
-- Pack writeback support: idempotency token on the header and a
-- target Qty on the item (the qty picked on the parent pick that
-- Pack_Qty accumulates toward). Mirrors the pick tables.
-- Run once against [RMS]. Idempotent.
-- ============================================================
USE [RMS];
GO

IF COL_LENGTH('dbo.MP_Pack_List', 'Last_Upload_Token') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pack_List ADD Last_Upload_Token nvarchar(40) NULL;
END
GO

IF COL_LENGTH('dbo.MP_Pack_List_Item', 'Qty') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pack_List_Item ADD Qty decimal(18,4) NULL;
END
GO


-- ---------------------------------------------------------------------
-- add_pack_source_sq.sql
--   Source_SQ on MP_Pack_List_Item + MP_Txn_History
-- ---------------------------------------------------------------------
-- ============================================================
-- Pack line source-SQ tag. A pack line is parented to its pick but
-- also records the source SQ, so the same SKU picked from two SQs
-- stays as two distinct pack lines (identity = pick + Source_SQ +
-- sku + uom). MP_Txn_History carries it too for precise delete-wins.
-- Run once against [RMS]. Idempotent.
-- ============================================================
USE [RMS];
GO

IF COL_LENGTH('dbo.MP_Pack_List_Item', 'Source_SQ') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pack_List_Item ADD Source_SQ nvarchar(15) NULL;
END
GO

IF COL_LENGTH('dbo.MP_Txn_History', 'Source_SQ') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Txn_History ADD Source_SQ nvarchar(15) NULL;
END
GO


-- ---------------------------------------------------------------------
-- add_assigned_to.sql
--   Assigned_To on MP_Pick_List + MP_Pack_List
-- ---------------------------------------------------------------------
-- ============================================================
-- Assignment: who a pick / pack belongs to. References
-- PI_Users.User_ID. Defaults to the creating user client-side.
-- Run once against [RMS]. Idempotent.
-- ============================================================
USE [RMS];
GO

IF COL_LENGTH('dbo.MP_Pick_List', 'Assigned_To') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pick_List ADD Assigned_To int NULL;
END
GO

IF COL_LENGTH('dbo.MP_Pack_List', 'Assigned_To') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pack_List ADD Assigned_To int NULL;
END
GO


-- ---------------------------------------------------------------------
-- add_pack_source_si.sql
--   Source_SI on MP_Pack_List_Item + MP_Txn_History, and its index
-- ---------------------------------------------------------------------
-- ============================================================
-- Pack line source-SI tag. A pack can be built straight off a
-- sales invoice, which has no pick behind it, so those lines
-- carry a NULL Parent_PreLabel and are identified by Source_SI.
-- Part of the line IDENTITY: without it the same SKU/UOM packed
-- for two invoices collides on one row.
-- Run once against [RMS]. Idempotent.
-- ============================================================
USE [RMS];
GO

IF COL_LENGTH('dbo.MP_Pack_List_Item', 'Source_SI') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Pack_List_Item ADD Source_SI nvarchar(30) NULL;
END
GO

IF COL_LENGTH('dbo.MP_Txn_History', 'Source_SI') IS NULL
BEGIN
    ALTER TABLE dbo.MP_Txn_History ADD Source_SI nvarchar(30) NULL;
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes
               WHERE name = 'IX_MP_Pack_List_Item_Source_SI'
                 AND object_id = OBJECT_ID('dbo.MP_Pack_List_Item'))
BEGIN
    CREATE INDEX IX_MP_Pack_List_Item_Source_SI
        ON dbo.MP_Pack_List_Item (Company_Code, Source_SI)
        INCLUDE (Sku_No, Uom, Qty, Pack_Qty, Status, Pack_PreLabel);
END
GO


-- =====================================================================
-- Verification — every row must report 'OK'.
-- =====================================================================
USE [RMS];
GO

SELECT 'MP_Pick_List'        AS Object, CASE WHEN OBJECT_ID('dbo.MP_Pick_List')        IS NOT NULL THEN 'OK' ELSE 'MISSING' END AS Status
UNION ALL SELECT 'MP_Pick_List_Item', CASE WHEN OBJECT_ID('dbo.MP_Pick_List_Item') IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List',      CASE WHEN OBJECT_ID('dbo.MP_Pack_List')      IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List_Item', CASE WHEN OBJECT_ID('dbo.MP_Pack_List_Item') IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Txn_History',    CASE WHEN OBJECT_ID('dbo.MP_Txn_History')    IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pick_List.Last_Upload_Token',   CASE WHEN COL_LENGTH('dbo.MP_Pick_List','Last_Upload_Token')   IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pick_List.Assigned_To',         CASE WHEN COL_LENGTH('dbo.MP_Pick_List','Assigned_To')         IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List.Last_Upload_Token',   CASE WHEN COL_LENGTH('dbo.MP_Pack_List','Last_Upload_Token')   IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List.Assigned_To',         CASE WHEN COL_LENGTH('dbo.MP_Pack_List','Assigned_To')         IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List_Item.Qty',            CASE WHEN COL_LENGTH('dbo.MP_Pack_List_Item','Qty')            IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List_Item.Source_SQ',      CASE WHEN COL_LENGTH('dbo.MP_Pack_List_Item','Source_SQ')      IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Txn_History.Source_SQ',         CASE WHEN COL_LENGTH('dbo.MP_Txn_History','Source_SQ')         IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Pack_List_Item.Source_SI',      CASE WHEN COL_LENGTH('dbo.MP_Pack_List_Item','Source_SI')      IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Txn_History.Source_SI',         CASE WHEN COL_LENGTH('dbo.MP_Txn_History','Source_SI')         IS NOT NULL THEN 'OK' ELSE 'MISSING' END;
GO

-- These two must already exist (used by the location picker + Assigned To).
-- They are NOT created here — they belong to the wider RMS schema.
SELECT 'PI_Company_Location'              AS Object, CASE WHEN OBJECT_ID('dbo.PI_Company_Location')              IS NOT NULL THEN 'OK' ELSE 'MISSING' END AS Status
UNION ALL SELECT 'PI_User_Company_Access_Location', CASE WHEN OBJECT_ID('dbo.PI_User_Company_Access_Location') IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'PI_Users',                        CASE WHEN OBJECT_ID('dbo.PI_Users')                        IS NOT NULL THEN 'OK' ELSE 'MISSING' END
-- Read by the pick -> SI conversion. A missing one surfaces only when someone
-- tries to create an invoice, which is the worst moment to find out.
UNION ALL SELECT 'MP_Invoice',               CASE WHEN OBJECT_ID('dbo.MP_Invoice')               IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Invoice_Item',          CASE WHEN OBJECT_ID('dbo.MP_Invoice_Item')          IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'MP_Invoice_Batch',         CASE WHEN OBJECT_ID('dbo.MP_Invoice_Batch')         IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'PI_Counter_Auto_Prelabel', CASE WHEN OBJECT_ID('dbo.PI_Counter_Auto_Prelabel') IS NOT NULL THEN 'OK' ELSE 'MISSING' END
UNION ALL SELECT 'PI_Counter',               CASE WHEN OBJECT_ID('dbo.PI_Counter')               IS NOT NULL THEN 'OK' ELSE 'MISSING' END;
GO
