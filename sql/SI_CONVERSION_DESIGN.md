# Pick list → Sales Invoices (SI): design

Feature: from the app, convert a pick list into MP_Invoice documents,
**one invoice per source SQ**, plus **one invoice for the no-SQ items**.
A pick built from 3 SQs + loose items therefore produces 4 invoices.

The write sequence below is not guessed — it is the legacy save, captured
statement-by-statement with Extended Events on 2026-08-11
(`sql/capture/sql-capture-20260811-191319.sql`, 705 events, invoice
`FST/SI/010075`, 15 lines, RM 140.00). Anything the trace did, we do.

---

## 1. What the legacy save actually does (authoritative)

All writes ran inside **one client-side transaction** (every write shares
`tran=16780806`; there is no `BEGIN TRAN` in the text — ADO.NET opened it).
Order of operations:

### 1.1 Preparation (reads)
```sql
-- Batch: the invoice must belong to an OPEN batch for the location
SELECT a.* ... FROM MP_Invoice_Batch a ... WHERE Company_Code=1 AND Location_Code IN ('FST') ORDER BY Batch_No
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46

-- Config: max lines per SI (used to split big documents)
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'

-- Document number: prefix + running number live on the LOCATION row
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
-- => 'FST/SI/' + pad6(SI_Running_No) = 'FST/SI/010075'

-- Collision re-check immediately before insert
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010075'
```

### 1.2 Header (1 × INSERT, 63 columns)
`INSERT INTO MP_Invoice (...)` — full statement in the capture. Notable
derivations:

| Column | Value in trace | Meaning for us |
|---|---|---|
| `Batch_No` | 46 | open batch for the location |
| `Invoice_Prelabel` | FST/SI/010075 | `SI_Prelabel + pad6(SI_Running_No)` |
| `Customer` | 01/N01 | **per-SQ**: the SQ's customer |
| `Terms` | '060' | from AR_Customer.Term |
| `Due_Date` / `PP_Due_Date` | invoice date + terms | 26-04 + 60d = 25-06 |
| `Total_Invoice_Entry` / `_Quantity` | 15 / 15 | aggregates of the lines |
| `Gross_Amount`/`Net_Amount`/`Total_Amount_B4_GST` | 140 | line sums |
| `Web_Link_Prelabel` | **FST/SQ/003362** | the source SQ — our per-SQ link |
| `App_DL_Prelabel` | '' | free — we will stamp the **pick number** here |
| `Status` | 'A' | active |
| `Location_Code` | FST | the pick's location |
| dates | `CONVERT(DATETIME,'26-04-2026',103)` | dd-MM-yyyy, style 103 |

### 1.3 Per line (× N)
```sql
-- 1. Line id from a GLOBAL counter (not identity, not per-invoice)
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
-- => Sequence_No (196791, 196792, ...)

-- 2. PLU resolution: LONGEST active PLU for (sku, uom), newest Added_Date on ties
SELECT a2.Plu_No FROM (...) WHERE Company_Code=1 AND Sku_No=5146 AND Uom='EA'

-- 3. The line itself (55 columns; costs copied from In_Stock at save time)
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, ..., 
  Unit_Price, Unit_Price_Basic, ..., Plu_No, Instant_Normal_Selling_Price,
  Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, ..., CTN_Uom, CTN_Unit_Price,
  Item_Sequence, GST_Price, Quantity_Original, ...) VALUES (...)

-- 4. Stock COMMITMENT (not on-hand): both levels
UPDATE In_Stock          SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By=1, LastWriteTimeStamp=GETDATE() WHERE Company_Code=1 AND Sku_No=2419
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No=2419 AND Company_Code=1 AND Location_Code='FST'
```

### 1.4 Completion
```sql
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
-- (transaction commits)
```

### 1.5 Confirmed by table diff (baseline vs after)
`MP_Invoice +1`, `MP_Invoice_Item +15`, matching `In_Stock` /
`In_Stock_Location` bumps — and **nothing else**. No `MP_Txn_History`, no
ledger rows at save time. Posting the batch is a separate, later step in
legacy; conversion does NOT post.

---

## 1b. Trace 2 — the no-SQ save (2026-08-11, `FST/SI/010076`)

One line: `Sku_No=1, Uom='ROL', Factor=1, Quantity=10, Foc=1, Unit_Price=110`.
Header diff against the SQ-linked invoice settles three questions:

1. **No-SQ ⇒ `Web_Link_Prelabel = ''`.** Nothing else about the shape
   changes — same 62 columns, same sequence. §3.2 stands as designed.
2. **FOC quantity moves stock and counts in the header totals, but is not
   charged.** `Total_Invoice_Quantity = 11` (10 + 1 FOC),
   `Gross_Amount = 10 × 110 = 1100`, and the stock updates are
   `Qty_On_Trading + 11.000000` — i.e. **stock delta = Quantity + Foc**.
   Our conversion must do the same if a FOC concept ever reaches the app.
3. **A `Nos` adjustment runs after the lines**, verbatim:
   ```sql
   Update In_Stock set Nos = ISNULL(Nos,0) + (a.TotalQty * -1) From In_Stock a1
     Inner Join (Select a.Company_Code, b.Sku_No, sum(b.Nos) as TotalQty
                 From MP_Invoice a Inner Join MP_Invoice_Item b ON (...)
                 Where b.Nos <> 0 AND a.Invoice_Prelabel = 'FST/SI/010076' ...) as a ON (...)
   -- and the same against In_Stock_Location, grouped by Location_Code
   ```
   With `Nos = 0` on every line it is a no-op, but legacy runs it every
   save — the endpoint copies it verbatim rather than deciding it's dead.

## 1c. Trace 3 — factor, loose qty and discount (2026-08-11, `FST/SI/010077`)

One line: `Sku_No=6, Factor=50, Quantity=100, Quantity_Loose=100, Foc=1,
Foc_Loose=1, Unit_Price=3.40, Unit_Discount_Rate1=10%`. Stock update:
`Qty_On_Trading + 5151`. That number pins the formula exactly:

```
stock delta (base units) = (Quantity + Foc) × Factor + Quantity_Loose + Foc_Loose
                         = (100 + 1) × 50   + 100 + 1          = 5151   ✓
```
Cross-checked against traces 1 and 2: (1+0)×1+0+0 = 1 ✓ and (10+1)×1+0+0 = 11 ✓.

Money side (FOC free, loose charged pro-rata):
```
charged packs = Quantity + Quantity_Loose / Factor = 100 + 2     = 102
gross         = 102 × 3.40                                       = 346.80
Unit_Discount_Amount1 = 10% × 346.80                             = 34.68
Net_Amount    = 346.80 − 34.68                                   = 312.12  ✓
Unit_Price_Basic = Unit_Price / Factor = 3.40 / 50               = 0.068   ✓
```

Header facts confirmed: `Total_Invoice_Quantity` is the **base-unit total**
(5151 — same figure as the stock delta), `Gross_Amount` at header level is
the **post-line-discount** sum (312.12), and the item row's own
`Gross_Amount` column is written as literal `0` (legacy leaves it — copy
verbatim). Discount lands in `Unit_Discount_Rate1/Amount1` and is mirrored
into `Unit_Discount_Rate/Amount`; the `2` slots stay 0.

## 2. Remaining unknowns (minor)

The write path is now fully specified. Still unobserved, none blocking:
`SI_No_Of_Item` splitting (config 0 = no limit at this site), GST/tax fields
(all zeros — site not GST-registered), and batch creation (we only ever
reuse an open batch, per §3.4).

---

## 3. Endpoint design

### 3.1 Contract

```
POST /api/pick-invoices          (server.js, behind requireApiKey)
{
  "companyCode": 1,
  "pickPreLabel": "PI99/PK/2608002",
  "invoiceDate": "2026-08-11",          // optional, default today
  "userId": 1,                          // Added_By / Last_Modified_By
  "batchNo": 46,                        // optional; see 3.4
  "noSqCustomer": "01/N01",             // REQUIRED if the pick has no-SQ lines
  "uploadToken": "si-<device>-<nonce>"  // idempotency, same pattern as picks
}
```

Response:
```
{ "success": true,
  "invoices": [
    { "sq": "AASQ-2607/0046", "invoicePreLabel": "FST/SI/010076", "lines": 9, "netAmount": 123.45 },
    { "sq": null,             "invoicePreLabel": "FST/SI/010079", "lines": 2, "netAmount": 10.00 }
  ],
  "skipped": [ { "sku": 480, "uom": "CTN", "reason": "pickQty is 0" } ] }
```

### 3.2 Grouping rule

- Read `MP_Pick_List_Item` for the pick. Group by `Parent_PreLabel`
  (the SQ). Empty/null `Parent_PreLabel` → the **no-SQ bucket**.
- One invoice per group, in SQ order, no-SQ last.
- **Quantity invoiced = `Pick_Qty`** (what was physically picked), not the
  planned `Qty`. Lines with `Pick_Qty = 0` are skipped and reported.
- Per-SQ invoice: `Customer` = `MP_Quote.Customer` of that SQ;
  `Web_Link_Prelabel` = the SQ. Unit price = the SQ line's price
  (`MP_Quote_Item`) — the quote is the agreed price.
- No-SQ invoice: `Customer` = `noSqCustomer` from the request (a pick has no
  customer of its own — the app asks the operator). `Web_Link_Prelabel` = ''.
  Unit price source: **open question §5.1**.
- Every invoice gets `App_DL_Prelabel = pickPreLabel` so any SI can be traced
  back to the pick that produced it (legacy leaves this column '').

### 3.3 Write algorithm (per invoice, all invoices in ONE sql.Transaction)

Mirrors §1 exactly, with two deliberate hardenings:

1. Counter reads use `WITH (UPDLOCK, HOLDLOCK)`:
   - `SELECT SI_Running_No FROM PI_Company_Location WITH (UPDLOCK, HOLDLOCK) ...`
   - `SELECT Counter_No FROM PI_Counter WITH (UPDLOCK, HOLDLOCK) ...`
   The legacy read-then-increment is a race (two saves can take the same
   number; only the pre-insert existence check saves it). We hold the lock
   for the transaction instead. Same convention as the pick writeback.
2. Idempotency: `uploadToken` recorded (new column or a small
   `MP_App_Upload_Token` table — decide at implementation); a replayed
   request returns the original result instead of writing again. The pick
   sync learned this lesson the hard way.

Everything else copies the trace verbatim: same 63 header columns, same 55
item columns, costs read from `In_Stock` at save time, PLU by the
longest-active rule, `Qty_On_Trading` bumped at both levels, running number
incremented once per invoice, batch status checked.

### 3.4 Batch

The header requires an **open `MP_Invoice_Batch`** for the location. Options:
given `batchNo`, validate it is open; otherwise reuse the newest open batch
for (company, location); if none exists → **error** (v1). Auto-creating
batches copies logic we have not traced — not until we've watched legacy
create one.

### 3.5 Failure behaviour

One transaction for the whole conversion: 4 invoices or none. A partial
"3 of 4 saved" state is exactly the ambiguity the operator cannot resolve
from the handheld.

### 3.6 Client flow (phase 2, after the endpoint is proven)

Pick detail → "Create invoices" (only when status Complete or user confirms
shorts) → preview sheet listing the N invoices (SQ, customer, lines, amount,
shorts) → pick customer for the no-SQ group if present → confirm → call →
show resulting SI numbers. Offline: not queued in v1 — this write moves stock
and takes numbers; it happens online or not at all.

---

## 3.7 Implementation status (2026-08-11)

`POST /api/pick-invoices` is implemented in `server.js` (behind
`requireApiKey`) with a **`dryRun: true`** mode that computes the full plan —
grouping, pricing, discounts, batch — and writes nothing. Verified against
the dev pick `PI99/PK/2608002` on RMS_YeonTak: 2 invoices planned (1 × SQ
line, 1 × no-SQ line), CTN factor 12 → base units 12/36 per the traced
formula, 11 unpicked lines skipped with reasons, open batch 42331 found.

v1 decisions taken while implementing (all flagged for the cross-check):
- `PP_Due_Date = Due_Date` (legacy derives it from customer PP settings we
  have not traced; trace 1 had them equal, trace 2 did not)
- Quote discounts: the RATE is copied and the amount recomputed for the
  picked qty; an amount-only discount is scaled by qty ratio
- No-SQ price = `In_Stock_Uom.price`; `In_Stock_Uom.SI_Unit_Disc*` defaults
  are NOT applied (unobserved in any trace)
- Any line without a price anywhere blocks the whole conversion (422) —
  never invoice at zero
- Batch: reuse newest `Status='O'` for the location; 409 if none
- One conversion per pick, enforced via `App_DL_Prelabel`; replays detected
  via the token in `Internal_Reference`

## 3.8 Allocation + frontend (2026-08-11)

The pick records ONE `Pick_Qty` per line; the invoice needs it split across
Quantity / Quantity_Loose / Foc / Foc_Loose. The endpoint therefore accepts
`allocations[]` per line, validated to cover the picked amount EXACTLY in
base units: `(qty+foc)×factor + qtyLoose + focLoose = pickQty×factor`.
Charged = `qty + qtyLoose/factor` packs; FOC is free. Verified live:
mismatched split refused with the exact shortfall; 2 CTN + 6 loose + 6
FOC-loose of 3×CTN(12) picked → RM 414 = 2.5 packs × 165.60.

App side: `lib/pages/pick_invoice_page.dart` (button on the pick detail app
bar, gated on saved + synced). Full picks pre-fill their split from the SQ
line (`Quote_Quantity/…_Loose/Foc/Foc_Loose`); partial picks make the
operator allocate, with a live base-unit balance indicator per line. No-SQ
group requires choosing a customer (searchable, code-only lookup). Flow:
allocate → server dry run → confirmation listing each invoice → real call
with the same token → created numbers shown.

## 3.9 Loose split at PICK time (2026-08-11)

An SQ line can demand "10 CTN + 5 units". Previously the pick carried only
`Quote_Quantity` — **loose and FOC demand never reached the picker at all**.
Now the add-from-SQ flow emits TWO pick lines per SQ line with loose demand:

- pack line: quote UOM, qty = `Quote_Quantity + Quote_Foc` remaining
  (FOC goods are free on the invoice but picked like anything else)
- loose line: the SKU's base UOM (factor-1 `In_Stock_Uom`, master UOM as
  fallback), factor 1, qty = `Quote_Quantity_Loose + Quote_Foc_Loose`
  remaining, **`Remark = 'LOOSE'`** — the marker survives the round trip
  (model + `/api/pick-items` both carry Remark)

The pick detail already groups per SKU with one row per UOM, so the split
renders naturally. Balances track per (sq, sku, uom), so the loose line has
its own tally.

At INVOICE time the split folds back: both the endpoint and the app merge
`LOOSE` lines into their (sq, sku) pack sibling — one MP_Invoice_Item row
with `Quantity` + `Quantity_Loose`, exactly the legacy shape — and the
allocation invariant covers both (`pickedBase = qty×factor + looseBase`).
Allocation prefill therefore lands balanced even for partial loose picks.
A loose line whose pack sibling was never picked stands alone as a base-UOM
line.

Deliberately not done: the PACK sheet's From-SQ tab still adds packs only —
packing inherits the split via "From Pick" (the pick now has both lines),
and the From-SQ tab's auto-pick path is left for phase 2 alongside loose
items generally.

## 4. Cross-check plan (before any code writes to RMS)

1. Trace the **no-SQ** legacy save (+ CTN/discount if possible) — §2.
2. Implement the endpoint; run it against a **test pick** on dev.
3. Diff our invoice vs a legacy invoice column-by-column (the baseline diff
   script pattern from `capture/baseline.json`), including `In_Stock` /
   `In_Stock_Location` deltas.
4. Only then expose the button in the app.

---

## 5. Open questions

1. **No-SQ line pricing.** SQ lines take the quote price; loose lines have no
   quote. Candidate: same price engine the SQ creation uses (customer price
   type → In_Stock_Uom / promo). Decide at cross-check.
2. **Partial picks.** A pick with `Pick_Qty < Qty` invoices the short amount.
   Is a second conversion of the same pick (after picking more) allowed?
   v1: refuse — one conversion per pick (token makes replays safe).
3. **`SI_No_Of_Item` splitting.** Config was 0 ('no limit'?) in the trace.
   If a site sets it, does legacy split one document into several? Needs a
   look at legacy behaviour before we honour it.
4. **Factor.** §2.1 — blocked on the CTN trace.
