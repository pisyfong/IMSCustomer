-- ============================================================
-- Pack line source-SI tag.
--
-- A pack line normally traces to a pick (Parent_PreLabel) and records
-- the SQ it came from (Source_SQ). Packing straight from a sales
-- invoice is a THIRD, independent provenance: the invoice already
-- exists (created in legacy) and there is no pick behind it, so
-- Parent_PreLabel is NULL on those lines.
--
-- Source_SI must join the line's identity, not just ride along as a
-- label. Identity is (Parent_PreLabel, Source_SQ, Source_SI, Sku_No,
-- Uom); without the new column, the same SKU/UOM packed for two
-- different invoices would collide on one row and the second
-- invoice's quantity would overwrite the first.
--
-- MP_Txn_History carries it too, so delete-wins stays precise.
--
-- nvarchar(30) matches MP_Pack_List_Item.Parent_PreLabel. Invoice
-- pre-labels run to 14 chars today ('YTSI-2608/0281'), but the column
-- they come from, MP_Invoice.Invoice_PreLabel, is wider than the
-- nvarchar(15) used for Source_SQ.
--
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

-- Finding every pack line raised against one invoice is the hot query
-- behind the "From SI" list's packed/unpacked progress, and it runs
-- once per invoice shown.
IF NOT EXISTS (SELECT 1 FROM sys.indexes
               WHERE name = 'IX_MP_Pack_List_Item_Source_SI'
                 AND object_id = OBJECT_ID('dbo.MP_Pack_List_Item'))
BEGIN
    CREATE INDEX IX_MP_Pack_List_Item_Source_SI
        ON dbo.MP_Pack_List_Item (Company_Code, Source_SI)
        INCLUDE (Sku_No, Uom, Qty, Pack_Qty, Status, Pack_PreLabel);
END
GO
