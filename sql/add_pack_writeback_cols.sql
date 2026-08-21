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
