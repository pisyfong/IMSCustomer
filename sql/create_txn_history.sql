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
