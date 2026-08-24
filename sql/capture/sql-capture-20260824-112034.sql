-- SQL captured 20260824-112034 from 192.168.16.75,49681
-- databases: RMS
-- 254 statements, in execution order

-- [08/24/2026 03:16:13] spid=68 tran=0 db=RMS rows=1 1.536000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:13] spid=67 tran=0 db=RMS rows=1 0.260000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:13] spid=68 tran=0 db=RMS rows=1 0.161000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:16:13] spid=67 tran=0 db=RMS rows=0 0.661000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:16:15] spid=67 tran=0 db=RMS rows=1 0.307000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:15] spid=67 tran=0 db=RMS rows=1 0.186000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:20] spid=67 tran=0 db=RMS rows=1 0.593000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:20] spid=67 tran=0 db=RMS rows=1 13.609000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:25] spid=67 tran=0 db=RMS rows=1 0.584000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:25] spid=67 tran=0 db=RMS rows=1 14.330000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:30] spid=67 tran=0 db=RMS rows=1 0.272000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:30] spid=67 tran=0 db=RMS rows=1 0.173000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:35] spid=67 tran=0 db=RMS rows=1 0.106000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:35] spid=67 tran=0 db=RMS rows=1 0.063000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:40] spid=67 tran=0 db=RMS rows=1 0.112000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:40] spid=67 tran=0 db=RMS rows=1 0.060000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:43] spid=67 tran=0 db=RMS rows=1 0.223000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:43] spid=68 tran=0 db=RMS rows=1 0.152000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:43] spid=67 tran=0 db=RMS rows=1 1.172000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:16:43] spid=68 tran=0 db=RMS rows=0 0.236000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:16:45] spid=68 tran=0 db=RMS rows=1 0.712000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:45] spid=68 tran=0 db=RMS rows=1 9.311000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:50] spid=68 tran=0 db=RMS rows=1 0.242000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:50] spid=68 tran=0 db=RMS rows=1 4.158000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:16:55] spid=68 tran=0 db=RMS rows=1 0.340000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:16:55] spid=68 tran=0 db=RMS rows=1 0.181000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:00] spid=68 tran=0 db=RMS rows=1 0.188000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:00] spid=68 tran=0 db=RMS rows=1 0.075000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:05] spid=68 tran=0 db=RMS rows=1 0.307000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:05] spid=68 tran=0 db=RMS rows=1 0.108000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:10] spid=68 tran=0 db=RMS rows=1 0.298000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:10] spid=68 tran=0 db=RMS rows=1 0.229000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:13] spid=67 tran=0 db=RMS rows=1 0.162000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:13] spid=68 tran=0 db=RMS rows=1 0.272000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:13] spid=68 tran=0 db=RMS rows=1 2.410000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:17:13] spid=67 tran=0 db=RMS rows=0 0.566000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:17:15] spid=67 tran=0 db=RMS rows=1 0.272000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:15] spid=67 tran=0 db=RMS rows=1 0.166000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:20] spid=67 tran=0 db=RMS rows=1 0.294000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:20] spid=67 tran=0 db=RMS rows=1 0.174000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:25] spid=67 tran=0 db=RMS rows=1 0.588000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:25] spid=67 tran=0 db=RMS rows=1 14.206000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:30] spid=67 tran=0 db=RMS rows=1 0.248000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:30] spid=67 tran=0 db=RMS rows=1 5.060000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:35] spid=67 tran=0 db=RMS rows=1 0.615000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:35] spid=67 tran=0 db=RMS rows=1 13.082000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:40] spid=67 tran=0 db=RMS rows=1 0.279000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:40] spid=67 tran=0 db=RMS rows=1 0.161000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:43] spid=67 tran=0 db=RMS rows=1 0.307000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:43] spid=68 tran=0 db=RMS rows=1 0.167000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:43] spid=67 tran=0 db=RMS rows=1 2.497000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:17:43] spid=68 tran=0 db=RMS rows=0 0.507000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:17:45] spid=68 tran=0 db=RMS rows=1 0.280000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:45] spid=68 tran=0 db=RMS rows=1 0.163000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:50] spid=68 tran=0 db=RMS rows=1 0.119000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:50] spid=68 tran=0 db=RMS rows=1 0.057000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:17:55] spid=68 tran=0 db=RMS rows=1 0.591000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:17:55] spid=68 tran=0 db=RMS rows=1 14.407000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:00] spid=68 tran=0 db=RMS rows=1 0.592000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:00] spid=68 tran=0 db=RMS rows=1 9.459000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:05] spid=68 tran=0 db=RMS rows=1 0.147000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:05] spid=68 tran=0 db=RMS rows=1 0.096000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:10] spid=68 tran=0 db=RMS rows=1 0.124000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:10] spid=68 tran=0 db=RMS rows=1 0.072000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 5.120000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.100000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 52.994000ms  app=.Net SqlClient Data Provider
exec MP_Setup_Sel @CompanyCode=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.369000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=11 0.514000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=11 0.040000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.041000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.372000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.521000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.327000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.514000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=4 0.043000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.325000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.328000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.547000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.090000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.060000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.617000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 5.130000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/24/2026 03:18:11] spid=53 tran=3272197 db=RMS rows=0 0.082000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 24.265000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=3272287 db=RMS rows=1 0.684000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 3.025000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.042000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.605000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.034000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.035000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.502000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=11 0.730000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=11 0.047000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:11] spid=53 tran=0 db=RMS rows=1 0.782000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/24/2026 03:18:13] spid=67 tran=0 db=RMS rows=1 0.174000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:13] spid=68 tran=0 db=RMS rows=1 0.305000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:13] spid=68 tran=0 db=RMS rows=1 2.605000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:18:13] spid=67 tran=0 db=RMS rows=0 0.594000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:18:15] spid=67 tran=0 db=RMS rows=1 0.166000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:15] spid=67 tran=0 db=RMS rows=1 0.087000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:20] spid=67 tran=0 db=RMS rows=1 0.273000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:20] spid=67 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:25] spid=67 tran=0 db=RMS rows=1 0.339000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:25] spid=67 tran=0 db=RMS rows=1 0.175000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:28] spid=53 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:28] spid=53 tran=0 db=RMS rows=11 1.528000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/24/2026 03:18:28] spid=53 tran=0 db=RMS rows=11 0.130000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/24/2026 03:18:30] spid=67 tran=0 db=RMS rows=1 0.293000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:30] spid=67 tran=0 db=RMS rows=1 0.172000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:35] spid=67 tran=0 db=RMS rows=1 0.239000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:35] spid=67 tran=0 db=RMS rows=1 4.225000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:39] spid=53 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:39] spid=53 tran=0 db=RMS rows=7 110.592000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/A01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/24/2026 03:18:40] spid=67 tran=0 db=RMS rows=1 0.587000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:40] spid=67 tran=0 db=RMS rows=1 3.091000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:44] spid=67 tran=0 db=RMS rows=1 0.308000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:44] spid=68 tran=0 db=RMS rows=1 0.178000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:44] spid=67 tran=0 db=RMS rows=1 2.433000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:18:44] spid=68 tran=0 db=RMS rows=0 0.537000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:18:45] spid=68 tran=0 db=RMS rows=1 0.279000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:45] spid=68 tran=0 db=RMS rows=1 0.163000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:49] spid=53 tran=0 db=RMS rows=0 0.045000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:49] spid=53 tran=3272886 db=RMS rows=1 27.815000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 1 AND a.Company_Code=1
GO

-- [08/24/2026 03:18:49] spid=53 tran=3272886 db=RMS rows=1 1.689000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 1 AND a.Company_Code=1
GO

-- [08/24/2026 03:18:49] spid=53 tran=3272886 db=RMS rows=1 0.106000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 1 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:18:49] spid=53 tran=3272886 db=RMS rows=1 1.658000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 1 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:18:49] spid=53 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:49] spid=53 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:18:49] spid=53 tran=0 db=RMS rows=0 25.168000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=1 AND b.Uom='ROL' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:18:49] spid=53 tran=3273142 db=RMS rows=0 6.888000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=1 AND b.Uom='ROL' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:18:49] spid=53 tran=3273162 db=RMS rows=0 3.778000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=1ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:18:49] spid=53 tran=0 db=RMS rows=0 5.640000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=1ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:18:50] spid=68 tran=0 db=RMS rows=1 0.162000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:50] spid=68 tran=0 db=RMS rows=1 0.064000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:18:55] spid=68 tran=0 db=RMS rows=1 0.130000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:18:55] spid=68 tran=0 db=RMS rows=1 0.072000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:00] spid=68 tran=0 db=RMS rows=1 0.135000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:00] spid=68 tran=0 db=RMS rows=1 0.051000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:05] spid=68 tran=0 db=RMS rows=1 0.269000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:05] spid=68 tran=0 db=RMS rows=1 0.133000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:08] spid=53 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273234 db=RMS rows=1 25.116000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273234 db=RMS rows=1 11.419000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273234 db=RMS rows=2 0.411000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273234 db=RMS rows=2 3.601000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:19:08] spid=53 tran=0 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:08] spid=53 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:08] spid=53 tran=0 db=RMS rows=0 7.716000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273313 db=RMS rows=0 2.648000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:08] spid=53 tran=3273333 db=RMS rows=0 2.840000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:08] spid=53 tran=0 db=RMS rows=0 5.173000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:10] spid=68 tran=0 db=RMS rows=1 0.125000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:10] spid=68 tran=0 db=RMS rows=1 0.057000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:14] spid=67 tran=0 db=RMS rows=1 0.128000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:14] spid=68 tran=0 db=RMS rows=1 0.283000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:14] spid=68 tran=0 db=RMS rows=1 0.157000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:19:14] spid=67 tran=0 db=RMS rows=0 0.567000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:19:15] spid=67 tran=0 db=RMS rows=1 0.296000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:15] spid=67 tran=0 db=RMS rows=1 0.176000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:20] spid=67 tran=0 db=RMS rows=1 0.268000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:20] spid=67 tran=0 db=RMS rows=1 0.166000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:25] spid=67 tran=0 db=RMS rows=1 0.302000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:25] spid=67 tran=0 db=RMS rows=1 0.177000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:28] spid=53 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273395 db=RMS rows=1 15.247000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 9 AND a.Company_Code=1
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273395 db=RMS rows=1 0.314000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 9 AND a.Company_Code=1
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273395 db=RMS rows=2 0.149000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 9 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273395 db=RMS rows=2 1.320000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 9 And a.Company_Code = 1 order by a.factor
GO

-- [08/24/2026 03:19:28] spid=53 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:28] spid=53 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:28] spid=53 tran=0 db=RMS rows=0 6.286000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=9 AND b.Uom='CTN' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273474 db=RMS rows=0 2.586000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/A01' AND b.Sku_No=9 AND b.Uom='CTN' ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:28] spid=53 tran=3273492 db=RMS rows=0 2.779000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=9ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:28] spid=53 tran=0 db=RMS rows=0 7.954000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/A01'  AND a.Company_Code=1 AND b.Sku_No=9ORDER BY Invoice_Date DESC
GO

-- [08/24/2026 03:19:30] spid=67 tran=0 db=RMS rows=1 0.300000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:30] spid=67 tran=0 db=RMS rows=1 0.189000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:35] spid=67 tran=0 db=RMS rows=1 0.221000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:35] spid=67 tran=0 db=RMS rows=1 0.067000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:39] spid=53 tran=0 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:39] spid=53 tran=0 db=RMS rows=1 8.009000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SQ_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273534 db=RMS rows=1 0.080000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SQ_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/24/2026 03:19:39] spid=53 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.887000ms  app=.Net SqlClient Data Provider
SELECT SQ_Prelabel, SQ_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
SELECT SQ_Prelabel, SQ_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=0 0.034000ms  app=.Net SqlClient Data Provider
SELECT Quote_Prelabel FROM MP_Quote WHERE Company_Code = 1 AND Quote_Prelabel = 'FST/SQ/004002'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=0 1.076000ms  app=.Net SqlClient Data Provider
SELECT Quote_Prelabel FROM MP_Quote WHERE Company_Code = 1 AND Quote_Prelabel = 'FST/SQ/004002'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 2.802000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote (Company_Code, Quote_Prelabel, Master_Prelabel, Quote_Date, Quote_Expiry, Customer, Term, Status, Ref1, Ref2, Ref3, Ref4, Ref5, Remark1, Remark2, Currency, Rate, Total_Quote_Quantity, Total_Quote_Item, Gross_Amount,Total_Discount_Rate, Total_Discount_Amount, Total_Tax_Rate, Total_Tax_Amount, Net_Amount, Other_Charges, Added_By, Last_Modified_By, LastWriteTimeStamp, Ship_To, Quoted_By, Alternate_Company, Alternate_Doc, Representative_ID, Internal_Reference, Attention_Remark, Added_Date, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_Code, Source_Location_Code, GST_Amount, Rounding_Discount, Total_Amount_B4_GST, Web_Status) VALUES (1,'FST/SQ/004002','FST/SQ/004002', CONVERT(DATETIME,'02-04-2026',103), CONVERT(DATETIME,'02-04-2026',103), '01/A01','030','A','','','','','','','','RM',1,581.000000,3,2734.68,0.0000,0.00,0.0000,0.00,2734.68,0.00,1,1, GETDATE(),0,0,'','',1,'','', GETDATE(), 'N', 0.0000,0.00, CONVERT(DATETIME,'02-05-2026',103),'FST','','','',0.00,0,2734.68,'')
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.101000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote (Company_Code, Quote_Prelabel, Master_Prelabel, Quote_Date, Quote_Expiry, Customer, Term, Status, Ref1, Ref2, Ref3, Ref4, Ref5, Remark1, Remark2, Currency, Rate, Total_Quote_Quantity, Total_Quote_Item, Gross_Amount,Total_Discount_Rate, Total_Discount_Amount, Total_Tax_Rate, Total_Tax_Amount, Net_Amount, Other_Charges, Added_By, Last_Modified_By, LastWriteTimeStamp, Ship_To, Quoted_By, Alternate_Company, Alternate_Doc, Representative_ID, Internal_Reference, Attention_Remark, Added_Date, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_Code, Source_Location_Code, GST_Amount, Rounding_Discount, Total_Amount_B4_GST, Web_Status) VALUES (1,'FST/SQ/004002','FST/SQ/004002', CONVERT(DATETIME,'02-04-2026',103), CONVERT(DATETIME,'02-04-2026',103), '01/A01','030','A','','','','','','','','RM',1,581.000000,3,2734.68,0.0000,0.00,0.0000,0.00,2734.68,0.00,1,1, GETDATE(),0,0,'','',1,'','', GETDATE(), 'N', 0.0000,0.00, CONVERT(DATETIME,'02-05-2026',103),'FST','','','',0.00,0,2734.68,'')
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.059000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 1.173000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.337000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 8.198000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=1 AND a2.Uom='ROL'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.806000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=1 AND a2.Uom='ROL'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.025000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.627000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196838,1,'ROL',1.00,'A',10.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000,120.0000,0,0.00,120.0000,120.0000,120.0000,0,0.00,0,0.00,0,0.00,'',0.00,0.00,1200.00,'2000001000014','',120.0000,88.0000,93.0000,0.0000,88.0000,0.0000,10.0000,0.0000,0.0000,0.0000, CONVERT(DATETIME,'24-08-2026 11:19:05 AM',103),'','','',1,120.0000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 4.408000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196838,1,'ROL',1.00,'A',10.0000,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000,120.0000,0,0.00,120.0000,120.0000,120.0000,0,0.00,0,0.00,0,0.00,'',0.00,0.00,1200.00,'2000001000014','',120.0000,88.0000,93.0000,0.0000,88.0000,0.0000,10.0000,0.0000,0.0000,0.0000, CONVERT(DATETIME,'24-08-2026 11:19:05 AM',103),'','','',1,120.0000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.062000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 10.110000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='EA'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.109000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='EA'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196839,6,'EA',50.00,'A',10.0000,10.0000,1.0000,1.0000,10.0000,10.0000,1.0000,1.0000,3.4000,0,0.00,3.4000,3.4000,0.0680,0,0.00,0,0.00,0,0.00,'',0.00,0.00,34.68,'9557354360065','',3.4000,138.6000,155.0000,0.0000,138.6000,0.0000,10.0000,10.0000,1.0000,1.0000, CONVERT(DATETIME,'24-08-2026 11:19:22 AM',103),'','','',2,3.4000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.064000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 2.205000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196839,6,'EA',50.00,'A',10.0000,10.0000,1.0000,1.0000,10.0000,10.0000,1.0000,1.0000,3.4000,0,0.00,3.4000,3.4000,0.0680,0,0.00,0,0.00,0,0.00,'',0.00,0.00,34.68,'9557354360065','',3.4000,138.6000,155.0000,0.0000,138.6000,0.0000,10.0000,10.0000,1.0000,1.0000, CONVERT(DATETIME,'24-08-2026 11:19:22 AM',103),'','','',2,3.4000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 9.699000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=9 AND a2.Uom='CTN'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.176000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=9 AND a2.Uom='CTN'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.101000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196840,9,'CTN',1.00,'A',10.0000,0.0000,0.0000,0,10.0000,0.0000,0.0000,0,150.0000,0,0.00,150.0000,150.0000,150.0000,0,0.00,0,0.00,0,0.00,'',0.00,0.00,1500.00,'9557354530505','',150.0000,112.0000,120.0000,0.0000,112.0000,0.0000,10.0000,0.0000,0.0000,0, CONVERT(DATETIME,'24-08-2026 11:19:34 AM',103),'','','',3,150.0000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 2.439000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Quote_Item (Location_Code,Company_Code, Quote_Prelabel, Sequence_No, Sku_No, Uom, Factor, Status, Quote_Quantity, Quote_Quantity_Loose, Quote_Foc, Quote_Foc_Loose, Quote_Quantity_Ori, Quote_Quantity_Loose_Ori, Quote_Foc_Ori, Quote_Foc_Loose_Ori, Unit_Price_Ori, Unit_Discount_Rate_Ori, Unit_Discount_Amount_Ori , Approval_Unit_Price, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, GST_Code, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Balance_Quantity, Balance_Quantity_Loose, Balance_Foc, Balance_Foc_Loose, Added_Date, Project_Code, SY_Location_Code, Alternate_Description,Item_Sequence, GST_Price ,Quantity_Loss,Quantity_Original, Nos) VALUES ('FST',1,'FST/SQ/004002',196840,9,'CTN',1.00,'A',10.0000,0.0000,0.0000,0,10.0000,0.0000,0.0000,0,150.0000,0,0.00,150.0000,150.0000,150.0000,0,0.00,0,0.00,0,0.00,'',0.00,0.00,1500.00,'9557354530505','',150.0000,112.0000,120.0000,0.0000,112.0000,0.0000,10.0000,0.0000,0.0000,0, CONVERT(DATETIME,'24-08-2026 11:19:34 AM',103),'','','',3,150.0000,0,10.0000,0)
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 6.456000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SQ_Running_No = ISNULL(SQ_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/24/2026 03:19:39] spid=53 tran=3273535 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SQ_Running_No = ISNULL(SQ_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/24/2026 03:19:40] spid=67 tran=0 db=RMS rows=1 0.234000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:40] spid=67 tran=0 db=RMS rows=1 4.534000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:44] spid=67 tran=0 db=RMS rows=1 0.622000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:44] spid=68 tran=0 db=RMS rows=1 0.150000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:44] spid=68 tran=0 db=RMS rows=0 0.511000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Code as Customer_Code, Name as Customer_Name, Registration_No,
          Address1 as Street1, Address2 as Street2, City, State, Country,
          Postcode as PostCode, Tel_No as Phone, Fax, Email, WebPage,
          Contact_Name as Contact_Person, Mobile, Currency_Type, Status
        FROM AR_Customer
        ORDER BY Code
      '
GO

-- [08/24/2026 03:19:44] spid=67 tran=0 db=RMS rows=1 9.364000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT 
          Company_Logo, Company_Code, Company_Name, Registration_No,
          Street1, Street2, Street3, City, State, Country,
          PostCode, Phone, Fax, Email, WebPage,
          Contact_Person, Mobile, Currency_Type
        FROM PI_Company
        ORDER BY Company_Code
      '
GO

-- [08/24/2026 03:19:45] spid=67 tran=0 db=RMS rows=1 0.270000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:45] spid=67 tran=0 db=RMS rows=1 2.923000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:50] spid=67 tran=0 db=RMS rows=1 0.271000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:50] spid=67 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

-- [08/24/2026 03:19:55] spid=67 tran=0 db=RMS rows=1 0.284000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/24/2026 03:19:55] spid=67 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
exec sp_executesql @statement=N'
        SELECT Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
               PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
               Registration_No, Company_Logo,
               CHECKSUM(Company_Code, Company_Name, Street1, Street2, Street3, City, State, Country, 
                       PostCode, Phone, Fax, Email, WebPage, Contact_Person, Mobile, Currency_Type, 
                       Registration_No) as DataHash
        FROM [RMS].[dbo].[PI_Company]
      '
GO

