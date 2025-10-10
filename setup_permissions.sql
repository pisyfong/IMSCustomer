-- =========================================
-- PI_User_App Permission Setup Script
-- =========================================
-- Purpose: Setup test users with different permission levels
-- Run this on your SQL Server database

USE RMS;
GO

-- =========================================
-- 1. Check if table exists
-- =========================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'PI_User_App')
BEGIN
    PRINT '❌ ERROR: PI_User_App table does not exist!';
    PRINT 'Please create the table first.';
    -- ROLLBACK;
END
ELSE
BEGIN
    PRINT '✅ PI_User_App table exists';
END
GO

-- =========================================
-- 2. Clear existing test data (optional)
-- =========================================
-- Uncomment if you want to reset permissions
-- DELETE FROM [RMS].[dbo].[PI_User_App] WHERE User_ID IN (1, 2, 3);
-- PRINT 'Cleared existing test data';

-- =========================================
-- 3. Insert Test Users
-- =========================================

-- User 1: FULL PERMISSIONS (Admin/Manager)
-- Can edit prices, sell below cost, view costs
IF NOT EXISTS (SELECT * FROM [RMS].[dbo].[PI_User_App] WHERE User_ID = 1 AND Company_Code = 1)
BEGIN
    INSERT INTO [RMS].[dbo].[PI_User_App] (
        User_ID, 
        Company_Code, 
        Promoter_Id,
        Select_Shop,
        Show_PI,
        SI_Batch,
        SI_Show_Qty,
        SI_Show_Cost,
        SI_Allow_Change_Price,
        SI_Allow_Below_Cost,
        SI_Allow_Exceed_Qty,
        SI_Allow_Foc,
        SI_All_Order_View,
        SI_All_Order_Edit,
        AD_Dist_Create_Event,
        SI_Dist_Create_Event
    ) VALUES (
        1,      -- User_ID
        1,      -- Company_Code
        NULL,   -- Promoter_Id
        'Y',    -- Select_Shop
        'Y',    -- Show_PI
        1,      -- SI_Batch
        'Y',    -- SI_Show_Qty
        'Y',    -- SI_Show_Cost ⭐ Show costs
        'Y',    -- SI_Allow_Change_Price ⭐⭐ CAN EDIT PRICES
        'Y',    -- SI_Allow_Below_Cost ⭐ Can sell below cost
        'Y',    -- SI_Allow_Exceed_Qty
        'Y',    -- SI_Allow_Foc
        'Y',    -- SI_All_Order_View
        'Y',    -- SI_All_Order_Edit
        'Y',    -- AD_Dist_Create_Event
        'Y'     -- SI_Dist_Create_Event
    );
    PRINT '✅ User 1 created with FULL PERMISSIONS (can edit prices)';
END
ELSE
BEGIN
    PRINT '⚠️  User 1 already exists, updating permissions...';
    UPDATE [RMS].[dbo].[PI_User_App]
    SET SI_Allow_Change_Price = 'Y',
        SI_Allow_Below_Cost = 'Y',
        SI_Show_Cost = 'Y'
    WHERE User_ID = 1 AND Company_Code = 1;
    PRINT '✅ User 1 permissions updated';
END
GO

-- User 2: RESTRICTED PERMISSIONS (Sales Staff)
-- Cannot edit prices, cannot sell below cost, cannot view costs
IF NOT EXISTS (SELECT * FROM [RMS].[dbo].[PI_User_App] WHERE User_ID = 2 AND Company_Code = 1)
BEGIN
    INSERT INTO [RMS].[dbo].[PI_User_App] (
        User_ID, 
        Company_Code, 
        Promoter_Id,
        Select_Shop,
        Show_PI,
        SI_Batch,
        SI_Show_Qty,
        SI_Show_Cost,
        SI_Allow_Change_Price,
        SI_Allow_Below_Cost,
        SI_Allow_Exceed_Qty,
        SI_Allow_Foc,
        SI_All_Order_View,
        SI_All_Order_Edit,
        AD_Dist_Create_Event,
        SI_Dist_Create_Event
    ) VALUES (
        2,      -- User_ID
        1,      -- Company_Code
        NULL,   -- Promoter_Id
        'Y',    -- Select_Shop
        'N',    -- Show_PI
        1,      -- SI_Batch
        'Y',    -- SI_Show_Qty
        'N',    -- SI_Show_Cost ⭐ Hide costs
        'N',    -- SI_Allow_Change_Price ⭐⭐ CANNOT EDIT PRICES
        'N',    -- SI_Allow_Below_Cost ⭐ Cannot sell below cost
        'N',    -- SI_Allow_Exceed_Qty
        'N',    -- SI_Allow_Foc
        'Y',    -- SI_All_Order_View (can view own orders)
        'N',    -- SI_All_Order_Edit (cannot edit orders)
        'N',    -- AD_Dist_Create_Event
        'N'     -- SI_Dist_Create_Event
    );
    PRINT '✅ User 2 created with RESTRICTED PERMISSIONS (cannot edit prices)';
END
ELSE
BEGIN
    PRINT '⚠️  User 2 already exists, updating permissions...';
    UPDATE [RMS].[dbo].[PI_User_App]
    SET SI_Allow_Change_Price = 'N',
        SI_Allow_Below_Cost = 'N',
        SI_Show_Cost = 'N'
    WHERE User_ID = 2 AND Company_Code = 1;
    PRINT '✅ User 2 permissions updated';
END
GO

-- User 3: MODERATE PERMISSIONS (Supervisor)
-- Can edit prices but cannot sell below cost
IF NOT EXISTS (SELECT * FROM [RMS].[dbo].[PI_User_App] WHERE User_ID = 3 AND Company_Code = 1)
BEGIN
    INSERT INTO [RMS].[dbo].[PI_User_App] (
        User_ID, 
        Company_Code, 
        Promoter_Id,
        Select_Shop,
        Show_PI,
        SI_Batch,
        SI_Show_Qty,
        SI_Show_Cost,
        SI_Allow_Change_Price,
        SI_Allow_Below_Cost,
        SI_Allow_Exceed_Qty,
        SI_Allow_Foc,
        SI_All_Order_View,
        SI_All_Order_Edit,
        AD_Dist_Create_Event,
        SI_Dist_Create_Event
    ) VALUES (
        3,      -- User_ID
        1,      -- Company_Code
        NULL,   -- Promoter_Id
        'Y',    -- Select_Shop
        'Y',    -- Show_PI
        1,      -- SI_Batch
        'Y',    -- SI_Show_Qty
        'Y',    -- SI_Show_Cost ⭐ Show costs
        'Y',    -- SI_Allow_Change_Price ⭐⭐ CAN EDIT PRICES
        'N',    -- SI_Allow_Below_Cost ⭐ Cannot sell below cost
        'Y',    -- SI_Allow_Exceed_Qty
        'Y',    -- SI_Allow_Foc
        'Y',    -- SI_All_Order_View
        'Y',    -- SI_All_Order_Edit
        'Y',    -- AD_Dist_Create_Event
        'Y'     -- SI_Dist_Create_Event
    );
    PRINT '✅ User 3 created with MODERATE PERMISSIONS (can edit prices, but not below cost)';
END
ELSE
BEGIN
    PRINT '⚠️  User 3 already exists, updating permissions...';
    UPDATE [RMS].[dbo].[PI_User_App]
    SET SI_Allow_Change_Price = 'Y',
        SI_Allow_Below_Cost = 'N',
        SI_Show_Cost = 'Y'
    WHERE User_ID = 3 AND Company_Code = 1;
    PRINT '✅ User 3 permissions updated';
END
GO

-- =========================================
-- 4. Verify Inserted Data
-- =========================================
PRINT '';
PRINT '========================================';
PRINT '📊 Current Permission Settings';
PRINT '========================================';

SELECT 
    ua.User_ID,
    u.Login_Name,
    ua.Company_Code,
    CASE WHEN ua.SI_Allow_Change_Price = 'Y' THEN '✅ YES' ELSE '❌ NO' END as Can_Edit_Price,
    CASE WHEN ua.SI_Allow_Below_Cost = 'Y' THEN '✅ YES' ELSE '❌ NO' END as Can_Sell_Below_Cost,
    CASE WHEN ua.SI_Show_Cost = 'Y' THEN '✅ YES' ELSE '❌ NO' END as Show_Cost,
    ua.SI_Allow_Change_Price as Raw_Price_Flag,
    ua.SI_Allow_Below_Cost as Raw_Cost_Flag
FROM [RMS].[dbo].[PI_User_App] ua
LEFT JOIN [RMS].[dbo].[PI_Users] u ON ua.User_ID = u.User_ID
WHERE ua.Company_Code = 1
ORDER BY ua.User_ID;

PRINT '';
PRINT '========================================';
PRINT '✅ Setup Complete!';
PRINT '========================================';
PRINT '';
PRINT '📝 Test Users Created:';
PRINT '   User 1: FULL PERMISSIONS (Can edit prices)';
PRINT '   User 2: RESTRICTED (Cannot edit prices)';
PRINT '   User 3: MODERATE (Can edit prices, cannot sell below cost)';
PRINT '';
PRINT '🚀 Next Steps:';
PRINT '   1. Restart SignalR server: node server.js';
PRINT '   2. Run Flutter app: flutter run';
PRINT '   3. Login with different users and test';
PRINT '   4. Check logs for permission sync messages';
PRINT '';

GO
