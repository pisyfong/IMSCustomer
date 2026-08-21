-- SQL captured 20260821-102431 from 192.168.16.75,49681
-- databases: RMS
-- 175 statements, in execution order

-- [08/21/2026 02:21:22] spid=54 tran=0 db=RMS rows=1 2.226000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:22] spid=54 tran=0 db=RMS rows=1 0.173000ms  app=node-mssql
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

-- [08/21/2026 02:21:27] spid=54 tran=0 db=RMS rows=1 0.223000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:27] spid=54 tran=0 db=RMS rows=1 0.137000ms  app=node-mssql
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

-- [08/21/2026 02:21:32] spid=54 tran=0 db=RMS rows=1 0.294000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:32] spid=54 tran=0 db=RMS rows=1 0.179000ms  app=node-mssql
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

-- [08/21/2026 02:21:37] spid=54 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:37] spid=54 tran=0 db=RMS rows=1 0.144000ms  app=node-mssql
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

-- [08/21/2026 02:21:41] spid=56 tran=0 db=RMS rows=10 0.965000ms  app=.Net SqlClient Data Provider
SELECT Adjustment, Description FROM RMS.dbo.AD_Code_Location WHERE Status='A' AND Company_Code = 1 AND Location_Code='FST'
GO

-- [08/21/2026 02:21:41] spid=56 tran=0 db=RMS rows=10 0.054000ms  app=.Net SqlClient Data Provider
SELECT Adjustment, Description FROM RMS.dbo.AD_Code_Location WHERE Status='A' AND Company_Code = 1 AND Location_Code='FST'
GO

-- [08/21/2026 02:21:42] spid=54 tran=0 db=RMS rows=1 0.283000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:42] spid=54 tran=0 db=RMS rows=1 0.139000ms  app=node-mssql
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

-- [08/21/2026 02:21:44] spid=54 tran=0 db=RMS rows=1 0.277000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:44] spid=53 tran=0 db=RMS rows=1 0.137000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:44] spid=54 tran=0 db=RMS rows=1 0.151000ms  app=node-mssql
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

-- [08/21/2026 02:21:44] spid=53 tran=0 db=RMS rows=0 0.548000ms  app=node-mssql
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

-- [08/21/2026 02:21:47] spid=53 tran=0 db=RMS rows=1 0.296000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:47] spid=53 tran=0 db=RMS rows=1 0.151000ms  app=node-mssql
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

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=1 0.117000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code = 1 AND Location_Code = 'FST' AND Status = 'A'
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=1 1.015000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code = 1 AND Location_Code = 'FST' AND Status = 'A'
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 1.814000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Signature WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 0.072000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Signature WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 0.096000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='' AND Company_Code=1
GO

-- [08/21/2026 02:21:47] spid=56 tran=0 db=RMS rows=0 1.057000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='' AND Company_Code=1
GO

-- [08/21/2026 02:21:52] spid=53 tran=0 db=RMS rows=1 0.307000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:52] spid=53 tran=0 db=RMS rows=1 0.143000ms  app=node-mssql
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

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=7 111.591000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=1 0.421000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=1 0.026000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.031000ms  app=.Net SqlClient Data Provider
Select No,Address1,Address2,Address3,Address4,City,State,Country,Tel_no,Fax_No from ACC.dbo.AR_Customer_ShipTo Where Code='01/N01'  AND Company_Code=1
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.371000ms  app=.Net SqlClient Data Provider
Select No,Address1,Address2,Address3,Address4,City,State,Country,Tel_no,Fax_No from ACC.dbo.AR_Customer_ShipTo Where Code='01/N01'  AND Company_Code=1
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=39 0.910000ms  app=.Net SqlClient Data Provider
Select Batch_No, Batch_Name from AD_Batch where status='O' AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:21:54] spid=56 tran=0 db=RMS rows=39 0.077000ms  app=.Net SqlClient Data Provider
Select Batch_No, Batch_Name from AD_Batch where status='O' AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:21:57] spid=53 tran=0 db=RMS rows=1 0.258000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:21:57] spid=53 tran=0 db=RMS rows=1 1.121000ms  app=node-mssql
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

-- [08/21/2026 02:21:57] spid=56 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:21:57] spid=56 tran=1914939 db=RMS rows=8 0.074000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name AS AddedbyName, c.full_name AS PostedbyName FROM AD_Batch a LEFT OUTER JOIN PI_Users b ON (a.Added_By=b.user_id) LEFT OUTER JOIN PI_Users c ON (a.Posted_By=b.user_id) WHERE Batch_No=4 AND a.Company_Code = 1
GO

-- [08/21/2026 02:21:57] spid=56 tran=0 db=RMS rows=8 5.552000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name AS AddedbyName, c.full_name AS PostedbyName FROM AD_Batch a LEFT OUTER JOIN PI_Users b ON (a.Added_By=b.user_id) LEFT OUTER JOIN PI_Users c ON (a.Posted_By=b.user_id) WHERE Batch_No=4 AND a.Company_Code = 1
GO

-- [08/21/2026 02:22:02] spid=53 tran=0 db=RMS rows=1 0.297000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:02] spid=53 tran=0 db=RMS rows=1 0.160000ms  app=node-mssql
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

-- [08/21/2026 02:22:07] spid=53 tran=0 db=RMS rows=1 0.269000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:07] spid=53 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
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

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=0 0.096000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=7 43.690000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
Select No,Address1,Address2,Address3,Address4,City,State,Country,Tel_no,Fax_No from ACC.dbo.AR_Customer_ShipTo Where Code='01/N01'  AND Company_Code=1
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=0 0.032000ms  app=.Net SqlClient Data Provider
Select No,Address1,Address2,Address3,Address4,City,State,Country,Tel_no,Fax_No from ACC.dbo.AR_Customer_ShipTo Where Code='01/N01'  AND Company_Code=1
GO

-- [08/21/2026 02:22:10] spid=56 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:11] spid=56 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:11] spid=56 tran=0 db=RMS rows=8 0.070000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name AS AddedbyName, c.full_name AS PostedbyName FROM AD_Batch a LEFT OUTER JOIN PI_Users b ON (a.Added_By=b.user_id) LEFT OUTER JOIN PI_Users c ON (a.Posted_By=b.user_id) WHERE Batch_No=4 AND a.Company_Code = 1
GO

-- [08/21/2026 02:22:11] spid=56 tran=1915013 db=RMS rows=8 0.052000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name AS AddedbyName, c.full_name AS PostedbyName FROM AD_Batch a LEFT OUTER JOIN PI_Users b ON (a.Added_By=b.user_id) LEFT OUTER JOIN PI_Users c ON (a.Posted_By=b.user_id) WHERE Batch_No=4 AND a.Company_Code = 1
GO

-- [08/21/2026 02:22:12] spid=53 tran=0 db=RMS rows=1 0.249000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:12] spid=53 tran=0 db=RMS rows=1 0.141000ms  app=node-mssql
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

-- [08/21/2026 02:22:14] spid=53 tran=0 db=RMS rows=1 0.304000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:14] spid=54 tran=0 db=RMS rows=1 0.244000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:14] spid=54 tran=0 db=RMS rows=0 0.589000ms  app=node-mssql
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

-- [08/21/2026 02:22:14] spid=53 tran=0 db=RMS rows=1 2.468000ms  app=node-mssql
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

-- [08/21/2026 02:22:17] spid=56 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:17] spid=56 tran=0 db=RMS rows=8 0.147000ms  app=.Net SqlClient Data Provider
Select User_ID, Full_Name from pi_users where status='A'
GO

-- [08/21/2026 02:22:17] spid=56 tran=0 db=RMS rows=8 2.667000ms  app=.Net SqlClient Data Provider
Select User_ID, Full_Name from pi_users where status='A'
GO

-- [08/21/2026 02:22:17] spid=53 tran=0 db=RMS rows=1 0.214000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:17] spid=53 tran=0 db=RMS rows=1 0.130000ms  app=node-mssql
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

-- [08/21/2026 02:22:20] spid=56 tran=0 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:20] spid=56 tran=0 db=RMS rows=1 35.601000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/21/2026 02:22:20] spid=56 tran=1915100 db=RMS rows=1 1.048000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/21/2026 02:22:22] spid=53 tran=0 db=RMS rows=1 0.112000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:22] spid=53 tran=0 db=RMS rows=1 0.048000ms  app=node-mssql
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

-- [08/21/2026 02:22:25] spid=56 tran=0 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=1 0.287000ms  app=.Net SqlClient Data Provider
SELECT a.Warranty_Period,a.Warranty_Period_Type, a.Item_Type,a.sku_no, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.average_cost as masteraverage, a.standard_cost as masterstandard, a.last_cost as masterlast, a.fifo_cost as masterfifo, a.misc_cost as mastermisc, a1.average_cost, a1.standard_cost, a1.last_cost, a1.fifo_cost, a1.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a1.min_stock_level, a1.max_stock_level, a1.reorder_level, a1.stock_factor, a.discountable, a.article_no, a.size, a.actual_size, a.color, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc, a.allow_zero_price,a.Open_Price,a.Open_Code, a.Ref1, a.Ref2, a.Ref3, a.Ref4,a.Ref1_Text, a.Ref2_Text, a.Ref3_Text, a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, o.Description AS ColorDesc, a.Give_Point, a.Give_Rebate, a.Pack_Size, a.Pack_Size_Desc,  CASE WHEN ISNULL(Use_Location_Company_Comm,'N')='Y' THEN a1.company_comm_rate1 ELSE a.Company_Comm_Rate1 END as company_comm_rate1,  CASE WHEN ISNULL(Use_Location_Company_Comm,'N')='Y' THEN a1.company_comm_rate2 ELSE a.Company_Comm_Rate2 END as company_comm_rate2, a1.promoter_comm_rate1, a1.promoter_comm_rate2, a.Type, a.No_Cost, a.Check_Quota, a.Record_Name, a.Brand, BrandDesc=p.Description, a.Flag4, Master_Budget_Qty=a.Budget_Qty, Master_Budget_Amt=a.Budget_Amt, a1.Budget_Qty, a1.Budget_Amt,a.Purchase_GST_Code,a.Supply_GST_Code, r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate ,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading -a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN SY_Color o ON (o.Code = a.Color  AND o.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand  AND p.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Company_Location q ON (q.Location_Code = 'FST' AND q.Company_Code=a.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON r.Code=a.Purchase_GST_Code LEFT OUTER JOIN SY_Supply_GST_Code s ON s.Code=a.Supply_GST_Code WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=1 17.853000ms  app=.Net SqlClient Data Provider
SELECT a.Warranty_Period,a.Warranty_Period_Type, a.Item_Type,a.sku_no, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.average_cost as masteraverage, a.standard_cost as masterstandard, a.last_cost as masterlast, a.fifo_cost as masterfifo, a.misc_cost as mastermisc, a1.average_cost, a1.standard_cost, a1.last_cost, a1.fifo_cost, a1.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a1.min_stock_level, a1.max_stock_level, a1.reorder_level, a1.stock_factor, a.discountable, a.article_no, a.size, a.actual_size, a.color, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc, a.allow_zero_price,a.Open_Price,a.Open_Code, a.Ref1, a.Ref2, a.Ref3, a.Ref4,a.Ref1_Text, a.Ref2_Text, a.Ref3_Text, a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, o.Description AS ColorDesc, a.Give_Point, a.Give_Rebate, a.Pack_Size, a.Pack_Size_Desc,  CASE WHEN ISNULL(Use_Location_Company_Comm,'N')='Y' THEN a1.company_comm_rate1 ELSE a.Company_Comm_Rate1 END as company_comm_rate1,  CASE WHEN ISNULL(Use_Location_Company_Comm,'N')='Y' THEN a1.company_comm_rate2 ELSE a.Company_Comm_Rate2 END as company_comm_rate2, a1.promoter_comm_rate1, a1.promoter_comm_rate2, a.Type, a.No_Cost, a.Check_Quota, a.Record_Name, a.Brand, BrandDesc=p.Description, a.Flag4, Master_Budget_Qty=a.Budget_Qty, Master_Budget_Amt=a.Budget_Amt, a1.Budget_Qty, a1.Budget_Amt,a.Purchase_GST_Code,a.Supply_GST_Code, r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate ,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading -a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN SY_Color o ON (o.Code = a.Color  AND o.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand  AND p.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Company_Location q ON (q.Location_Code = 'FST' AND q.Company_Code=a.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON r.Code=a.Purchase_GST_Code LEFT OUTER JOIN SY_Supply_GST_Code s ON s.Code=a.Supply_GST_Code WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=1 0.901000ms  app=.Net SqlClient Data Provider
SELECT Price FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No = 6 AND UOm = 'CTN'
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
SELECT Price FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No = 6 AND UOm = 'CTN'
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=2 0.117000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.GST_Price, a.pack_size_desc, a.total_volume, a.total_volume_uom, si_unit_disc, si_unit_disc_rate FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 ORDER BY a.Factor
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=2 1.130000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.GST_Price, a.pack_size_desc, a.total_volume, a.total_volume_uom, si_unit_disc, si_unit_disc_rate FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 ORDER BY a.Factor
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=2 1.507000ms  app=.Net SqlClient Data Provider
SELECT plu_no, sku_no, uom, status FROM In_Stock_PLU WHERE sku_no = 6 And Company_Code = 1 Order By Uom,Status
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915113 db=RMS rows=2 0.604000ms  app=.Net SqlClient Data Provider
SELECT plu_no, sku_no, uom, status FROM In_Stock_PLU WHERE sku_no = 6 And Company_Code = 1 Order By Uom,Status
GO

-- [08/21/2026 02:22:25] spid=56 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915358 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
Select ISNULL(Price_By_Last_PI,'') From AD_Code_Location Where Company_Code=1 AND Adjustment='CN ' AND Location_Code='FST'
GO

-- [08/21/2026 02:22:25] spid=56 tran=0 db=RMS rows=1 1.522000ms  app=.Net SqlClient Data Provider
Select ISNULL(Price_By_Last_PI,'') From AD_Code_Location Where Company_Code=1 AND Adjustment='CN ' AND Location_Code='FST'
GO

-- [08/21/2026 02:22:25] spid=56 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:25] spid=56 tran=0 db=RMS rows=2 6.363000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/21/2026 02:22:25] spid=56 tran=1915400 db=RMS rows=2 0.404000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/21/2026 02:22:27] spid=53 tran=0 db=RMS rows=1 0.300000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:27] spid=53 tran=0 db=RMS rows=1 0.201000ms  app=node-mssql
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

-- [08/21/2026 02:22:32] spid=53 tran=0 db=RMS rows=1 0.238000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:32] spid=53 tran=0 db=RMS rows=1 0.116000ms  app=node-mssql
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

-- [08/21/2026 02:22:37] spid=53 tran=0 db=RMS rows=1 0.290000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:37] spid=53 tran=0 db=RMS rows=1 0.189000ms  app=node-mssql
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

-- [08/21/2026 02:22:42] spid=53 tran=0 db=RMS rows=1 0.291000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:42] spid=53 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
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

-- [08/21/2026 02:22:44] spid=53 tran=0 db=RMS rows=1 0.337000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:44] spid=54 tran=0 db=RMS rows=1 0.201000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:44] spid=53 tran=0 db=RMS rows=1 0.152000ms  app=node-mssql
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

-- [08/21/2026 02:22:44] spid=54 tran=0 db=RMS rows=0 0.558000ms  app=node-mssql
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

-- [08/21/2026 02:22:47] spid=54 tran=0 db=RMS rows=1 0.363000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:47] spid=54 tran=0 db=RMS rows=1 0.166000ms  app=node-mssql
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

-- [08/21/2026 02:22:52] spid=54 tran=0 db=RMS rows=1 0.210000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:52] spid=54 tran=0 db=RMS rows=1 0.101000ms  app=node-mssql
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

-- [08/21/2026 02:22:57] spid=54 tran=0 db=RMS rows=1 0.136000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:22:57] spid=54 tran=0 db=RMS rows=1 0.076000ms  app=node-mssql
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

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:58] spid=56 tran=1915525 db=RMS rows=1 0.207000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='CTN'
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=1 13.350000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='CTN'
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=1 0.453000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=1 0.629000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=1 0.025000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/21/2026 02:22:58] spid=56 tran=0 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/21/2026 02:23:02] spid=54 tran=0 db=RMS rows=1 0.549000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:02] spid=54 tran=0 db=RMS rows=1 12.152000ms  app=node-mssql
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

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915591 db=RMS rows=1 0.817000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(AD_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=1 4.766000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(AD_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=1 3.114000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code = 1 AND Location_Code = 'FST' AND Status = 'A'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=1 0.162000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code = 1 AND Location_Code = 'FST' AND Status = 'A'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.099000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Signature WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 1.413000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Code_Signature WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=1 1.328000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=1 0.086000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/21/2026 02:23:07] spid=56 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.088000ms  app=.Net SqlClient Data Provider
SELECT Adjustment_Prelabel, Running_No FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 1.181000ms  app=.Net SqlClient Data Provider
SELECT Adjustment_Prelabel, Running_No FROM AD_Code_Location WHERE Adjustment='CN' AND Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=0 4.645000ms  app=.Net SqlClient Data Provider
SELECT Adjustment_Prelabel FROM AD_Adjustment WHERE Company_Code = 1 AND Adjustment_Prelabel = 'FST/CN/000496'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=0 0.095000ms  app=.Net SqlClient Data Provider
SELECT Adjustment_Prelabel FROM AD_Adjustment WHERE Company_Code = 1 AND Adjustment_Prelabel = 'FST/CN/000496'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
SELECT Status FROM AD_Batch WHERE Company_Code=1 AND Batch_No = 4
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 1.638000ms  app=.Net SqlClient Data Provider
SELECT Status FROM AD_Batch WHERE Company_Code=1 AND Batch_No = 4
GO

-- [08/21/2026 02:23:07] spid=57 tran=0 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
Select GetDate()
GO

-- [08/21/2026 02:23:07] spid=57 tran=0 db=RMS rows=1 0.195000ms  app=.Net SqlClient Data Provider
Select GetDate()
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 7.075000ms  app=.Net SqlClient Data Provider
INSERT INTO AD_Adjustment (Company_Code, Batch_No, Adjustment_Prelabel, Adjustment_Reference, Adjustment_Date, Adjustment, Code, IsCustomer, Representative_ID, Code_Ship_To, Adjustment_Discount_Rate, Adjustment_Discount_Amount, Other_Charges, Total_Amount, Actual_Total_Amount, Status, Currency, Rate, Remark, Adjustment_By, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Location_Code, Alternate_Company, Alternate_Doc, App_DL_Prelabel, Received_By, Received_Date, Comfirmed_By, Comfirmed_Date, Delivered_By, Delivered_Date, Transport_By, Transport_Date, Closed_By, Closed_Date, Receiving_Reference, Receiving_Way_Bill_No, Receiving_Remark, Receiving_Status, Project_Code, SY_Location_Code, Other_Charges_Rate, Ref5, Ref1, Ref2, Ref3, Ref4, PI_Ref1, PI_Ref2, PI_Ref3, PI_Ref4, Source_Location_Code, Allow_Discount_Note, DN_Adjustment_Prelabel,  Internal_Reference, Remark2, Download_Prelabel, GST_Amount, Rounding_Discount, Total_Amount_B4_GST, GST_Apply_To,GST_Apply_To_Date, Link_Account, Term, Due_Date,ACC_Entry_Reference, Service_Code, EI_QR_URL) VALUES (1,4,'FST/CN/000496','', CONVERT(datetime,'21-08-2026', 103), 'CN','01/N01','Y',3,0,0.0000,0.00,0.00,155.00,155.00,'A','RM',1,'',1,1, GETDATE(), 1, GETDATE(), GETDATE(), 'FST','','','',0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), '','','','A','','',0.0000,'','','','','','','','','','','N','','','','',0,0.00,155.00,'',NULL,'N','060',CONVERT(DATETIME,'20-10-2026',103) ,'','','')
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.235000ms  app=.Net SqlClient Data Provider
INSERT INTO AD_Adjustment (Company_Code, Batch_No, Adjustment_Prelabel, Adjustment_Reference, Adjustment_Date, Adjustment, Code, IsCustomer, Representative_ID, Code_Ship_To, Adjustment_Discount_Rate, Adjustment_Discount_Amount, Other_Charges, Total_Amount, Actual_Total_Amount, Status, Currency, Rate, Remark, Adjustment_By, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Location_Code, Alternate_Company, Alternate_Doc, App_DL_Prelabel, Received_By, Received_Date, Comfirmed_By, Comfirmed_Date, Delivered_By, Delivered_Date, Transport_By, Transport_Date, Closed_By, Closed_Date, Receiving_Reference, Receiving_Way_Bill_No, Receiving_Remark, Receiving_Status, Project_Code, SY_Location_Code, Other_Charges_Rate, Ref5, Ref1, Ref2, Ref3, Ref4, PI_Ref1, PI_Ref2, PI_Ref3, PI_Ref4, Source_Location_Code, Allow_Discount_Note, DN_Adjustment_Prelabel,  Internal_Reference, Remark2, Download_Prelabel, GST_Amount, Rounding_Discount, Total_Amount_B4_GST, GST_Apply_To,GST_Apply_To_Date, Link_Account, Term, Due_Date,ACC_Entry_Reference, Service_Code, EI_QR_URL) VALUES (1,4,'FST/CN/000496','', CONVERT(datetime,'21-08-2026', 103), 'CN','01/N01','Y',3,0,0.0000,0.00,0.00,155.00,155.00,'A','RM',1,'',1,1, GETDATE(), 1, GETDATE(), GETDATE(), 'FST','','','',0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), 0,CONVERT(DATETIME,'01-01-1900',103), '','','','A','','',0.0000,'','','','','','','','','','','N','','','','',0,0.00,155.00,'',NULL,'N','060',CONVERT(DATETIME,'20-10-2026',103) ,'','','')
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.026000ms  app=.Net SqlClient Data Provider
UPDATE AD_Code_Location SET Running_No = ISNULL(Running_No,0) + 1 WHERE Adjustment = 'CN' AND Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.816000ms  app=.Net SqlClient Data Provider
UPDATE AD_Code_Location SET Running_No = ISNULL(Running_No,0) + 1 WHERE Adjustment = 'CN' AND Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/21/2026 02:23:07] spid=57 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/21/2026 02:23:07] spid=57 tran=0 db=RMS rows=0 4.164000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Fifo_Out WHERE Company_Code=1 AND Fifo_In_Identity_No=0 ORDER BY Sku_No, Added_DAte
GO

-- [08/21/2026 02:23:07] spid=57 tran=0 db=RMS rows=0 0.696000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Fifo_Out WHERE Company_Code=1 AND Fifo_In_Identity_No=0 ORDER BY Sku_No, Added_DAte
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.102000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET qty_on_adj_in = qty_on_adj_in + 2.000000, Last_Modified_By=1, LastWriteTimeStamp = GETDATE()  WHERE Sku_No = 6 AND Company_Code=1
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 9.078000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET qty_on_adj_in = qty_on_adj_in + 2.000000, Last_Modified_By=1, LastWriteTimeStamp = GETDATE()  WHERE Sku_No = 6 AND Company_Code=1
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 2.945000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.114000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET qty_on_adj_in = qty_on_adj_in + 2.000000 WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 3.275000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET qty_on_adj_in = qty_on_adj_in + 2.000000 WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 5.234000ms  app=.Net SqlClient Data Provider
INSERT INTO AD_Adjustment_Item (Company_Code, Adjustment_Prelabel, Sequence_No, Location_Code, Sku_No, Uom, Factor, Quantity, FOC_Quantity, Sign, Unit_Cost, Actual_Unit_Cost, Discount_Rate, Discount_Amount, Total_Amount, Actual_Total_Amount, Status, Remark, Average_Cost, Standard_Cost, FIFO_Cost, Last_Cost, Misc_Cost, Selling_Price, Plu_No, Added_Date, Project_Code, SY_Location_Code, Discount_Qty, Calculate_Amt_By_DiscountQty, Name_No, Discount_Rate1, Discount_Amount1, Discount_Rate2, Discount_Amount2, GST_Code, Tax_Rate, Tax_Amount, DiscByRate, TaxByRate,Item_Sequence, Alternate_Description, Remark2,Quantity_Loss,Quantity_Original, Nos, Expiry_Date) VALUES (1,'FST/CN/000496',1,'FST',6,'CTN',1.00,1.0000,1.0000,1,155.0000,155.0000,0,0.00,155.00,155.00,'A','return',138.6000,155.0000,0.0000,138.6000,0.0000,170.00,'9557354360508', GETDATE(), '','',0.0000,'N',0,0,0.00,0,0.00,'',0.00,0,'N','Y',1,'','',0,1.0000,0,NULL)
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=1 0.139000ms  app=.Net SqlClient Data Provider
INSERT INTO AD_Adjustment_Item (Company_Code, Adjustment_Prelabel, Sequence_No, Location_Code, Sku_No, Uom, Factor, Quantity, FOC_Quantity, Sign, Unit_Cost, Actual_Unit_Cost, Discount_Rate, Discount_Amount, Total_Amount, Actual_Total_Amount, Status, Remark, Average_Cost, Standard_Cost, FIFO_Cost, Last_Cost, Misc_Cost, Selling_Price, Plu_No, Added_Date, Project_Code, SY_Location_Code, Discount_Qty, Calculate_Amt_By_DiscountQty, Name_No, Discount_Rate1, Discount_Amount1, Discount_Rate2, Discount_Amount2, GST_Code, Tax_Rate, Tax_Amount, DiscByRate, TaxByRate,Item_Sequence, Alternate_Description, Remark2,Quantity_Loss,Quantity_Original, Nos, Expiry_Date) VALUES (1,'FST/CN/000496',1,'FST',6,'CTN',1.00,1.0000,1.0000,1,155.0000,155.0000,0,0.00,155.00,155.00,'A','return',138.6000,155.0000,0.0000,138.6000,0.0000,170.00,'9557354360508', GETDATE(), '','',0.0000,'N',0,0,0.00,0,0.00,'',0.00,0,'N','Y',1,'','',0,1.0000,0,NULL)
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=0 0.113000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*1*a.Sign)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,b.Sign,sum(b.Nos) as TotalQty  From AD_Adjustment a  Inner Join AD_Adjustment_Item b  ON (a.Company_Code=b.Company_Code AND a.Adjustment_Prelabel=b.Adjustment_Prelabel)  Where b.Nos<>0 AND a.Adjustment_Prelabel='FST/CN/000496' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No,b.Sign  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No)
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=0 0.070000ms  app=.Net SqlClient Data Provider
Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*1*a.Sign)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No,b.Sign, sum(b.Nos) as TotalQty  From AD_Adjustment a  Inner Join AD_Adjustment_Item b  ON (a.Company_Code=b.Company_Code AND a.Adjustment_Prelabel=b.Adjustment_Prelabel)  Where b.Nos<>0 AND a.Adjustment_Prelabel='FST/CN/000496' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No,b.Sign  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/21/2026 02:23:07] spid=56 tran=1915605 db=RMS rows=0 13.572000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*1*a.Sign)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,b.Sign,sum(b.Nos) as TotalQty  From AD_Adjustment a  Inner Join AD_Adjustment_Item b  ON (a.Company_Code=b.Company_Code AND a.Adjustment_Prelabel=b.Adjustment_Prelabel)  Where b.Nos<>0 AND a.Adjustment_Prelabel='FST/CN/000496' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No,b.Sign  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No) 
 Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*1*a.Sign)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No,b.Sign, sum(b.Nos) as TotalQty  From AD_Adjustment a  Inner Join AD_Adjustment_Item b  ON (a.Company_Code=b.Company_Code AND a.Adjustment_Prelabel=b.Adjustment_Prelabel)  Where b.Nos<>0 AND a.Adjustment_Prelabel='FST/CN/000496' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No,b.Sign  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/21/2026 02:23:07] spid=54 tran=0 db=RMS rows=1 0.198000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:07] spid=54 tran=0 db=RMS rows=1 0.104000ms  app=node-mssql
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

-- [08/21/2026 02:23:12] spid=54 tran=0 db=RMS rows=1 0.302000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:12] spid=54 tran=0 db=RMS rows=1 0.182000ms  app=node-mssql
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

-- [08/21/2026 02:23:14] spid=54 tran=0 db=RMS rows=1 0.295000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:14] spid=53 tran=0 db=RMS rows=1 0.285000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:14] spid=53 tran=0 db=RMS rows=0 0.575000ms  app=node-mssql
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

-- [08/21/2026 02:23:14] spid=54 tran=0 db=RMS rows=1 2.465000ms  app=node-mssql
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

-- [08/21/2026 02:23:17] spid=54 tran=0 db=RMS rows=1 0.300000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:17] spid=54 tran=0 db=RMS rows=1 0.161000ms  app=node-mssql
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

-- [08/21/2026 02:23:22] spid=54 tran=0 db=RMS rows=1 0.288000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:22] spid=54 tran=0 db=RMS rows=1 0.164000ms  app=node-mssql
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

-- [08/21/2026 02:23:27] spid=54 tran=0 db=RMS rows=1 0.219000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:27] spid=54 tran=0 db=RMS rows=1 0.069000ms  app=node-mssql
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

-- [08/21/2026 02:23:32] spid=54 tran=0 db=RMS rows=1 0.309000ms  app=node-mssql
exec sp_executesql @statement=N'SELECT 1;'
GO

-- [08/21/2026 02:23:32] spid=54 tran=0 db=RMS rows=1 0.188000ms  app=node-mssql
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

