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
