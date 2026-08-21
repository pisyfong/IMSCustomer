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
