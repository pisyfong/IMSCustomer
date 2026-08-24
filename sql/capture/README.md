# Captured legacy SQL traces

**Keep these. They are the only record of how the legacy desktop app actually
writes each document, and every one of them was expensive to obtain — each
required an operator to perform one real action on a live server while a trace
was running.**

Guessing a write path from table names is how you miss the running-number
update, the stock movement, or the counter that lives three statements later.
Every finding below was invisible until the trace showed it.

Captured with [`../capture_sql.ps1`](../capture_sql.ps1) (Extended Events —
records the *parameter values* of RPC calls, which is what makes a trace
replayable). Each capture is a `.sql` (statements in execution order) and a
`.csv` (the same events with timings and spids).

## Reading a trace

The legacy desktop app appears as `app=.Net SqlClient Data Provider`; our own
API appears as `app=node-mssql`. **Filter on that first** — otherwise API
polling drowns the ten statements you care about. Every statement is recorded
twice (two event types per statement); that is the capture, not a double write.

## Index

| File | Action traced | What it settled |
|---|---|---|
| `sql-capture-20260811-191319`<br>`sql-capture-20260811-192416`<br>`sql-capture-20260811-193407` | Sales Invoice save | The original SI write path — the reason this tooling exists. |
| `sql-capture-20260821-102431` | **Credit note (AD) save**, `FST/CN/000496` | Codes live in `AD_Code_Location`, not `AD_Code` — they are per **location**, which is why `CN` appeared unmastered. Prelabel = prefix + pad6(`Running_No`), read → collision-check → increment. Stock moves `qty_on_adj_in += Quantity + FOC_Quantity`; **`Qty_On_Hand` is NOT touched** at save. Batch must be open and is re-checked at save. Document date comes from the **server** (`Select GetDate()`). Seven statements, **no transaction**. |
| `sql-capture-20260824-112034` | **Quotation save**, `FST/SQ/004002` | `Sequence_No` is a **global** running number from `PI_Counter` `'MP_ITEM_NO'`, one per line — NOT the line number. `Item_Sequence` is the per-document line number. We had them inverted. Also revealed the 18 columns legacy always fills, `Term` stored zero-padded (`'030'`), date-only `Quote_Date`, and the best-PLU lookup per SKU+UOM. |

## Findings that came out of these

Recorded here because they are easy to re-break:

- **`PI_Counter`** holds per-company counters keyed by `Counter_Name`.
  `MP_ITEM_NO` feeds `MP_Quote_Item.Sequence_No`. Read-then-increment in legacy;
  our API does it atomically with `UPDATE … OUTPUT INSERTED.Counter_No`.
- **`AD_Code_Location.Running_No`** feeds adjustment prelabels, per location.
- **`PI_Company_Location.SQ_Running_No`** feeds quotation prelabels.
- **`PI_Credit_Term.Term` is `char(4)`**, holding `'030 '`. A lookup with `'30'`
  matches nothing. Resolve against the master and store the master's spelling.
- **Best PLU** is per SKU **and UOM**: longest `Plu_No`, then most recently
  added, `Status='A'`. `In_Stock.Plu_No` is not it — that column holds junk
  (`'1'`, `'0'`).
- Legacy stamps each quotation line's `Added_Date` with **when the line was
  entered**, not when the document was saved.

## Capturing a new one

```powershell
cd sql
.\capture_sql.ps1 -Action Start  -Server <host> -Port <port> -DbUser <user> -Databases RMS -SessionName ims_x_capture
#   ... perform ONE action in the legacy app ...
.\capture_sql.ps1 -Action Stop   -SessionName ims_x_capture ...
.\capture_sql.ps1 -Action Export -SessionName ims_x_capture ...
```

Take a before/after snapshot of the affected tables around it — the trace shows
what ran, the snapshot shows what changed, and you need both. Then **add a row
to the table above**, or the next person repeats the whole exercise.
