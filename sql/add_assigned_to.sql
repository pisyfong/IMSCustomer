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
