-- Quick verification script
-- Run this in SQL Server Management Studio

USE RMS;
GO

-- Check if data exists for User ID 3
SELECT 
    User_ID,
    Company_Code,
    SI_Allow_Change_Price,
    SI_Allow_Below_Cost,
    SI_Show_Cost
FROM [RMS].[dbo].[PI_User_App]
WHERE User_ID = 3 AND Company_Code = 1;

-- If no results, insert test data:
-- DELETE FROM [RMS].[dbo].[PI_User_App] WHERE User_ID = 3 AND Company_Code = 1;
-- INSERT INTO [RMS].[dbo].[PI_User_App] (User_ID, Company_Code, SI_Allow_Change_Price)
-- VALUES (3, 1, 'Y');
