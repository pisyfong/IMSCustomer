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
