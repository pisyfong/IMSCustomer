# Picking module — deployment runbook

Tracks every DB migration + backend change needed to stand up the picking
writeback / audit feature on a fresh environment. All SQL targets the **[RMS]**
database and is **idempotent** (safe to re-run).

Backend: `ims_customer_api_realtime` (`server.js`, Node + `mssql`, port 1194).
Client: `IMSCustomer` Flutter app (Isar local cache).

---

## 1. SQL migrations — run in this order

| # | Script | Purpose | Dev [RMS] | MDS Sarawak | YeonTak |
|---|--------|---------|-----------|-------------|---------|
| 1 | [create_pick_pack_tables.sql](create_pick_pack_tables.sql) | Creates `MP_Pick_List`, `MP_Pick_List_Item`, `MP_Pack_List`, `MP_Pack_List_Item` | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 2 | [add_pick_upload_token.sql](add_pick_upload_token.sql) | Adds `MP_Pick_List.Last_Upload_Token` (idempotency token for additive delta upload) | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 3 | [create_txn_history.sql](create_txn_history.sql) | Creates `MP_Txn_History` (shared audit log + delete-propagation feed) | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 4 | [add_pack_writeback_cols.sql](add_pack_writeback_cols.sql) | Adds `MP_Pack_List.Last_Upload_Token` + `MP_Pack_List_Item.Qty` (pack writeback) | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 5 | [add_pack_source_sq.sql](add_pack_source_sq.sql) | Adds `Source_SQ` to `MP_Pack_List_Item` + `MP_Txn_History` (keeps same-SKU-different-SQ pack lines distinct) | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 6 | [add_assigned_to.sql](add_assigned_to.sql) | Adds `Assigned_To` (→ `PI_Users.User_ID`) to `MP_Pick_List` + `MP_Pack_List` | ✅ applied | ✅ applied | ✅ 2026-08-12 |
| 7 | [add_pack_source_si.sql](add_pack_source_si.sql) | Adds `Source_SI` to `MP_Pack_List_Item` + `MP_Txn_History`, and `IX_MP_Pack_List_Item_Source_SI` (lets a pack be built straight off a sales invoice; keeps same-SKU-different-invoice lines distinct) | ✅ applied | ❌ **not yet** | ✅ 2026-08-12 |

> **2026-08-12 — YEONTAK DATABASE DONE.** `deploy_all.sql` applied to
> `yeontak.dyndns.org,8887` (`BJNJL83-PC\SQLEXPRESS`) → `[RMS]`, the LIVE
> trading database (270,393 invoices, newest dated 2026-08-11). All **22**
> verification rows `OK`. This was a FRESH install, not an update — none of
> the pick/pack objects existed here; the 2026-08-06 note below refers to a
> different customer's server, and the old single "Prod" column hid that.
>
> Every statement is confined to our own tables (`MP_Pick_List*`,
> `MP_Pack_List*`, `MP_Txn_History`) — no legacy table is altered and there is
> no `DROP`/`DELETE`/`TRUNCATE` anywhere in the script.
>
> Pre-flight checks that passed on this server:
> - `[ACC].[dbo].[AR_Customer]` readable — 1,230 rows (customer names)
> - `PI_Company_Location.Location_Doc_Prelabel` populated
>   (`AA`/`AR`/`YC`/`CA`/`YT`) ⇒ the MONTHLY SI numbering engages, and the
>   next numbers continue the legacy series exactly: `YTSI-2608/0323` after
>   the live `YTSI-2608/0322`, `ARSI-2608/0501` after AR's 500
> - Open invoice batches per location: AA 9, AR 6, YC 6, YT 3 — several
>   everywhere, so the operator MUST pick one and the server's refusal to
>   guess is load-bearing here
>
> **Still outstanding on this server: the Node backend itself.** The API is
> not reachable on port 1194 from outside, so `server.js` +
> `config/database.js` still have to be copied onto that box and the service
> restarted. Until then the database is ready but no device can use it.
>
> **2026-08-06 — MDS SARAWAK SERVER DONE.** `deploy_all.sql` applied to
> `192.168.1.2\sqlexpress:7979` → `[RMS]` (the customer's own SQL Express):
> 21 batches, 15/15 `OK`, including the three `PI_*` tables the app depends on
> but does not create.
>
> **2026-08-06 (dev):** the same script was executed end-to-end
> against `192.168.16.75ungseng:54112` → `[RMS]` — 21 batches, all 15
> verification rows `OK`. That instance holds **4,860 quotes / 14 picks / 4
> packs**, i.e. the live dataset, and is the same host the app's API connects
> to. **If that is the production database, §1 is already done** — confirm
> before assuming a separate prod instance still needs it.
>
> Run it with `node run_migrations.js sql/deploy_all.sql` from the API folder
> (splits on `GO`, which `mssql` doesn't understand, and stops at the first
> failure), or with `sqlcmd -d RMS -i`.

### How to run against a target DB
> ⚠️ The backend's DB login defaults to the **`ACC`** database, not `RMS`. Every
> object must be created **in RMS** (`USE [RMS]` / `sqlcmd -d RMS`) — the server
> reads/writes fully-qualified `[RMS].[dbo].[…]` names. If a migration runner
> strips the `USE [RMS]`, the object silently lands in `ACC` and the server
> fails with `Invalid object name 'RMS.dbo.…'`.

Each file contains `USE [RMS]` + `GO` batches — run in SSMS/`sqlcmd`:
```
sqlcmd -S <server> -d RMS -i sql/create_pick_pack_tables.sql
sqlcmd -S <server> -d RMS -i sql/add_pick_upload_token.sql
sqlcmd -S <server> -d RMS -i sql/create_txn_history.sql
```

---

## 2a. Backend is shipped as a single .exe

From 2026-08-15 the backend goes to customers as **one bytecode-compiled
executable**, not as source + `node_modules`:

```
node <node22>/node.exe <pkgtool>/node_modules/@yao-pkg/pkg/lib-es5/bin.js      server.js --targets node22-win-x64 --output dist/ims-api.exe
```

Ship `ims-api.exe` + `.env` + `sql/`. Nothing else.

> ⚠️ **Never pass `--config package.json`.** With it, pkg embeds every source
> file as plain text — the complete logic, comments included — while still
> reporting a successful build. Check every build before shipping:
> `grep -a -c "app.post('/api/pick-invoices'" dist/ims-api.exe` must print `0`.

Build host must be **Node 22** (bytecode is locked to the host V8, and only
Node 22 prebuilts exist in pkg-fetch). `bcryptjs` replaces native `bcrypt`,
which cannot live inside a single-file snapshot; its hashes are compatible in
both directions so existing activation keys still validate.

Protects control flow, NOT strings: SQL text and column names remain visible in
the V8 string table.

---

## 2. Backend (`server.js`) — endpoints that must ship together

These depend on the tables above; deploy after the SQL, then **restart the
Node service** (it does not hot-reload).

- `POST /api/picks` — pick header upsert; logs `CANCEL`/`COMPLETE` to `MP_Txn_History` on status change.
- `POST /api/pick-items` — additive delta apply, wrapped in a **transaction** with `UPDLOCK, HOLDLOCK` (atomicity + concurrency guards). Handles `removals[]` (hard-delete + `REMOVE` log) and the **delete-wins** guard against stale resurrection.
- `GET /api/txn-history` — keyset feed (`Transaction_Id` cursor) devices drain to converge removals.
- `POST /api/pack-items` — also enforces **Rule 2b**, the allocation cap for invoice-sourced lines (`Source_SI`): a line's ceiling is `SUM(Quantity + Foc)` on `MP_Invoice_Item`. Without it those lines have no parent pick and so no bound at all.
- Base-table download methods: `getMpPickListPage`, `getMpPickListItemPage`, `getMpPackListPage`, `getMpPackListItemPage`.
- Helper: `insertTxnHistory()`.

Config: `config/database.js` reads `DB_*` from `.env` (not committed) — ensure the
target env has `DB_USER/PASSWORD/SERVER/DATABASE/PORT` set.

---

## 3. Client (Flutter) — build note

New Isar fields require regenerating adapters before building:
```
flutter pub run build_runner build --delete-conflicting-outputs
```
Fields added: `PickList.uploadToken`, `PickListItem.baselinePickQty`,
`SyncCheckpoint.lastCursorId`, `GroupLookup.taxonomyMode`, `DepartmentLookup.taxonomyMode`.
New collections: `AppUser`, `AppLocation`, `SelectedLocation`, `PrinterSettings`
— all registered in `main.dart`'s schema list.

The `GroupLookup`/`DepartmentLookup` `taxonomyMode` change is client-only (no
SQL). A one-time startup migration (`InventoryService.migrateLegacyLookupModes`,
called from `main.dart`) stamps pre-existing lookup rows as `pi`. No server
schema change — but the backend must expose the web-taxonomy hub methods
(`getWebGroupLookup`/`getWebGroups`, `getWebDeptLookup`/`getWebDepts`) for web
descriptions to sync.

---

## 4. Cutover to a customer server

Everything below has to change together — a half-cut device talks to two
servers and the symptoms are baffling. Work top to bottom.

### 4.1 Collect from the customer first

| Value | Used by | Currently |
|---|---|---|
| API host + port | app ↔ Node | `192.168.16.182:1194` (dev) |
| SQL Server host / instance / port | Node ↔ DB | `.env` `DB_SERVER` / `DB_PORT` |
| SQL login + password with rights on `[RMS]` | Node ↔ DB | `.env` `DB_USER` / `DB_PASSWORD` |
| Image host + path | inventory photos | `fungseng.dyndns.org:88/ItemMasterImages` |
| Their `Company_Code`(s) | image map, all scoping | `1` |
| Their `Location_Code`(s) | quotation items | resolved from `PI_Company_Location` |
| AppKey per device | licence gate | issued in `ims-license-admin-web` |

### 4.2 Database

Run [deploy_all.sql](deploy_all.sql) — all six migrations from §1 in order,
plus a verification block that must report `OK` on every row:

```
sqlcmd -S <server> -U <user> -P <pass> -d RMS -i sql/deploy_all.sql
```

Every statement is guarded, so re-running is a no-op — safe after a partial
failure.

> ⚠️ The login defaults to **`ACC`**. Target RMS explicitly (`sqlcmd -d RMS`)
> or the objects land in the wrong database and the server fails with
> `Invalid object name 'RMS.dbo.…'`.

### 4.3 Backend service

Copy the API folder to the customer's server, then from that folder:

```powershell
.\prepare-server.ps1 `
    -DbServer "192.168.16.75ungseng" -DbPort 54112 `
    -DbUser <login> -ApiPort 1194 `
    -ApiKey "<shared secret>" -PublicHost "<this server>" `
    -StartWithPm2
```

Seven steps, each reporting `[OK]` / `[WARN]` / `[FAIL]`:

1. **Prerequisites** — Node ≥ 18, npm, code present
2. **Dependencies** — `npm install --production`
3. **Configuration** — writes `.env`; keeps an existing one unless `-Force`
   (backing it up first) and generates a random `JWT_SECRET` rather than
   templating one
4. **Database** — `check_db.js`: connect, read `[RMS]`, read **`[ACC]`**, and
   confirm the pick/pack objects exist
5. **Migrations** — runs `sql/deploy_all.sql` and prints the 15-row verification
6. **Firewall** — inbound rule for the API port (needs an elevated shell)
7. **Start + smoke test** — pm2, then calls the API; with `-ApiKey` set it also
   checks an unauthenticated call is **rejected**, so the gate is proven active
   rather than assumed

Omit `-DbPassword` and it prompts securely. Re-runnable: nothing is destructive
and the migrations are idempotent. Exits non-zero if anything failed, so it
can gate a wider deployment script.

> The `[ACC]` check in step 4 is the one that earns its keep. Every query is
> fully qualified — 103 × `[RMS].[dbo]` and exactly one ×
> `[ACC].[dbo].[AR_Customer]` — so a login granted RMS only makes customer
> lookups fail while everything else looks perfectly healthy.

`deploy.ps1` still handles copying files and registering a Windows service
(`-UseNSSM`); `prepare-server.ps1` owns configuration and verification.

### 4.4 Client — `lib/config/app_config.dart`

All deployment settings are in one block at the top of that file. Set them,
then rebuild:

```bash
flutter build apk --release
```

| Constant | Notes |
|---|---|
| `_isDevelopment` | `false` for a customer build |
| `_productionDomain` / `_productionPort` | the **customer's** server |
| `_protocol` | `https` if TLS is terminated in front |
| `_productionImageBaseUrl` | photo host, e.g. `http://host:88/ItemMasterImages` — a **separate web server**; the Node API serves no images. **Blank = photos disabled**, which is correct for a site with no image server |
| `_apiKey` | must match `API_KEY` in the server's `.env`; blank on both sides disables the check |

> `_productionDomain` ships as `CHANGE-ME` on purpose. It used to hold one of
> our own dyndns hosts, so flipping `_isDevelopment` moved a device from one of
> our servers to another rather than onto the customer's — and nothing
> complained.

**Confirm before handing over a device.** `AppConfig.printConfig()` logs the
resolved values at startup; that line is the only reliable answer to "which
server is this handheld talking to".

> Image URLs now resolve through `CompanyImageConfig` → `AppConfig`. There is
> no second copy in `inventory_page.dart` any more, so the config can't be
> fixed while one screen keeps loading from the old host.

> The licence Worker URL in `lib/services/license_service.dart` is shared by
> every IMS app and customer — **leave it alone**.

> Still customer-visible and NOT in `AppConfig`: the quotation PDF letterhead
> carries our own contact details (`checkout_page.dart`,
> `quotation_pdf_service.dart` — search `fungseng22@gmail.com`).

### 4.5 Licences

1. In `ims-license-admin-web`, create one AppKey per device with
   `app = IMS-Customer`.
2. Set **`custom_1`** to that device's document prefix. It must be **unique per
   device** — two devices sharing a prefix mint identical `Pick_PreLabel`s and
   `/api/picks` upserts them into a single merged pick.
3. Set `company_name`, `expiry_date`, and `master_url` (see 4.7).
4. Activate each handheld once, online. Binding is by a per-install UUID, so a
   **reinstall** needs an admin **unbind**.

### 4.6 Decide before go-live

- **Set `API_KEY`.** The seven writeback endpoints now require a matching
  `X-API-Key`, but only when `API_KEY` is set in the server `.env`. Set it there
  **and** in `AppConfig._apiKey`, then rebuild the APK. Leaving both blank keeps
  the endpoints open. Perimeter control only — the key ships inside the APK, and
  `Action_By` is still whatever the client claims, so the audit log is
  self-reported.
- **`Company_Code` is `TinyInt`** in `MP_Pick_List`, `MP_Pack_List` and
  `MP_Txn_History`, matching the surrounding `MP_*` tables — 255 companies max.
  A schema decision, not a defect; changing it means altering our tables and
  diverging from the rest of RMS.

### 4.7 `master_url` is currently ignored

Licensing is deployed **gates-only**: the client reads `master_url` from the
licence and caches it, but `AppConfig`'s hardcoded host still wins. The keys in
KV today carry `http://192.168.16.75:2009/api/` — a different port *and* a path
from what `AppConfig` uses (`:1194`, no path), so it looks copied from IMS
Procurement rather than set for this app.

Either set `master_url` correctly per customer and switch the client to consume
it (removing step 4.4.1 from every future cutover), or leave it and treat
`AppConfig` as the single source of truth. **Don't leave it half-done** — a
wrong `master_url` that nothing reads is a trap for whoever enables it next.

### 4.8 Verify on the device

1. Activate with the AppKey → expect the prefix to appear in the pick number.
2. **Settings → Full Sync.** Watch the log for all 10 steps and specifically
   `✓ customers: N`. `N = 0` means the customer master isn't arriving —
   receipts will print a customer code with no name.
3. Create a pick → Save → the dialog must reach **Synced**, not *Saved offline*.
4. Confirm the row in `[RMS].[dbo].[MP_Pick_List]` on the customer's DB.
5. Pack it, print a receipt, scan the printed barcode back into the app.
6. Pull the network, edit, Save → expect **Saved offline**; restore, sync,
   confirm the delta applied exactly once.

## Changelog
- 2026-08-12 — **Multi-UOM / loose pick lines were rejected on sync as
  "Over-allocated".** `/api/pick-items` Rule 2 capped allocation per
  (SQ, sku, UOM) against `SUM(Quote_Quantity)`. Two things were wrong with
  that. A quote row demanding "20 CTN + 30 loose" stores the cartons against
  `Uom='CTN'` and the singles in `Quote_Quantity_Loose` with NO row of their
  own; the app correctly splits that into a CTN line and a base-UOM line
  (factor 1, remark 'LOOSE'), but the per-UOM lookup then searched the quote
  for `Uom='KG'`, found nothing, and refused the whole upload — measured cap
  0 against a real demand of 230. It also summed only `Quote_Quantity` while
  the app allocates `Quote_Quantity + Quote_Foc`, so any line with free goods
  failed once the FOC was picked.
  Rule 2 now compares BASE UNITS per (SQ, sku): allocation as
  `SUM(Qty * Factor)`, demand as
  `SUM((Quote_Quantity + Quote_Foc) * Factor + Quote_Quantity_Loose + Quote_Foc_Loose)`.
  Verified on ARSQ-2606/1112 sku 604: 20 CTN (factor 10) + 30 KG = 230 accepted,
  the 231st base unit still rejected. The client cap stays per-UOM and is
  therefore the tighter of the two, so nothing became more permissive in
  practice.
- 2026-08-12 — **Invoice batch is now the operator's choice, not a guess.**
  The conversion took `TOP 1 ... WHERE Status='O' ORDER BY Batch_No DESC` when
  the caller sent no `batchNo`, and the app never sent one. Batch names encode
  a date AND a product category ("AA 14072026(BMF)", "AR 10082026(F&V)") and
  this database has up to NINE open at once for one location, so the highest
  number is meaningless — all 14 conversions to date were filed under a July
  "(BMF)" batch during August. The legacy trace confirms the batch is picked
  by the user: it lists every batch for the location, then the save only
  verifies `Status='O'` (and never updates the batch totals, which we match).
  New `GET /api/invoice-batches?companyCode&locationCode` lists open batches;
  the conversion now REFUSES with 409 `Choose an invoice batch` (returning the
  list) when no batch is given and more than one is open. One open batch is
  unambiguous and still auto-selects. The allocation screen has a batch bar,
  preselected only when there is exactly one, required before Create, and named
  in the confirm dialog — it is the one field nobody can verify from the
  finished invoice.
  `Representative_ID` was already correct: taken from the source SQ's header,
  0 for no-SQ invoices.
- 2026-08-12 — **Packing revamp: no shelf, invoice-aware grouping, per-invoice
  pack slips.** Shelf/bin is gone from the pack page (state, hydration, walk-
  order sort, the chip and the line display) — a packer works from a staged
  trolley, not the racking; picking keeps it.
  Grouping by Invoice showed "No invoice" for every line added from a pick,
  because only lines added straight off an SI carry `Source_SI`. Pick-sourced
  lines now resolve through `MP_Invoice.App_DL_Prelabel` (the pick) +
  `Web_Link_Prelabel` (the SQ), falling back to the SQ alone; both columns are
  now `@Index()`ed on the Isar `Invoice` model (requires build_runner).
  Printing gained a mode: when a pack spans several invoices it asks, and "one
  slip per invoice" prints N slips, each carrying its own `Invoice` and
  `Slip n of N` header and only that invoice's lines. The preview shows slip 1
  and confirming sends the rest on the SAME template — `ReceiptPreviewDialog`
  takes an optional `buildRest`, so template choice stays in one place. Lines
  with no invoice yet are counted in the chooser, since they are left off the
  per-invoice slips.
- 2026-08-12 — **Pick/pack detail pages kept stale state after save+sync.**
  Save sets `isSynced = false` on the header object the page holds and then
  uploads; the upload writes the ROW (isSynced, and any status/totals the
  server settled on) but nothing copied that back. The page went on believing
  the document was unsynced, so "Create invoices" refused with "this pick has
  not been uploaded yet" until you left the screen and re-entered. Both pages
  now `_refreshHeader()` after a successful upload — copying field-by-field so
  every existing `widget.pick.x` read stays valid — and reload their lines,
  which matters beyond display: the services re-baseline each accepted line
  against the server, and a stale `baselinePickQty` makes the NEXT save resend
  a delta the server already applied.
  Also, returning from a successful SI conversion now pulls `syncAll` and
  reloads: the conversion completes the pick, cancels unpicked lines and
  creates the invoices entirely server-side, so without it the screen still
  showed an open pick and offered to invoice it again.
- 2026-08-12 — **Customer names missing on the picking/packing hubs.** The hub
  rows, the home page and the printed receipt looked customers up with
  `.companyCodeEqualTo(cc)`. `AR_Customer` (in **ACC**, not RMS) is partitioned
  by `Company_Code`, but the documents referencing it are not: of 795 customer
  codes on quotes only 246 exist under company 1, while 794 exist under some
  company — and every pick in the app's own test data points at a customer
  that exists only under company 4, so not one name resolved. All four lookups
  are now code-only, and the hubs render through `CustomerLabel.format` instead
  of their own `CODE — NAME` spelling. The detail pages and add-items sheets
  were already correct; this is the same trap being reintroduced a third time.
- 2026-08-12 — **Pick close-out after SI: unpicked lines are cancelled, not
  zeroed.** The close-out shrank every line's planned `Qty` to `Pick_Qty` so
  the shortfall returned to the SQ balance. Correct for a partly-picked line,
  wrong for one that delivered nothing: it became `0` of `0`, which every
  completeness check in the app reads as done, so a line nobody ever picked
  displayed as a green success. Those lines are now `Status='X'` with
  `Cancelled_By`/`Cancelled_Date`, which releases their SQ allocation by the
  same rule and hides them where cancelled lines are already hidden.
  Partly-picked lines still shrink. The response and `MP_Txn_History` remark
  now carry `cancelledLines` alongside `shortedLines`.
  Client: the pick page reads which invoices a pick already produced (via
  `MP_Invoice.App_DL_Prelabel`) and refuses to reopen the conversion flow,
  naming them. The server guard is unchanged and remains the real one — it
  re-checks under `UPDLOCK` so two devices racing the same pick cannot both
  win; same-token replays still return the original invoices idempotently.
- 2026-08-12 — **Delta sync could silently stop delivering rows.** Devices store
  a server-produced `LastWriteTimeStamp` watermark and later ask for
  `>= watermark`; if the two clocks disagree, or the serialisation of that
  timestamp changes, the watermark moves ahead of the server and the feed
  skips rows FOREVER while still logging "0 rows" as though healthy. The
  `useUTC` fix did exactly that — stored watermarks sat ~8h in the future and
  invoices created afterwards stopped arriving. Two guards now:
  every delta ASKS from `watermark - 12h` (rows upsert on deterministic ids,
  so re-covering that ground is free), and a watermark further ahead than the
  overlap can absorb is reset with a loud log. The watermark still ADVANCES
  from what was actually seen — seeding it from the overlapped value would
  walk it backwards 12h on every empty sync.
  Also: `FromSiTab` now delta-syncs invoices when it opens and on a Refresh
  button (`BaseTransactionSyncService.syncInvoices`, invoice tables only).
  Invoices are created elsewhere, so the screen has no local event to react to
  and previously showed whatever the last hub pull had left behind.
- 2026-08-12 — **SI numbering corrected to the customer's actual scheme, and a
  timezone fix.** The conversion minted `AA/SI/000001` from
  `PI_Company_Location.SI_Prelabel + pad6(SI_Running_No)` — faithful to the
  traced FST save, but that trace came from a different install. This customer
  numbers per location per MONTH:
  `{Location_Doc_Prelabel}SI-{YYMM}/{pad4}`, counted in
  `PI_Counter_Auto_Prelabel` (Module `SI`, `Date` = month start, `Adj_Code`
  blank), restarting at 0001 each month — 93,300 of 93,306 invoices over two
  years match, and it is the only rule that explains location YC1 numbering as
  `CASI-` (`Location_Doc_Prelabel` = 'CA'). The endpoint now picks the scheme
  from `Location_Doc_Prelabel`: set → monthly, blank → the old flat scheme.
  Note the two counters differ: `PI_Counter_Auto_Prelabel.Running_No` is the
  LAST number used, `SI_Running_No` is the NEXT one.
  Separately, `config/database.js` now sets **`useUTC: false`** — the driver
  was converting every bound date to UTC, so on this UTC+8 host an invoice
  dated 12 Aug was stored as `2026-08-11 16:00` (wrong day, invisible to any
  date-range report) and device-supplied `Action_Date`s were 8 hours early.
  Verified end to end: `AASI-2608/0001`, `Invoice_Date`/`Due_Date`/`PP_Due_Date`
  clean midnight, `Delivered_Date` = invoice date + save clock, counter row
  created at `2026-08-01` with `Running_No` 1.
- 2026-08-11 — **Pack from Sales Invoice ("From SI").** A pack can now be built
  directly off an SI, which is a source in its own right rather than a view onto
  the pick flow — only 37 of 270,285 invoices carry any pick reference, none
  recent, so these lines have a NULL parent pick. New column `Source_SI` joins
  the pack line identity everywhere it is addressed (Isar id, server `lineKey`,
  `LINE_MATCH` WHERE clause, removals + delete-wins, history, re-baseline,
  detail-page grouping); without it the same SKU/UOM packed for two invoices
  collided on one row. New Rule 2b caps allocation at the invoiced quantity.
  New Isar field `PackListItem.sourceSi` — appended to the id hash ONLY when
  set, so existing pick/SQ line ids are unchanged and devices do not
  re-insert their pack tables. SQL: `add_pack_source_si.sql`.
  No writeback to `MP_Invoice`: pack state stays in the pack tables.
- 2026-08-11 — **Pick → Sales Invoice conversion (backend).** New
  `POST /api/pick-invoices` in `server.js`: one MP_Invoice per source SQ plus
  one for no-SQ lines, quantities from `Pick_Qty`, prices from the SQ (loose
  lines from `In_Stock_Uom`), stock committed via
  `Qty_On_Trading += (qty+foc)×factor+loose`, SI numbers from
  `PI_Company_Location.SI_Running_No` under UPDLOCK, line ids from
  `PI_Counter 'MP_ITEM_NO'`, all invoices in one transaction. The write
  sequence is transcribed from three Extended-Events traces of the legacy
  save (`FST/SI/010075..77`) — design + traced facts in
  [SI_CONVERSION_DESIGN.md](SI_CONVERSION_DESIGN.md). Supports `dryRun`.
  **No SQL migration needed** — uses existing legacy tables only. Not yet
  exposed in the app; cross-check against a legacy invoice comes first.

- 2026-08-10 — **API-side name normalisation (compatibility shim for old handhelds).** `getCustomers` in `server.js` now trims `Name` and collapses internal whitespace runs on the way out, so devices still on the pre-redesign build stop hitting the blank-page crash below. Chosen over cleaning `[ACC].[dbo].[AR_Customer]` because that is the customer's live accounting master data and trailing spaces are its normal convention — a one-off `UPDATE` would be a recurring chore, whereas the shim also covers names typed badly in future. Verified against dev: 426 rows in, 426 out, 381 names normalised, and the count of customers that crash the old build goes **2 → 0**. Requires a Node restart plus a customer re-sync on each device (the sync wipes and rewrites the whole company).
  > Note while editing: `server.js` declares `getCustomers` **twice** in the same class (≈1971 and ≈3442). JS keeps the last one, so the earlier definition is dead code that looks live. The patch is on the one that actually runs; be careful not to "fix" the wrong one.
- 2026-08-10 — **Blank ordering page for customer `11/G02` (fixed by the ordering redesign).** The old hub built its avatar initials with `name.split(' ')` and then indexed `[0]` and `[1]`. `AR_Customer.Name` for that customer is `'GROCERY '` — one word plus a trailing space — so the split yields `['GROCERY', '']` and `''[0]` throws `RangeError`. The throw happened inside `build()`, so Flutter swapped the entire page for its release `ErrorWidget`: a blank screen with no message and nothing in logcat. The redesign replaced that helper with `UiAvatar.initialsFor`, which trims, splits on `\s+` and drops empties, so the crash is gone. Pinned by `test/avatar_initials_test.dart`.
  > Two things made this hard to find, both worth remembering. **Trailing spaces are the norm here, not the exception** — 111 of 426 customer names in dev carry one — so the bug needed only a single-word name to land on it. And the hub reads the **raw `Name`** via `CustomerStateService.getSelectedCustomerInfo()`, while the customer picker shows `Customer.displayName` (which prefers `Name2`). For this customer `Name2` is a clean `'GROCERY'`, so the picker looked fine and any SQL written against `displayName` — as mine was — reports the row as harmless. Diagnose avatar/name bugs against the **raw** column.

- 2026-08-06 — **Shelf position on pick lines.** `In_Stock_Location.Location` (the bin/shelf string, NOT `Location_Code`) was never mapped into Isar; added as `InStockLocation.shelf` and shown on each SKU card in the pick detail, in the picking accent with a shelf icon. It is free text that can list several bins in one string, so it is displayed **as written** — the separator is whatever the customer types and parsing it would mangle valid labels. Rows are matched to the pick's own site; a pick with no site merges positions from all sites rather than showing nothing. **Not yet populated at MDS** (0 of 1600 rows sampled), so it renders only once the warehouse fills the column in.
  > Build note: the Gradle daemon was failing with "paging file is too small" while 9 GB RAM was free — Windows **commit** was at 171.7 GB of 180.7 GB with a system-managed (lazily growing) pagefile. `android/gradle.properties` now uses `-Xmx1024M` and `-XX:+UseSerialGC` so the daemon doesn't need a large contiguous virtual reservation.

- 2026-08-06 — **Home dashboard and "My open work" now follow the location.** The open-picks / open-packs tiles counted every site, and My Open Work listed documents from every site — so a tile could show 5 while the hub it links to showed 2, and tapping a row could land on a document the hub then refused to display. Both use the shared `LocationService.inScope`. The location is now resolved **before** the counts (it was computed after them). **Pending uploads is deliberately NOT scoped**: it answers "is there work stuck on this device?", and hiding an unsent document because the operator switched location is how it sits there unnoticed. Changing location already re-runs `_loadAll()`, so the tiles update immediately.

- 2026-08-06 — **Inventory browse came up empty: refresh cleared the cache but not the watermark.** `inventory_page` deleted every local `InventoryItem` for the company and then ran the base sync — which is **delta-based**, so it asked for rows changed since a checkpoint still pointing at "now" and got 4 rows. The catalogue then stayed empty permanently, since nothing was going to change server-side. Added `BaseInventorySyncService.resetCheckpoints()` and the refresh path now clears the rows and the watermarks together. Recovery on an already-broken device: rebuild and pull-to-refresh the inventory page (a normal page load will not fix it).
  > The `Flag3 = 'N'` browse filter is **kept** — it is working as designed. `Flag3 = 'Y'` marks an item as visible to this app; at MDS Sarawak 599 of 600 sampled items are `'N'`, so exactly one item is expected until they flag more. An empty list at a site that hasn't flagged its catalogue is correct behaviour, not a sync fault — now stated in the code comment so the next person doesn't "fix" it.

- 2026-08-06 — **Add-item sheets now honour location scoping.** The hubs filtered pick/pack documents by location and stamped new ones, but the Add-from-SQ sheets and the pack's From-Pick tab listed **every** site's SQs and picks — the hole in the scoping. All three now filter, via a single `LocationService.inScope(documentLocation, scope)` so the hubs and the sheets cannot disagree (a document showing in one list but not another is how a pack ends up spanning two warehouses). Each sheet prefers the **document's own** location over the global selection, so switching scope mid-edit doesn't empty the list under the operator. A document with no location stays visible everywhere — pre-scoping records carry none, and hiding them would make them invisible and unfixable. Covered by `test/location_scope_test.dart`.

- 2026-08-06 — Image base URL now splits dev/prod like the API domain, and `_productionImageBaseUrl` is **blank**: this customer has no image server. Blank means the app shows placeholders and skips the image preload — no errors, no failed requests. Added `AppConfig.hasImages`, and the startup banner reports `(none - photos disabled)` so it is obvious rather than looking like a misconfiguration. Deleted the stock `test/widget_test.dart` (the untouched Flutter counter template, failing since long before this work and making `flutter test` permanently red).

- 2026-08-06 — **Inventory images fixed after the config move.** `CompanyImageConfig.hasImageConfig()` still tested the per-company override map, which is empty now that the base URL lives in `AppConfig` — so it returned false for every company and silently disabled photos in all four places that gate on it (sync preload, image widget, settings, service). It now asks whether a URL is resolvable. Also dropped `getImageBaseUrl()`'s fallback to the API host: the Node backend has no `express.static` and serves no images, so the fallback could only ever produce 404s that look like missing photos instead of missing configuration. Blank now means "no photos", which is at least honest. Covered by `test/image_config_test.dart`.

- 2026-08-06 — **`prepare-server.ps1`** added to the API repo: one command takes a copied-over server to configured, migrated, firewalled, running and smoke-tested, with `[OK]/[WARN]/[FAIL]` per step and a non-zero exit on failure. Ships with `check_db.js` (connect + read `[RMS]` + read `[ACC]` + confirm pick/pack objects) and a copy of `sql/deploy_all.sql`, so the backend is self-contained. Verified end-to-end against the live instance. `env.production.template` corrected: `PORT` was `3000` while the client expects `1194`, and `API_KEY` / `PUBLIC_HOST` were missing.
  > Two bugs found by running it rather than reading it: `-Help` was impossible because mandatory parameters are prompted before the script body runs, and `$ErrorActionPreference='Stop'` turned a harmless Node deprecation notice on stderr into a fatal `NativeCommandError` that aborted the run at step 4. Native commands now go through `Invoke-Native` and are judged on exit code.

- 2026-08-06 — **Reverted the client to plain Dart config** (backend keeps `.env`). `AppConfig` holds every deployment setting in one block at the top of the file — dev/prod host + port, protocol, image base URL, API key — with `_productionDomain` shipped as `CHANGE-ME` rather than one of our own hosts. `license_service` went back to plain constants. The two genuine structural fixes were kept: `CompanyImageConfig` reads the image host from `AppConfig` instead of its own hardcoded map, and `inventory_page.dart` no longer carries a second copy of the image URL.

- 2026-08-06 — `deploy_all.sql` **executed and verified** against `192.168.16.75ungseng` → `[RMS]`: 21 batches, 15/15 `OK`. Added `run_migrations.js` to the API repo — `mssql` has no concept of `GO`, so batches are split there and the run halts on the first failure (a half-applied migration is worse than one that never started). The instance carries the live dataset (4,860 quotes), so **prod may already be migrated** — see the note in §1.

- 2026-08-06 — **All connection config is env-driven, both sides.** Client: the licence Worker URL, expected `app` and offline grace window joined the env file (`LICENSE_VALIDATE_URL`, `LICENSE_APP`, `LICENSE_GRACE_DAYS`), so nothing connection-related is pinned in source — the only literal left in `lib/` is the Worker's own `defaultValue`. Server: the boot banner printed a hardcoded `plusintralinkapps.dyndns.org`, which was actively misleading on a customer's machine; it now prints `PUBLIC_HOST` from `.env` and stays silent when unset. `test/app_config_test.dart` covers all three groups (connection, API key, licence) against a probe env.

- 2026-08-06 — **Connection points moved out of source into a build env file.** `AppConfig` now reads `API_HOST` / `API_PORT` / `API_PROTOCOL` / `API_KEY` / `IMAGE_BASE_URL` (+ sync knobs) via `String.fromEnvironment`, defaulting to the dev values so a plain `flutter run` is unchanged. `CompanyImageConfig`'s hardcoded per-company map is gone — it reads `IMAGE_BASE_URL`, keeping an (empty) override map only for a site that genuinely splits images across hosts. `inventory_page.dart` no longer carries its own copy of the image URL; it goes through `CompanyImageConfig`, so fixing the config can't leave one screen pointed at the old host. Build with `--dart-define-from-file=env/<customer>.env`; templates and key list in `env/`. Covered by `test/app_config_test.dart`. No hardcoded host remains in `lib/`.
- 2026-08-06 — Added [deploy_all.sql](deploy_all.sql): the six migrations concatenated in order with a verification block (13 objects/columns + the three `PI_*` tables that must already exist). Each section re-asserts `USE [RMS]`, so a runner that strips the first one still can't misfile the rest.

- 2026-08-06 — **Remaining review items closed** (server + client, **no SQL**; needs a Node restart):
  1. *Pack Rule 2 was over-permissive with a null `Source_SQ`* — `OR (@srcsq IS NULL)` made the planned-qty cap sum **every** SQ's pick lines for that SKU, a bound far larger than the line it was meant to constrain. Now matches null-to-null, the same way the allocation query beside it already did.
  2. *No authentication on the writeback endpoints* — added a `requireApiKey` gate on `/api/picks`, `/api/pick-items`, `/api/packs`, `/api/pack-items`, `/api/txn-history`, `/api/quotations`, `/api/quotation-items`. Client sends `X-API-Key` via the new `AppConfig.apiHeaders` from every writeback call site. **Unset `API_KEY` leaves the endpoints open**, so rolling it out doesn't brick a running deployment — the server logs a warning at boot when it's missing.
  3. *Dead `Last_Sync` parameter* removed from the pick upload along with `_pickWatermark()`. The server never read it, while the comment claimed it detected concurrent edits — a guard that exists only in a comment is worse than none. Concurrency is actually handled by the `UPDLOCK/HOLDLOCK` transaction and the additive deltas.
  4. *`_save` hard-deleted rows with no tombstone* — a row the server already knew about could vanish locally and live on forever server-side. Rows are now split on `isSynced`: known rows become `status='X'` tombstones the next upload carries; never-synced rows are still hard-deleted, since the server has nothing to be told about.

- 2026-08-06 — **`Location_Code` no longer hardcoded to `'FST'`** (server + client, **no SQL**; needs a Node restart). It was baked into five places, so every quotation line for every customer was stamped with one site's code.
  - `server.js` gained `resolveLocationCode(pool, companyCode, userId, explicit)`: what the client sent → the user's default (`PI_User_Company_Access_Location.Def_Location='Y'`) → the company's **only** active location → `null`. It won't pick "the first of several", because that's a guess; `null` lets the column's own rule apply rather than inventing a site.
  - Quotation **header** uses the resolver. Quotation **items** resolve once per batch — read back from the `MP_Quote` header (always written first), falling back to the resolver — with a per-line override if the client sends one. Not per item, so it costs one query per upload.
  - Client: `checkout_page` sends the selected location on the header, and `quotation_service` sends it on items for both the server and local-Isar paths (they must agree, or the offline copy differs from the uploaded one).

- 2026-08-06 — **Full sync was not full** (client-only, **no SQL**). `performFullSync()` ran 8 steps and never fetched the **customer master**, **PI_Users**, **PI_Company_Location** or the **group/department lookups** — those only ever ran in `_runBackgroundPreload()` at startup, or lazily from the screen that needed them. A device that had never opened Customer Selection therefore had an empty `customers` collection, which is why receipts printed a customer code with no name. Added as step 8, "Reference Data" — customers, PI_Users, locations, group/dept lookups and **customer PLUs** — each source wrapped so one failure preserves the others' caches. Upload became step 9. **Inventory images** are now step 10: deliberately last and time-boxed to 5 minutes, since it's the slowest step by an order of magnitude and everything else has already committed by then — a timeout keeps whatever downloaded and defers the rest, so a slow link degrades the pictures, not the data. Full sync is now 10 steps.
  > Also fixed a second cause of the same symptom: `ReceiptService._hydrateCustomers` trimmed the SQ's customer code *before* matching it against `Customer.code`, which comes from a SQL `char()` column and keeps its padding — so the lookup found nothing even with customers synced. It now matches on the raw code and trims only for display. (The hub's copy never had this bug, which is why hub rows showed names while receipts didn't.)
- 2026-08-06 — **Customers print as `CODE - NAME`** on receipts, via a single `_customerLabel()` used by *both* the by-customer heading and the by-SQ subheading, so the two groupings can't drift apart. Degrades to whichever part is present. A long name wrapping on 58mm now indents its continuation — flush-left it read as another heading. Demo preview data gained customer codes so the format is visible there.
- 2026-08-06 — **SKU added to the item reference line**: `SKU . PLU . UOM` (plus `<- source pick` on packs). SKU leads because it's the system's own identity for the line and is always present, whereas PLU can be blank on a non-scanned item. The separator adapts to the paper: 80mm gets the spaced `SKU . PLU . UOM`, 58mm degrades to bare `SKU.PLU.UOM` when a long SKU + 13-digit EAN + UOM won't otherwise fit — `row2` would have silently truncated the tail and dropped the UOM, the one part a picker can't infer.
- 2026-08-06 — Per-line **`SHORT n` callout printed bold** on every pick and pack receipt — it's the one line on the page someone has to act on. Visible as bold in the preview too, via the emphasis flag added the same day.
- 2026-08-06 — **By-SQ grouping captions the customer**: the SQ number is now its own bold heading with the customer name unemphasised on the line beneath, instead of `SQ · CUSTOMER` joined inline (which wrapped awkwardly at 58mm and buried the document number). `_Group` gained a `subheading`. Customer grouping is unchanged (the customer *is* the heading) and source-pick grouping deliberately has no caption — one pick can feed several customers, so there'd be no single correct name. Client-only, **no SQL**.
- 2026-08-06 — **Receipt wording + formatting** (all pick and pack receipts): document number line printed **bold**; date/printed-at switched to 12-hour with seconds (`15 Jan 26 10:30:00 AM` — exactly 32 columns after the label, so it still fits 58mm); column header `# ITEM … PICKED / QTY` → `#ITEM DESCRIPTION … PICK/QTY` (`PACK/QTY` on packs — past tense is right for a total but wrong over a column of targets); totals relabelled `Total Items` / `Total qty` / `Total picked qty` (`Total packed qty`) / `Total short qty`. `EscPos` now records an emphasis flag per transcript line and `ReceiptPaperView` renders it, so the preview shows bold as bold instead of silently misrepresenting the paper. Client-only, **no SQL**.
- 2026-08-06 — **Preview in the template editor**: an eye icon in the bar and a *Preview receipt* button at the foot of the form render the template **as currently edited** (form state is applied before rendering, nothing is persisted — try a layout, look at it, back out). `ReceiptService.buildPreview` always renders a **fixed, entirely synthetic demo document** — never live data, since templates are edited on machines belonging to different customers and previews end up in screenshots, tickets and training material. The demo set is deliberately awkward (two customers/SQs for grouping + subtotals, one description that wraps, one very short, one short-picked line for the SHORT callout and shortfall total, a long company name for masthead wrapping) and uses a fixed date, so it's reproducible and two people comparing layouts see the same receipt. The paper renderer was extracted to `ReceiptPaperView` and is now shared with the print preview, so the two can't drift. Client-only, **no SQL**.
- 2026-08-06 — **Receipt sign-off block tidied**: signature labels are padded to the longest one so every colon and rule starts in the same column, with rules flush to the paper edge (both margins justified). Two blank lines of clearance above each rule instead of one — people sign *on* the rule and single spacing let ascenders collide with the line above. When the longest label would leave under 14 characters to sign in (long captions on 58mm), the block automatically flips to a full-width rule with the caption underneath — the delivery-note form — rather than printing an unusable 6-character signing space. Client-only, **no SQL**.
- 2026-08-06 — **Licensing switched to the shared IMS Worker** (client-only, **no SQL**). Activation now validates an **AppKey** against `https://ims-license.plusintralink.workers.dev/validate` (Cloudflare Workers + KV) — the same store IMS Procurement uses, administered by `ims-license-admin-web`. Replaces this app's own `/activation/validate-consume` route.
  - Contract confirmed against the live Worker: `POST /validate`, `Authorization: Bearer <AppKey>` → `200 {valid,status,expiry_date,master_url,company_name,logo,total_device,need_app_upgrade,app_store_url,first_used_at,uid}` / `403 {valid:false,status:"unknown",reason:"unknown_key"}`.
  - **Gates only, per decision**: revoked / expired / maintenance / `need_app_upgrade` block the app at startup via `LicenseBlockedPage`. `master_url` is **read but ignored** — `AppConfig`'s hardcoded host still wins. Wiring `master_url` in is the obvious next step.
  - Offline-first: a failed round-trip is never a licence failure. The last good record is cached and honoured for `LicenseService.graceDays` (14). `expiry_date` is still enforced against the cache, so staying offline can't extend an expired licence.
  - Activation page gained **QR scan** (suffix icon on the field + a full-width button), reusing the existing `BarcodeScannerPage` — QR was already in its format list, so there's one scanning code path, not two. The scanned payload is run through a key extractor that handles a bare key, a URL (path or query), a JSON blob or labelled text, and rejects prose; a successful scan submits immediately.
  - Document prefix now comes from the licence field **`custom_1`** (e.g. `PI99`), replacing the locally-issued `quotePrefix`. Devices activated under the old scheme keep their stored prefix, so an upgrade doesn't lock out a working handheld.
  > ⚠️ **Blocked on a Worker change.** `custom_1` is in the KV record but the Worker's `/validate` response does **not** echo it (verified: the record for `IMS-3XRR-QU0F-XPL3-9P49` holds `custom_1: "PI99"`, the response omits it). Until `src/index.js` returns `custom_1` — and ideally `app`, for the `IMS-Customer` check — activation on a *new* device fails with "This licence has no document prefix (custom_1) set". The client already accepts `custom_1` / `custom1` / `quote_prefix`.
  > Also unknown: how the Worker expects the device UID for `uid` binding. The client sends it as an `X-Device-Id` header **and** in the JSON body (`uid`, `device_id`); a Worker that ignores both is unaffected.
- 2026-08-06 — **Pre-deploy correctness set** (server + client, **no SQL**; requires a Node restart):
  1. *Idempotency token was minted per save* — if an upload applied server-side but its response was lost, saving again produced a token the server had never seen and **the same delta applied twice**. The token is now minted only when a save starts a NEW change-set (document synced, or no token yet), and `PickService`/`PackService` handle the `duplicate: true` response by re-baselining to the server's totals, minting a fresh token and resending only the genuine remainder. Verified against a protocol simulation: old behaviour reached 13 where 8 was correct; new behaviour reaches 8, and a plain re-save after a lost response no longer double-counts.
  2. *Header totals are recomputed server-side* — `/api/pick-items` and `/api/pack-items` now write `Total_*_Qty` / `Total_*_Item` from the rows they just applied. They were previously whatever the last uploading device believed, written by `/api/picks` **before** the deltas applied, so with two pickers the header disagreed with `SUM(lines)` and any report reading it was wrong.
  3. *Item counts counted only picked lines* — `totalItems++` sat inside `if (v > 0)` in both `_save`s, under-reporting a partially-picked document and disagreeing with the hub and the receipt.
  4. *No floor on accumulated quantity* — deltas may be negative (a correction), but `Pick_Qty`/`Pack_Qty` may not; both endpoints now reject a delta that would drive the total below zero.
  5. *Auto-created pick's upload failure was swallowed* — `add_pack_items_sheet` discarded the result, so offline (the normal case) produced a later pack rejection reading "exceeds planned pick qty 0", naming the pack rather than the unuploaded pick. Now reported at the point of failure.
- 2026-08-05 — **Save status dialog** (client-only, **no SQL**): saving a pick/pack now shows a modal walking Save → Upload with per-step state — `saving / saved / syncing / synced / queued / failed`. Save therefore **uploads** rather than only writing locally; the dialog never auto-dismisses — every outcome is acknowledged explicitly (**Done** on a clean sync, **Close** otherwise), so a queued or failed upload can't be mistaken for a completed one. Failures show the server's reason and a *Retry upload* button (retries the upload only — the local write already succeeded). Offline is reported as `queued`, not `failed`: the work is safe on the device. `silent` saves (save-before-print) skip the dialog and the upload, as before.
  > Also wired `PackService().syncUnsyncedPacks()` into **both** sync paths in `enhanced_sync_service.dart`. Only picks were ever uploaded there, so a saved pack reached the server only if someone opened the Packing hub and pulled to refresh. Required here because the new dialog tells the operator the work is "queued for the next sync". Packs upload **after** picks — a pack is validated against its parent pick, which must exist server-side first.
- 2026-08-05 — **Sync correctness + query fixes** (server + client, **no SQL**; requires a Node restart):
  1. *Tombstone cursor advanced past skipped removals* — a REMOVE for a pick/pack with pending local edits was skipped **and** the `Transaction_Id` cursor moved past it. `MP_Txn_History` is only ever read forward, so that removal was lost and the stale line lived on locally. The cursor is now clamped to `min(skipped id) − 1`. Trade-off: a document that never manages to upload pins the cursor, so each sync re-reads history from that point — deletes are idempotent, so this is redundant work, not incorrect work.
  2. *Watermark used strict `>`* — all 9 base drains now use `LastWriteTimeStamp >= @lastSync`. SQL `datetime` granularity is ~3.33 ms and one upload stamps many rows from a single `GETDATE()`, so a row landing on the exact watermark tick was excluded forever. Also closes the multi-page-drain race where a concurrent write behind the page cursor was skipped this run and then excluded next run. Safe because every drain upserts by deterministic id.
  3. *Balance services scanned the whole table* — `PickBalanceService`/`PackBalanceService.allocatedByLine` loaded every line in the company and filtered `sqPreLabels` in Dart, despite `parentPreLabel` being indexed and both callers passing one SQ. Now an indexed `anyOf`. This is the residual cause of the slow "Add from SQ" load.
  4. *N+1 loops removed* — the txn-history drains resolved one Isar query per REMOVE row (up to 500/page), now one per page; `pick_detail._dependentPacks` queried one header per pack label, now one query.
- 2026-08-05 — **Pick/pack correctness fixes** (server + client, **no SQL**; requires a Node restart):
  1. *Pick delete-wins ignored `Parent_PreLabel`* — the history lookup matched only SKU+UOM, so on a multi-SQ pick, removing the SQ-A line made every later SQ-B line for the same SKU look deleted and be silently dropped. Now matches the full line identity, as the pack side already did.
  2. *Skipped lines were reported as synced* — `/api/pick-items` and `/api/pack-items` returned only a `skipped` **count**; the client marked every line synced and re-baselined it, consuming a delta the server never applied and stranding a row that could never upload. Both endpoints now return `skippedKeys[]`, and the clients **delete** those local rows (the server is stating they no longer exist) and report it via a new `lastNotices` channel — `lastErrors` is only read on failure, so a notice posted there would never be seen.
  3. *Cancelling a pick permanently stranded its packs* — the pack cap excluded cancelled picks, collapsing planned qty to 0 and rejecting **every** later upload for a pack already built against it, including a no-op resync, with an error naming the pack rather than the pick. The cap now reads the real planned qty and blocks only an **increase** against a cancelled pick, with a message naming the pick and both ways out.
- 2026-08-05 — **Ordering redesign (phase 1)**: new `lib/widgets/ui_kit.dart` extracts the picking/packing visual language into shared components (`UiKit.appBar`, `UiSearchField`, `UiSquareAction`, `UiSegmented`, `UiRailCard`, `UiPill`, `UiAvatar`, `UiEmptyState`, `UiBanner`, `UiSectionLabel`, `UiSummaryBar`) so modules can't drift apart again. Rebuilt on it: customer selection (search + All/Active tabs), the SQ hub (working-context card, promoted open-cart card, badged action grid, Add-items FAB), drafts (search + sort, rail rows), and the cart's chrome (flat bar, empty state, sticky summary bar). Client-only, **no SQL**. ⬜ Phase 2 still on the old style: `checkout_page`, `previous_order_page`, `inventory_page`.
- 2026-08-05 — **Network printers**: `BtPrinterService` → `PrinterService`, now transport-agnostic. `PrinterSettings` gained `transport` (bluetooth | network), `host` and `port` (default 9100 — the raw ESC/POS port every LAN/Wi-Fi thermal printer exposes); the byte stream is identical to Bluetooth, only the pipe differs. Setup sheet gained a transport selector, IP/port/name fields, a **Find printers** sweep of the local /24 and a **Test link** button. Network jobs open one socket per job (port-9100 printers silently drop idle connections, so a cached socket fails on the *next* receipt). Manifest: `INTERNET` + `ACCESS_NETWORK_STATE` now declared directly rather than inherited from a plugin. **No SQL.**
  > ⚠️ **Isar has no migration hook for a property added to an existing collection.** A record written before the property existed deserialises ints as `-9223372036854775808` (int64 min), *not* as the Dart field initialiser — those only run when constructing a new object. This bit `PrinterSettings.port` on devices that had already saved a Bluetooth printer. `PrinterService._repair()` range-checks every numeric setting on load and writes the fix back once. **Apply the same pattern to any int field added to an already-shipped collection.**
- 2026-08-05 — **Receipt templates**: new Isar collection `ReceiptTemplate` (device-local, one set per module) holding a named layout — printed title, grouping (none / customer / SQ / source pick), company header block, per-field toggles and footer note + signature lines. Managed in Settings → Receipt Templates; chosen from a chip strip in the print preview, which re-renders on every change. Seeded on first use (3 pick, 4 pack incl. a Delivery note) so printing works before anyone authors one. **No SQL** — if these ever move server-side, a synced row can overwrite one wholesale, which is why the model is flat and self-contained.
- 2026-08-05 — **Bluetooth receipt printing (pick + pack)**: print button in both detail pages opens a **print preview** (`ReceiptPreviewDialog`) and sends an ESC/POS receipt to a paired Zywell-class thermal printer on confirm. The preview is the plain-text transcript `EscPos` captures *while building the bytes* — not a second render — so screen and paper can't drift apart. New Isar collection `PrinterSettings` (device-scoped singleton: MAC, 58/80mm, copies, barcode, auto-cut) configured from Settings → Receipt Printer, with a test page. **No SQL, no backend change.** New pub dependencies: `print_bluetooth_thermal` (classic-BT transport) and `permission_handler` — the latter **pinned to `>=11.3.1 <12.0.0`** because 12+ needs `compileSdk 35` and 13+ needs `37`, while `android/app/build.gradle` is on 34. New manifest permissions: `BLUETOOTH`/`BLUETOOTH_ADMIN` (≤ API 30), `BLUETOOTH_CONNECT`, and `BLUETOOTH_SCAN` with `neverForLocation` (we only list bonded devices, never scan — this keeps `ACCESS_FINE_LOCATION` off the app). Printers must be paired in Android Bluetooth settings first; there is no in-app pairing.
- 2026-08-05 — **Location scoping**: new hub method `getUserLocations` reads `PI_Company_Location` INNER JOIN `PI_User_Company_Access_Location` (the join is the access check; `Def_Location='Y'` = the user's default), mirroring IMS Procurement. Client caches them in a new Isar collection `AppLocation` + `SelectedLocation` singleton, synced on full sync. Home gained a location selector beside company (auto-selects the default / only option). Picks & packs are filtered by the active location and new documents are stamped with it. **No SQL** — both tables already exist in RMS.
- 2026-08-05 — Home: "My open work" section (the signed-in user's open picks/packs with customer + progress, tap to resume); colour restored to module tiles / stat rails; the open-picks stat now counts genuinely open documents rather than unsynced ones. Add-item sheets gained customer names, picked/packed status chips + filters and sorting, plus a new "From Pick" tab on packing. Client-only, no SQL.
- 2026-08-05 — Home pending badge now counts picks + packs, not just quotations; Pending Uploads restyled to the hub language (flat bar, segmented tabs, status-rail rows); pick/pack wording says "items" not "lines"; hub rows show expandable customer chips (resolved via source SQ) and search matches customer.
- 2026-08-05 — Hub redesign (Picking + Packing): scan promoted to an extended FAB, search+filter collapsed into one band (filter sheet with active-count badge), compact segmented tabs, and rows rebuilt around a status rail + label/qty/assignee. Removed the orphaned LandingPage and a duplicate `/home` route that shadowed HomePage.
- 2026-08-05 — Cancel now releases allocation: pick/pack Rule 2 and the pack cap join the header so a cancelled document stops counting as picked/packed and returns its qty to the SQ; cancel dialog warns about dependent packs.
- 2026-08-05 — Pick/pack lifecycle: explicit Complete (short allowed) / Cancel / Reopen via a tappable status pill in the detail header; closed docs are read-only with a banner. Server no longer downgrades an explicitly completed doc and rejects edits to a cancelled one (409); cancelled docs upload header-only. Client-only + server logic, no SQL.
- 2026-08-03 — Hub quick filters (Mine / Unassigned / Not uploaded / Today) on Picking + Packing; Settings gained "Sync Users" and "Sync Groups & Departments" actions; Pending Uploads is now tabbed (Quotations / Picks / Packs) with per-row and bulk upload for picks and packs. Client-only, no SQL.
- 2026-08-03 — Assigned To on picks + packs: new `Assigned_To` column (SQL #6), threaded through both header upserts; new hub method `getPiUsers`; client caches PI_Users in a new Isar collection `AppUser` (synced on full sync) behind a searchable picker sheet. Defaults to the creating user. New Isar field `PickList.assignedTo` / `PackList.assignedTo`.
- 2026-08-03 — Pack staging UI: pack number moved from app bar into the header card; grouping selector (Original pack / Customer / SQ / Pick) sections the line list, with already-packed lines always shown under their original pack (highest priority); a "Create new pack" button opens an item picker and makes one pack at a time, leaving the rest staged. Already-packed lines are excluded from new packs (re-checked at save time) but their qty edits are written back to their original pack, whose header totals are recomputed and re-flagged unsynced. Pick/pack running numbers are now minted on first save, so abandoned drafts don't consume one. Client-only, no SQL.
- 2026-08-03 — Pack lines no longer merge across SQs: added `Source_SQ` to the pack line identity (Isar id, server line key, Rule 1/2 caps, removals + delete-wins, history, re-baseline, detail grouping). Scanning a pick pre-loads one pack line per pick line. New Isar field `PackListItem.sourceSq`. SQL: `add_pack_source_sq.sql`.
- 2026-08-03 — Pack-from-pick: a pack line must trace to a pick. Add-from-SQ now shows each SQ line's pick list(s) (multi-pick, "pick one source per line"), flags no-pick lines, and auto-creates one 0-picked pick (best-effort synced) for lines packed without one. Backend pack cap relaxed to the parent pick's PLANNED Qty (was actual Pick_Qty); soft "packed > picked" warning surfaced in the pack detail. Packing added to sidebar + carton-box icon. Client-only + one server tweak (Rule 2).
- 2026-08-03 — Pack module: full writeback mirroring picks (`/api/packs`, `/api/pack-items` — additive Pack_Qty deltas capped by parent pick's Pick_Qty, removals+delete-wins, completion, `MP_Txn_History` Module='PACK'), `PackService`, sync drains + dedup, and Packing hub/detail UI. New Isar fields: `PackList.uploadToken`, `PackListItem.qty`, `PackListItem.baselinePackQty`. SQL: `add_pack_writeback_cols.sql`.
- 2026-07-29 — Duplicate pick items fixed: item Isar id now keyed on (parent+sku+uom) instead of the server-reassigned sequenceNo; added self-healing `dedupePickItems()` startup cleanup. Client-only, no SQL, no new Isar fields.
- 2026-07-29 — Pick completion: server sets `MP_Pick_List.Status='C'` when every active line is fully picked (decided on DB sync); logs a COMPLETE txn; client reflects it and the hub shows synced+complete picks in the "Picked" tab.
- 2026-07-29 — Mode-partitioned taxonomy lookups (pi + web coexist offline); fixed web/pi cache clobber + stale-on-toggle; sync both taxonomies each full sync. Client-only (Isar `taxonomyMode` + startup migration).
- 2026-07-29 — Added `MP_Txn_History` + removal/delete-wins/audit wiring; created this runbook.
- 2026-07-28 — Added `Last_Upload_Token`; additive delta sync + idempotency.
- 2026-07-23 — Initial pick/pack tables.
