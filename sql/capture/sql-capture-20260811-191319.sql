-- SQL captured 20260811-191319 from 192.168.16.75,49681
-- databases: RMS
-- 705 statements, in execution order

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 19.734000ms  app=.Net SqlClient Data Provider
Select Def_Company_Code,user_id, login_name, full_name, password, status, access_level, Show_Cost, Skip_Item_Authorization, designation, email, phone_no, last_login_time, last_logout_time, added_date, lastmodifiedby, lastwritetimestamp,Check_User_Vendor from PI_Users where  login_name = 'ims' and Password = '1234' and Status = 'A'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 0.439000ms  app=.Net SqlClient Data Provider
Select Def_Company_Code,user_id, login_name, full_name, password, status, access_level, Show_Cost, Skip_Item_Authorization, designation, email, phone_no, last_login_time, last_logout_time, added_date, lastmodifiedby, lastwritetimestamp,Check_User_Vendor from PI_Users where  login_name = 'ims' and Password = '1234' and Status = 'A'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.339000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.089000ms  app=.Net SqlClient Data Provider
Select * from rms.dbo.SY_Remote_Server Where Remote_Server='.\FUNGSENG'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 2.892000ms  app=.Net SqlClient Data Provider
Select * from rms.dbo.SY_Remote_Server Where Remote_Server='.\FUNGSENG'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=474 6.383000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id  AND b.status = 'A' ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777086 db=RMS rows=474 0.448000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id  AND b.status = 'A' ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777090 db=RMS rows=1 0.654000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 6.865000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 157.353000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777313 db=RMS rows=1 6.338000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:11:27] spid=60 tran=0 db=RMS rows=1 0.306000ms  app=.Net SqlClient Data Provider
Select Counter_No From RMS.dbo.PI_Counter Where Company_Code=0 AND Counter_Name='CUSTOMER2_ID'
GO

-- [08/11/2026 11:11:27] spid=60 tran=0 db=RMS rows=1 2.266000ms  app=.Net SqlClient Data Provider
Select Counter_No From RMS.dbo.PI_Counter Where Company_Code=0 AND Counter_Name='CUSTOMER2_ID'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.019000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 10.960000ms  app=.Net SqlClient Data Provider
Select Location_Code, ISNULL(DocRunningFollowLocationCode,'') as DocRunningFollowLocationCode , ISNULL(DocRunningFollowLocationCodeAD,'') as DocRunningFollowLocationCodeAD from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777330 db=RMS rows=1 0.402000ms  app=.Net SqlClient Data Provider
Select Location_Code, ISNULL(DocRunningFollowLocationCode,'') as DocRunningFollowLocationCode , ISNULL(DocRunningFollowLocationCodeAD,'') as DocRunningFollowLocationCodeAD from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=19 0.630000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Purchase_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=19 4.645000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Purchase_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=17 3.518000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Supply_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=17 0.504000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Supply_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777352 db=RMS rows=1 0.025000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnVMS,'') From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 0.252000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnVMS,'') From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=5 2.947000ms  app=.Net SqlClient Data Provider
Select a.* from RMS.dbo.IN_Stock_Setup_Plu a Where a.Status='True' And a.company_code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=5 0.945000ms  app=.Net SqlClient Data Provider
Select a.* from RMS.dbo.IN_Stock_Setup_Plu a Where a.Status='True' And a.company_code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777359 db=RMS rows=1 1.814000ms  app=.Net SqlClient Data Provider
Select Location_Code,Use_GST,Compulsory_GST, Name, ISNULL(Default_Doc_Printer_Path,'') as Default_Doc_Printer_Path, ISNULL(ACC_Entry_Ref_Setting,'') as ACC_Entry_Ref_Setting  ,* from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 4.400000ms  app=.Net SqlClient Data Provider
Select Location_Code,Use_GST,Compulsory_GST, Name, ISNULL(Default_Doc_Printer_Path,'') as Default_Doc_Printer_Path, ISNULL(ACC_Entry_Ref_Setting,'') as ACC_Entry_Ref_Setting  ,* from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 0.223000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnCTL,'') From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777361 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnCTL,'') From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.265000ms  app=.Net SqlClient Data Provider
Select Price_Type from PI_Company_Location Where company_code=1 and location_Code=''
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 1.844000ms  app=.Net SqlClient Data Provider
Select Price_Type from PI_Company_Location Where company_code=1 and location_Code=''
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 63.475000ms  app=.Net SqlClient Data Provider
SELECT a.Use_PTS,a.Location_Code,a.Update_Batch_Expiry,a.Update_Serial_No,a.Update_Qty_On_Sales,a.Location_Code,a.Use_Instalment,a.Instalment_Ref1,a.Instalment_Ref2, a.Member_Lookup_Get_Last,a.Tax_Rate FROM POS.dbo.SY_Company a
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777403 db=RMS rows=1 0.223000ms  app=.Net SqlClient Data Provider
SELECT a.Use_PTS,a.Location_Code,a.Update_Batch_Expiry,a.Update_Serial_No,a.Update_Qty_On_Sales,a.Location_Code,a.Use_Instalment,a.Instalment_Ref1,a.Instalment_Ref2, a.Member_Lookup_Get_Last,a.Tax_Rate FROM POS.dbo.SY_Company a
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777457 db=RMS rows=1 0.708000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 38.926000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 2.816000ms  app=.Net SqlClient Data Provider
Select a.company_Code as company, cast(a.Company_Code as nvarchar(3))+'-'+a.Company_Name as Company_Code, a.Pos_DB_name, b.User_Id From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) where b.User_id = 1 ORDER BY a.Company_Code
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777467 db=RMS rows=1 0.267000ms  app=.Net SqlClient Data Provider
Select a.company_Code as company, cast(a.Company_Code as nvarchar(3))+'-'+a.Company_Name as Company_Code, a.Pos_DB_name, b.User_Id From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) where b.User_id = 1 ORDER BY a.Company_Code
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777470 db=RMS rows=1 0.168000ms  app=.Net SqlClient Data Provider
Select Price_type,ISNULL(Read_only,'False') as Read_only from pi_User_mp_Price_Access where company_Code=1 And user_id=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 3.077000ms  app=.Net SqlClient Data Provider
Select Price_type,ISNULL(Read_only,'False') as Read_only from pi_User_mp_Price_Access where company_Code=1 And user_id=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 6.504000ms  app=.Net SqlClient Data Provider
Select a.Location_Code,b.Name,a.Def_Location,b.Price_Type,Area,Zone,ISNULL(b.Adjustment_UnitPrice, 0) AS Adjustment_UnitPrice, Connection, ISNULL(b.Use_Location_Cost,'N') AS Use_Location_Cost, ISNULL(b.Use_Location_Price,'N') AS Use_Location_Price,b.Company_No, ISNULL(a.Show_Cost,'N') as Show_Cost, Company_No as ACC_Company, Use_GST, Compulsory_GST, Use_SST FROM PI_User_Company_Access_Location a Inner Join PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) WHERE a.Company_Code=1 AND a.User_ID=1 and Status = 'A' ORDER BY b.[Order]
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777485 db=RMS rows=1 0.558000ms  app=.Net SqlClient Data Provider
Select a.Location_Code,b.Name,a.Def_Location,b.Price_Type,Area,Zone,ISNULL(b.Adjustment_UnitPrice, 0) AS Adjustment_UnitPrice, Connection, ISNULL(b.Use_Location_Cost,'N') AS Use_Location_Cost, ISNULL(b.Use_Location_Price,'N') AS Use_Location_Price,b.Company_No, ISNULL(a.Show_Cost,'N') as Show_Cost, Company_No as ACC_Company, Use_GST, Compulsory_GST, Use_SST FROM PI_User_Company_Access_Location a Inner Join PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) WHERE a.Company_Code=1 AND a.User_ID=1 and Status = 'A' ORDER BY b.[Order]
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777495 db=RMS rows=1 0.287000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, a.Attachment_Path, a.PR_Attachment_Path, a.PO_Attachment_Path, a.PD_Attachment_Path, a.PI_Attachment_Path, a.SQ_Attachment_Path, a.SO_Attachment_Path, a.SD_Attachment_Path, a.SI_Attachment_Path, a.AD_Attachment_Path, a.Packing_Attachment_Path, a.Item_Attachment_Path, a.Member_Attachment_Path, a.IR_Attachment_Path, a.PR_Attachment_Level, a.PO_Attachment_Level, a.PD_Attachment_Level, a.PI_Attachment_Level, a.SQ_Attachment_Level, a.SO_Attachment_Level, a.SD_Attachment_Level, a.SI_Attachment_Level, a.AD_Attachment_Level, a.Packing_Attachment_Level, a.Item_Attachment_Level, a.Member_Attachment_Level, a.IR_Attachment_Level, a.Attachment_Level, a.ST_Attachment_Level, a.PR_Attachment_Folder, a.PO_Attachment_Folder, a.PD_Attachment_Folder, a.PI_Attachment_Folder, a.SQ_Attachment_Folder, a.SO_Attachment_Folder, a.SD_Attachment_Folder, a.SI_Attachment_Folder, a.AD_Attachment_Folder, a.Packing_Attachment_Folder, a.Item_Attachment_Folder, a.Member_Attachment_Folder, a.ST_Attachment_Folder, a.IR_Attachment_Folder, a.Attachment_Folder, a.Attachment_DocType, a.PR_Attachment_DocType, a.PO_Attachment_DocType, a.PD_Attachment_DocType, a.PI_Attachment_DocType, a.SQ_Attachment_DocType, a.SO_Attachment_DocType, a.SD_Attachment_DocType, a.SI_Attachment_DocType, a.AD_Attachment_DocType, a.Packing_Attachment_DocType, a.Item_Attachment_DocType, a.Member_Attachment_DocType, a.IR_Attachment_DocType, a.ST_Attachment_DocType, ISNULL(b.Def_Location,'N') AS Def_Location,Attachment_File_Format FROM PI_Company_Location a LEFT OUTER JOIN PI_User_Company_Access_Location b ON a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code WHERE a.Company_Code = 1 AND b.User_Id = 1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 2.827000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, a.Attachment_Path, a.PR_Attachment_Path, a.PO_Attachment_Path, a.PD_Attachment_Path, a.PI_Attachment_Path, a.SQ_Attachment_Path, a.SO_Attachment_Path, a.SD_Attachment_Path, a.SI_Attachment_Path, a.AD_Attachment_Path, a.Packing_Attachment_Path, a.Item_Attachment_Path, a.Member_Attachment_Path, a.IR_Attachment_Path, a.PR_Attachment_Level, a.PO_Attachment_Level, a.PD_Attachment_Level, a.PI_Attachment_Level, a.SQ_Attachment_Level, a.SO_Attachment_Level, a.SD_Attachment_Level, a.SI_Attachment_Level, a.AD_Attachment_Level, a.Packing_Attachment_Level, a.Item_Attachment_Level, a.Member_Attachment_Level, a.IR_Attachment_Level, a.Attachment_Level, a.ST_Attachment_Level, a.PR_Attachment_Folder, a.PO_Attachment_Folder, a.PD_Attachment_Folder, a.PI_Attachment_Folder, a.SQ_Attachment_Folder, a.SO_Attachment_Folder, a.SD_Attachment_Folder, a.SI_Attachment_Folder, a.AD_Attachment_Folder, a.Packing_Attachment_Folder, a.Item_Attachment_Folder, a.Member_Attachment_Folder, a.ST_Attachment_Folder, a.IR_Attachment_Folder, a.Attachment_Folder, a.Attachment_DocType, a.PR_Attachment_DocType, a.PO_Attachment_DocType, a.PD_Attachment_DocType, a.PI_Attachment_DocType, a.SQ_Attachment_DocType, a.SO_Attachment_DocType, a.SD_Attachment_DocType, a.SI_Attachment_DocType, a.AD_Attachment_DocType, a.Packing_Attachment_DocType, a.Item_Attachment_DocType, a.Member_Attachment_DocType, a.IR_Attachment_DocType, a.ST_Attachment_DocType, ISNULL(b.Def_Location,'N') AS Def_Location,Attachment_File_Format FROM PI_Company_Location a LEFT OUTER JOIN PI_User_Company_Access_Location b ON a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code WHERE a.Company_Code = 1 AND b.User_Id = 1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 67.441000ms  app=.Net SqlClient Data Provider
Select Code,Description from ACC.dbo.CM_Commission_Type Where company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.100000ms  app=.Net SqlClient Data Provider
Select Code,Description from ACC.dbo.CM_Commission_Type Where company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.278000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_prelabel WHERE status = 'A'
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 2.283000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_prelabel WHERE status = 'A'
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.363000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777538 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777543 db=RMS rows=1 0.177000ms  app=.Net SqlClient Data Provider
Select ISNULL(Use_EI,'N') as Use_EI From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.314000ms  app=.Net SqlClient Data Provider
Select count(*) from SY_My_List Where User_ID=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 2.405000ms  app=.Net SqlClient Data Provider
Select count(*) from SY_My_List Where User_ID=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.440000ms  app=.Net SqlClient Data Provider
Select ISNULL(Use_EI,'N') as Use_EI From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.961000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(ACC_Export_Method,0) FROM PI_Company WHERE Company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777545 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(ACC_Export_Method,0) FROM PI_Company WHERE Company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777547 db=RMS rows=1 0.244000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_MY_Cart,'N') as Allow_My_Cart From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777549 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_Edit_Posted_PI_With_PD,'N') as Allow_Edit_Posted_PI_With_PD From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.502000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_MY_Cart,'N') as Allow_My_Cart From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.510000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_Edit_Posted_PI_With_PD,'N') as Allow_Edit_Posted_PI_With_PD From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.566000ms  app=.Net SqlClient Data Provider
Select ISNULL(Import_From,'') as Import_From From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777551 db=RMS rows=1 0.230000ms  app=.Net SqlClient Data Provider
Select ISNULL(Import_From,'') as Import_From From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777555 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_B2B,'N') as Allow_B2B From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777553 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
Select ISNULL(Split_Send_Tab,'Y') as Split_Send_Tab From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.348000ms  app=.Net SqlClient Data Provider
Select ISNULL(Split_Send_Tab,'Y') as Split_Send_Tab From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.385000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_B2B,'N') as Allow_B2B From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.030000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 3.265000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Company_Name a  Inner Join RMS.dbo.PI_User_Company_Name b ON (a.Company_Code=b.Company_Code AND a.Name_No=b.Name_No )  Where a.Company_Code=1 AND b.User_ID=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777561 db=RMS rows=0 0.089000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Company_Name a  Inner Join RMS.dbo.PI_User_Company_Name b ON (a.Company_Code=b.Company_Code AND a.Name_No=b.Name_No )  Where a.Company_Code=1 AND b.User_ID=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.039000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 1.970000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 3.219000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.097000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.017000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=5 0.482000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Module_Access AS a WHERE a.Company_Code = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=5 3.885000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Module_Access AS a WHERE a.Company_Code = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=51 2.470000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Menu_Access AS a WHERE a.Company_Code =1 AND ( Module_No=1 OR  Module_No=2 OR  Module_No=3 OR  Module_No=4 OR  Module_No=8) Order By a.Module_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777576 db=RMS rows=51 0.270000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Menu_Access AS a WHERE a.Company_Code =1 AND ( Module_No=1 OR  Module_No=2 OR  Module_No=3 OR  Module_No=4 OR  Module_No=8) Order By a.Module_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777578 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=1 0.844000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=1 0.875000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Structure_Enquiry,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777580 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Structure_Enquiry,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777583 db=RMS rows=0 0.105000ms  app=.Net SqlClient Data Provider
Select isnull(Monday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 3.064000ms  app=.Net SqlClient Data Provider
Select isnull(Monday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.921000ms  app=.Net SqlClient Data Provider
Select isnull(Tuesday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777585 db=RMS rows=0 0.052000ms  app=.Net SqlClient Data Provider
Select isnull(Tuesday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777591 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Friday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777589 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Thursday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777587 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
Select isnull(Wednesday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.239000ms  app=.Net SqlClient Data Provider
Select isnull(Thursday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.241000ms  app=.Net SqlClient Data Provider
Select isnull(Friday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.560000ms  app=.Net SqlClient Data Provider
Select isnull(Wednesday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.237000ms  app=.Net SqlClient Data Provider
Select isnull(Saturday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.239000ms  app=.Net SqlClient Data Provider
Select isnull(Sunday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777595 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Sunday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777593 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Saturday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777703 db=RMS rows=0 0.111000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 88.761000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 8.540000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c ON (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d ON (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 And EXISTS  ( Select * from MY_Cart_Receiver a1 Where a.Company_Code=a1.Company_Code And a.Cart_No=a1.Cart_No And a1.Receiver_ID=1 AND a1.Receiver_ID<>a.Added_By )  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777746 db=RMS rows=0 0.487000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c ON (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d ON (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 And EXISTS  ( Select * from MY_Cart_Receiver a1 Where a.Company_Code=a1.Company_Code And a.Cart_No=a1.Cart_No And a1.Receiver_ID=1 AND a1.Receiver_ID<>a.Added_By )  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777784 db=RMS rows=0 0.068000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=0 AND a.B2B_Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 6.049000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=0 AND a.B2B_Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 29.542000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,'' as [Delete],a.Ordering As No,Cast(a.Qty*a.Price as money) as Total_Amount, a.*, CASE WHEN ISNULL(a.Vendor,'')='' then ISNULL(x.PIVendor,'') else a.Vendor END as VendorCode, ISNULL(e.Name,x.PIVendorName) as VendorName, b.Description, c.factor, c.GST_Price As GSTPrice, x.*, b.Qty_On_Order as POQty_All, c1.Qty_On_Order as POQty_Loc, y.Cart_Date , CASE WHEN CHARINDEX('/', REVERSE(Audio1)) > 0 THEN RIGHT(Audio1, CHARINDEX('/', REVERSE(Audio1)) - 1) ELSE '' END AS AudioFilename1, '' as btnAudio1 , CASE WHEN CHARINDEX('/', REVERSE(Audio2)) > 0 THEN RIGHT(Audio2, CHARINDEX('/', REVERSE(Audio2)) - 1) ELSE '' END AS AudioFilename2, '' as btnAudio2  From My_Cart_item a  inner join MY_Cart y ON (a.Company_Code=y.Company_Code And a.Cart_No=y.Cart_No)  Inner Join In_stock b ON (a.Company_Code=b.Company_Code And a.Sku_No=b.Sku_No )  Inner Join In_stock_Uom c On (a.Company_Code=c.Company_Code And a.Sku_No=c.Sku_No And a.Uom=c.uom )  Left Outer Join In_stock_Location c1 On (y.Company_Code=c1.Company_Code And y.Location_Code=c1.Location_Code And a.Sku_No=c1.Sku_No )  inner join PI_Company_Location d on (y.Company_Code = d.Company_Code And y.Location_Code = d.Location_Code)   Left Outer Join ACC.dbo.AP_Vendor e ON (a.Vendor=e.Code And e.Company_Code=d.Company_No )   Outer apply(           Select Top 1 a1.Location_Code as PILoc, a1.Invoice_prelabel, a1.Quantity as  PIQty, a1.Unit_Cost, a1.Uom as PIUom, a1.Factor as PIFactor, a1.Unit_Discount_Rate, a1.Unit_Discount_Amount, b1.Currency, a1.Net_Amount,CN_Unit_Price, CN_Total_Amount           , Invoice_Date, a1.New_Cost, c1.Code as PIVendor, c1.Code + '-' + c1.Name as PIVendorName From Pr_Invoice_item a1            Inner Join PR_Invoice b1 On (a1.Company_Code=b1.Company_Code And a1.Invoice_PreLabel=b1.Invoice_PreLabel)            Inner Join PI_Company_Location l1 On (a1.Company_Code=l1.Company_Code And a1.Location_Code=l1.Location_Code)            Inner Join ACC.dbo.AP_Vendor c1 ON (b1.Vendor=c1.Code And c1.Company_Code=l1.Company_No )            Where b.Sku_No = a1.Sku_No And b.Company_Code = a1.Company_Code  AND y.Last_PI_Loction_Code LIKE  '%' + rtrim(a1.Location_Code) + '%'           Order by b1.Invoice_Date desc  ) x   Where a.Company_Code=1 AND a.Cart_No=''  Order by a.Ordering
GO

-- [08/11/2026 11:11:29] spid=58 tran=16778040 db=RMS rows=0 0.385000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,'' as [Delete],a.Ordering As No,Cast(a.Qty*a.Price as money) as Total_Amount, a.*, CASE WHEN ISNULL(a.Vendor,'')='' then ISNULL(x.PIVendor,'') else a.Vendor END as VendorCode, ISNULL(e.Name,x.PIVendorName) as VendorName, b.Description, c.factor, c.GST_Price As GSTPrice, x.*, b.Qty_On_Order as POQty_All, c1.Qty_On_Order as POQty_Loc, y.Cart_Date , CASE WHEN CHARINDEX('/', REVERSE(Audio1)) > 0 THEN RIGHT(Audio1, CHARINDEX('/', REVERSE(Audio1)) - 1) ELSE '' END AS AudioFilename1, '' as btnAudio1 , CASE WHEN CHARINDEX('/', REVERSE(Audio2)) > 0 THEN RIGHT(Audio2, CHARINDEX('/', REVERSE(Audio2)) - 1) ELSE '' END AS AudioFilename2, '' as btnAudio2  From My_Cart_item a  inner join MY_Cart y ON (a.Company_Code=y.Company_Code And a.Cart_No=y.Cart_No)  Inner Join In_stock b ON (a.Company_Code=b.Company_Code And a.Sku_No=b.Sku_No )  Inner Join In_stock_Uom c On (a.Company_Code=c.Company_Code And a.Sku_No=c.Sku_No And a.Uom=c.uom )  Left Outer Join In_stock_Location c1 On (y.Company_Code=c1.Company_Code And y.Location_Code=c1.Location_Code And a.Sku_No=c1.Sku_No )  inner join PI_Company_Location d on (y.Company_Code = d.Company_Code And y.Location_Code = d.Location_Code)   Left Outer Join ACC.dbo.AP_Vendor e ON (a.Vendor=e.Code And e.Company_Code=d.Company_No )   Outer apply(           Select Top 1 a1.Location_Code as PILoc, a1.Invoice_prelabel, a1.Quantity as  PIQty, a1.Unit_Cost, a1.Uom as PIUom, a1.Factor as PIFactor, a1.Unit_Discount_Rate, a1.Unit_Discount_Amount, b1.Currency, a1.Net_Amount,CN_Unit_Price, CN_Total_Amount           , Invoice_Date, a1.New_Cost, c1.Code as PIVendor, c1.Code + '-' + c1.Name as PIVendorName From Pr_Invoice_item a1            Inner Join PR_Invoice b1 On (a1.Company_Code=b1.Company_Code And a1.Invoice_PreLabel=b1.Invoice_PreLabel)            Inner Join PI_Company_Location l1 On (a1.Company_Code=l1.Company_Code And a1.Location_Code=l1.Location_Code)            Inner Join ACC.dbo.AP_Vendor c1 ON (b1.Vendor=c1.Code And c1.Company_Code=l1.Company_No )            Where b.Sku_No = a1.Sku_No And b.Company_Code = a1.Company_Code  AND y.Last_PI_Loction_Code LIKE  '%' + rtrim(a1.Location_Code) + '%'           Order by b1.Invoice_Date desc  ) x   Where a.Company_Code=1 AND a.Cart_No=''  Order by a.Ordering
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.017000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=2 72.130000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'In_Stock_Setup_Sel'
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 71.468000ms  app=.Net SqlClient Data Provider
exec In_Stock_Setup_Sel @CompanyCode=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.210000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 1.488000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.779000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.484000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=11 0.539000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=11 1.892000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 2.027000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.080000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.078000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 2.155000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 1.592000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.074000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=4 0.279000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.046000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=4 1.171000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.568000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.047000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.050000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.558000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.050000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=16778755 db=RMS rows=0 0.352000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 2.912000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.450000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=2 0.589000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'MP_Setup_Sel'
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 16.098000ms  app=.Net SqlClient Data Provider
exec MP_Setup_Sel @CompanyCode=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=11 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=11 0.037000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 1.230000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 0.233000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.765000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 1.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 0.257000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 0.327000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=4 1.146000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.895000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.047000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.648000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.602000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.739000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.050000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.325000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.820000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.090000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/11/2026 11:11:38] spid=58 tran=16778929 db=RMS rows=0 0.332000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 1.784000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 1.233000ms  app=.Net SqlClient Data Provider
SELECT MP_Serial_No_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.061000ms  app=.Net SqlClient Data Provider
SELECT MP_Serial_No_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.065000ms  app=.Net SqlClient Data Provider
SELECT MP_Batch_Exp_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 1.412000ms  app=.Net SqlClient Data Provider
SELECT MP_Batch_Exp_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 1.688000ms  app=.Net SqlClient Data Provider
SELECT MP_Return_Due_Opt FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.076000ms  app=.Net SqlClient Data Provider
SELECT MP_Return_Due_Opt FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.142000ms  app=.Net SqlClient Data Provider
SELECT Current_Member_Type,Current_Reward_type FROM MS_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 6.731000ms  app=.Net SqlClient Data Provider
SELECT Current_Member_Type,Current_Reward_type FROM MS_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=0 9.186000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=58 tran=16779008 db=RMS rows=0 0.450000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=60 tran=0 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=60 tran=16779009 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=63 tran=0 db=RMS rows=0 0.051000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=63 tran=16779013 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=65 tran=16779017 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=65 tran=0 db=RMS rows=0 0.041000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=66 tran=0 db=RMS rows=0 0.027000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=66 tran=16779021 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=67 tran=16779025 db=RMS rows=0 0.019000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=67 tran=0 db=RMS rows=0 0.032000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=68 tran=0 db=RMS rows=11 0.041000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=68 tran=0 db=RMS rows=11 0.032000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=69 tran=0 db=RMS rows=0 0.068000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=69 tran=0 db=RMS rows=0 1.240000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=70 tran=0 db=RMS rows=0 1.829000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=70 tran=0 db=RMS rows=0 0.052000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=16779045 db=RMS rows=0 0.034000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 36.899000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=16779123 db=RMS rows=1 1.818000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 3.791000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Payment_Type_Voucher Where Payment_Type='' AND company_Code=1 AND Serial_No='asd'
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.560000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Payment_Type_Voucher Where Payment_Type='' AND company_Code=1 AND Serial_No='asd'
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.717000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.015000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.250000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.340000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.457000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.168000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=11 2.039000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=11 0.204000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 0.002000ms  app=.Net SqlClient Data Provider
Select 'AUTO' as Code,'AUTO PRELABEL' as Description
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 0.026000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
Select 'AUTO' as Code,'AUTO PRELABEL' as Description
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 0.564000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:58] spid=71 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:58] spid=71 tran=0 db=RMS rows=11 1.626000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/11/2026 11:11:58] spid=71 tran=0 db=RMS rows=11 0.173000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/11/2026 11:12:04] spid=71 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:04] spid=71 tran=0 db=RMS rows=45 3.894000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name as Added_Name, c.full_name as Posted_Name FROM [dbo].[MP_Invoice_Batch] AS a LEFT OUTER JOIN [dbo].[PI_Users] AS b ON (b.user_id = a.added_by)                                    LEFT OUTER JOIN [dbo].[PI_Users] AS c ON (c.user_id = a.posted_by)                                   WHERE a.Company_Code = 1 AND a.Location_Code IN ('FST')   ORDER BY [Batch_No]
GO

-- [08/11/2026 11:12:04] spid=71 tran=16779279 db=RMS rows=45 0.303000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name as Added_Name, c.full_name as Posted_Name FROM [dbo].[MP_Invoice_Batch] AS a LEFT OUTER JOIN [dbo].[PI_Users] AS b ON (b.user_id = a.added_by)                                    LEFT OUTER JOIN [dbo].[PI_Users] AS c ON (c.user_id = a.posted_by)                                   WHERE a.Company_Code = 1 AND a.Location_Code IN ('FST')   ORDER BY [Batch_No]
GO

-- [08/11/2026 11:12:07] spid=71 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:07] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:07] spid=71 tran=0 db=RMS rows=3 1.247000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'MP_Invoice_Batch_SelByBatch'
GO

-- [08/11/2026 11:12:07] spid=71 tran=0 db=RMS rows=1 5.796000ms  app=.Net SqlClient Data Provider
exec MP_Invoice_Batch_SelByBatch @CompanyCode=1,@Batch_No=46
GO

-- [08/11/2026 11:12:39] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:39] spid=71 tran=0 db=RMS rows=7 98.315000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:12:39] spid=71 tran=0 db=RMS rows=0 0.049000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:39] spid=71 tran=0 db=RMS rows=1 3.480000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:12:39] spid=71 tran=0 db=RMS rows=1 0.534000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=7 44.411000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'N',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=1 2.348000ms  app=.Net SqlClient Data Provider
SELECT Quote_Approval FROM MP_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
SELECT Quote_Approval FROM MP_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=16780365 db=RMS rows=98 13.760000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Name AS CustomerName, b.Price_Type, d.Full_Name AS CancelledByName, e.Full_Name AS AddedByName, f.Full_Name AS ModifiedByName, g.Name AS AlternateCoName, f2.Full_Name AS QuotedByName, c.Description AS TermDesc, c.Credit_Days, Acc_Company=a.Company_Code FROM MP_Quote AS a LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] b ON (b.Code = a.Customer AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN [ACC].[dbo].[SY_Term] c ON (c.Term = a.Term AND c.Company_Code=a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] d ON (d.User_ID = a.Cancelled_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] e ON (e.User_ID = a.Added_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f ON (f.User_ID = a.Last_Modified_By) LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] g ON (g.Code = a.Alternate_Company AND g.Company_Code = a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f2 ON (f2.User_Id = a.Quoted_By) WHERE a.Company_Code=1 AND a.Status='A' AND (a.Download_Prelabel is null or a.Download_Prelabel='' ) AND a.Customer = '01/N01' AND NOT EXISTS (Select * from RMS..AR_Customer_InHouse x1 Where a.Company_Code=x1.Company_Code AND a.Location_Code=x1.Location_Code AND a.Customer=x1.Customer )  Order By a.Quote_Date Desc
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=98 41.636000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Name AS CustomerName, b.Price_Type, d.Full_Name AS CancelledByName, e.Full_Name AS AddedByName, f.Full_Name AS ModifiedByName, g.Name AS AlternateCoName, f2.Full_Name AS QuotedByName, c.Description AS TermDesc, c.Credit_Days, Acc_Company=a.Company_Code FROM MP_Quote AS a LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] b ON (b.Code = a.Customer AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN [ACC].[dbo].[SY_Term] c ON (c.Term = a.Term AND c.Company_Code=a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] d ON (d.User_ID = a.Cancelled_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] e ON (e.User_ID = a.Added_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f ON (f.User_ID = a.Last_Modified_By) LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] g ON (g.Code = a.Alternate_Company AND g.Company_Code = a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f2 ON (f2.User_Id = a.Quoted_By) WHERE a.Company_Code=1 AND a.Status='A' AND (a.Download_Prelabel is null or a.Download_Prelabel='' ) AND a.Customer = '01/N01' AND NOT EXISTS (Select * from RMS..AR_Customer_InHouse x1 Where a.Company_Code=x1.Company_Code AND a.Location_Code=x1.Location_Code AND a.Customer=x1.Customer )  Order By a.Quote_Date Desc
GO

-- [08/11/2026 11:12:48] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:48] spid=71 tran=0 db=RMS rows=7 0.749000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'N',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=0 0.037000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=15 11.154000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Uom AS BasicUom, b.Description, b.Return_Due, b.Average_Cost AS MasterAverage, b.Standard_Cost AS MasterStandard, b.Fifo_Cost AS MasterFifo, b.Last_Cost AS MasterLast, b.Misc_Cost AS MasterMisc, b.Grp, b.Dept, b.Subdept, b.Category, c.Full_Name AS CancelledByName, d.Price,  b1.Average_Cost AS LocAverage, b1.Standard_Cost AS LocStandard, b1.Last_Cost AS LocLast, b1.Fifo_Cost AS LocFifo, b1.Misc_Cost AS LocMisc, b.Type, b.Company_Comm_Rate, b.Promoter_Comm_Rate, b.Open_Price FROM MP_Quote_Item AS a INNER JOIN In_Stock AS b ON (b.Sku_No=a.Sku_No AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Location AS b1 ON (a.Company_Code=b1.Company_Code AND a.Location_Code=b1.Location_Code AND a.sku_no = b1.sku_no) LEFT OUTER JOIN In_Stock_Uom AS d ON (a.sku_no = d.sku_no AND a.uom = d.uom AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Users AS c ON (c.User_Id=a.Cancelled_By) WHERE a.Quote_Prelabel = 'FST/SQ/003362' AND a.Company_Code=1 AND a.Status='A' ORDER BY a.Added_Date
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780662 db=RMS rows=15 1.509000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Uom AS BasicUom, b.Description, b.Return_Due, b.Average_Cost AS MasterAverage, b.Standard_Cost AS MasterStandard, b.Fifo_Cost AS MasterFifo, b.Last_Cost AS MasterLast, b.Misc_Cost AS MasterMisc, b.Grp, b.Dept, b.Subdept, b.Category, c.Full_Name AS CancelledByName, d.Price,  b1.Average_Cost AS LocAverage, b1.Standard_Cost AS LocStandard, b1.Last_Cost AS LocLast, b1.Fifo_Cost AS LocFifo, b1.Misc_Cost AS LocMisc, b.Type, b.Company_Comm_Rate, b.Promoter_Comm_Rate, b.Open_Price FROM MP_Quote_Item AS a INNER JOIN In_Stock AS b ON (b.Sku_No=a.Sku_No AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Location AS b1 ON (a.Company_Code=b1.Company_Code AND a.Location_Code=b1.Location_Code AND a.sku_no = b1.sku_no) LEFT OUTER JOIN In_Stock_Uom AS d ON (a.sku_no = d.sku_no AND a.uom = d.uom AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Users AS c ON (c.User_Id=a.Cancelled_By) WHERE a.Quote_Prelabel = 'FST/SQ/003362' AND a.Company_Code=1 AND a.Status='A' ORDER BY a.Added_Date
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=1 0.664000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005146 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=71 tran=16780670 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005146 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=1 0.829000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.618000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.245000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.588000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005216 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780677 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005216 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780683 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005213 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.103000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.402000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005213 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.100000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.100000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5214 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.587000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005214 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.097000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5214 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5214 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5214 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780689 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005214 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780695 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005464 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.519000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005464 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.102000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5464 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.080000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5464 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5464 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5464 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=2421 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=2421 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780701 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=002421 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=2421 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.566000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=002421 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.089000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=2421 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.510000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=002419 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=2419 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=2419 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780707 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=002419 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=2419 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780713 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003759 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.438000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003759 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.084000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=2419 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.078000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3759 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.090000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3759 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3759 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3759 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3121 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3121 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780719 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003121 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.418000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003121 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.062000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3121 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.069000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3121 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.446000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003120 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3120 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=3120 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780725 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=003120 AND Uom='PCS'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3120 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780731 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005218 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.419000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005218 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.064000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=3120 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.376000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005221 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5218 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.088000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5218 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5218 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5218 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780737 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005221 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5221 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5221 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5221 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.059000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5221 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5766 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.427000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005766 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.077000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5766 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5766 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5766 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780743 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005766 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5765 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780749 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005765 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.438000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005765 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.094000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5765 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.581000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005150 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5765 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5765 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780755 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005150 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5150 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5150 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5150 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.058000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5150 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.943000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005146 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.164000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005146 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.114000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005213 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.115000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005216 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005214 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005464 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.123000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005464 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.128000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005214 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.182000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005213 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.202000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005216 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.111000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=002421 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.126000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003759 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.175000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=002419 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003120 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.098000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003121 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.108000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=002419 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.063000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003120 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003121 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.070000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=003759 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.078000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=002421 AND a.Uom='PCS'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.063000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005766 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.064000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005765 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.069000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005221 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005218 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.084000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005150 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.109000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005221 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.117000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005150 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.213000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005218 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005765 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=005766 AND a.Uom='EA'
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:56] spid=70 tran=0 db=RMS rows=1 0.594000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:56] spid=70 tran=16780805 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 2.196000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.102000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.036000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010075'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.653000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 4.859000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010075'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=2 12.217000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010075', CONVERT(DATETIME,'26-04-2026',103), CONVERT(DATETIME,'25-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,15.000000,15,140.00,0.0000,0.00,0.0000,0.00,140.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'26-04-2026 19:11:42 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'25-06-2026',103), 'FST','','',0,'N','Y','','N','','','','',0.0000,140.0000,'FST/SQ/003362','','','','')
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 6.956000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010075', CONVERT(DATETIME,'26-04-2026',103), CONVERT(DATETIME,'25-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,15.000000,15,140.00,0.0000,0.00,0.0000,0.00,140.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'26-04-2026 19:11:42 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'25-06-2026',103), 'FST','','',0,'N','Y','','N','','','','',0.0000,140.0000,'FST/SQ/003362','','','','')
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.454000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.352000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 8.895000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5146 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.857000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5146 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.202000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196791,'', CONVERT(DATETIME,'01-01-1900',103), 5146,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,28.00000000,28.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,28.00,'9555553403576','',40.0000,18.9875,22.5000,0.0000,18.9875,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:52 PM',103),0,'','','O',0.00,0.00,'N','','','EA',28.00000000,0,'',1,'',28.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 4.961000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196791,'', CONVERT(DATETIME,'01-01-1900',103), 5146,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,28.00000000,28.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,28.00,'9555553403576','',40.0000,18.9875,22.5000,0.0000,18.9875,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:52 PM',103),0,'','','O',0.00,0.00,'N','','','EA',28.00000000,0,'',1,'',28.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 3.120000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5146
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.154000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5146
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.403000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.194000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.064000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.059000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 3.519000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196792,'', CONVERT(DATETIME,'01-01-1900',103), 5216,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,18.50000000,18.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,18.50,'6228480380076','',23.0000,8.4500,13.6000,0.0000,8.4500,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:53 PM',103),0,'','','O',0.00,0.00,'N','','','EA',18.50000000,0,'',2,'',18.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.934000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196792,'', CONVERT(DATETIME,'01-01-1900',103), 5216,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,18.50000000,18.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,18.50,'6228480380076','',23.0000,8.4500,13.6000,0.0000,8.4500,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:53 PM',103),0,'','','O',0.00,0.00,'N','','','EA',18.50000000,0,'',2,'',18.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5216 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.026000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5216 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196793,'', CONVERT(DATETIME,'01-01-1900',103), 5213,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,14.50000000,14.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,14.50,'6228480380113','',19.0000,6.6000,11.0000,0.0000,6.6000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:54 PM',103),0,'','','O',0.00,0.00,'N','','','EA',14.50000000,0,'',3,'',14.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5216
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.109000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5216 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.117000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5216 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.132000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5216
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.174000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196793,'', CONVERT(DATETIME,'01-01-1900',103), 5213,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,14.50000000,14.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,14.50,'6228480380113','',19.0000,6.6000,11.0000,0.0000,6.6000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:54 PM',103),0,'','','O',0.00,0.00,'N','','','EA',14.50000000,0,'',3,'',14.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.100000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5214
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.115000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5213
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.161000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196794,'', CONVERT(DATETIME,'01-01-1900',103), 5214,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,16.50000000,16.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,16.50,'6228480380083','',19.5000,7.2000,11.6000,0.0000,7.2000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:55 PM',103),0,'','','O',0.00,0.00,'N','','','EA',16.50000000,0,'',4,'',16.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.065000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5213 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.081000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5213 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5213 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5213 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5214
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5213
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196794,'', CONVERT(DATETIME,'01-01-1900',103), 5214,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,16.50000000,16.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,16.50,'6228480380083','',19.5000,7.2000,11.6000,0.0000,7.2000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:55 PM',103),0,'','','O',0.00,0.00,'N','','','EA',16.50000000,0,'',4,'',16.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5214 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5214 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.061000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5214 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5214 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 6.219000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5464 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.297000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5464 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196795,'', CONVERT(DATETIME,'01-01-1900',103), 5464,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,7.70000000,7.7000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,7.70,'9555070732562','',11.5000,5.0000,6.9000,0.0000,5.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:56 PM',103),0,'','','O',0.00,0.00,'N','','','EA',7.70000000,0,'',7,'',7.70000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.084000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196795,'', CONVERT(DATETIME,'01-01-1900',103), 5464,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,7.70000000,7.7000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,7.70,'9555070732562','',11.5000,5.0000,6.9000,0.0000,5.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:56 PM',103),0,'','','O',0.00,0.00,'N','','','EA',7.70000000,0,'',7,'',7.70000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.268000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5464 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5464 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5464
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5464 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5464
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5464 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 2421
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 2421 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196796,'', CONVERT(DATETIME,'01-01-1900',103), 2421,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.00000000,3.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.00,'2002421000025','',3.2000,2.0000,2.4000,0.0000,2.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:57 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',3.00000000,0,'',8,'',3.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.079000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196796,'', CONVERT(DATETIME,'01-01-1900',103), 2421,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.00000000,3.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.00,'2002421000025','',3.2000,2.0000,2.4000,0.0000,2.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:57 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',3.00000000,0,'',8,'',3.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.055000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 2421 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 2421
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.193000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 2419
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 2419 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3759
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 2419 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.062000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 2421 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.082000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196798,'', CONVERT(DATETIME,'01-01-1900',103), 3759,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,8.30000000,8.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,8.30,'9555112923477','',9.0000,5.7230,7.0000,0.0000,5.7230,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:59 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',8.30000000,0,'',10,'',8.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.098000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196797,'', CONVERT(DATETIME,'01-01-1900',103), 2419,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,2.80000000,2.8000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,2.80,'2002419000020','',3.0000,1.9000,2.3000,0.0000,1.9000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:58 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',2.80000000,0,'',9,'',2.80000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 2421 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3759
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196798,'', CONVERT(DATETIME,'01-01-1900',103), 3759,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,8.30000000,8.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,8.30,'9555112923477','',9.0000,5.7230,7.0000,0.0000,5.7230,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:59 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',8.30000000,0,'',10,'',8.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196797,'', CONVERT(DATETIME,'01-01-1900',103), 2419,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,2.80000000,2.8000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,2.80,'2002419000020','',3.0000,1.9000,2.3000,0.0000,1.9000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:58 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',2.80000000,0,'',9,'',2.80000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 2419
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 2419 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 2419 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3121 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3121
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196799,'', CONVERT(DATETIME,'01-01-1900',103), 3121,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,5.90000000,5.9000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,5.90,'9555112937986','',6.5000,4.0740,5.0000,0.0000,4.0740,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:00 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',5.90000000,0,'',11,'',5.90000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.006000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3759 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3121 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3759 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.193000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3121 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.233000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196799,'', CONVERT(DATETIME,'01-01-1900',103), 3121,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,5.90000000,5.9000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,5.90,'9555112937986','',6.5000,4.0740,5.0000,0.0000,4.0740,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:00 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',5.90000000,0,'',11,'',5.90000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3759 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3121 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3759 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3121
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3120 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3120 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5218 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5218 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.048000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3120
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5218
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.080000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196800,'', CONVERT(DATETIME,'01-01-1900',103), 3120,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,5.30000000,5.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,5.30,'9555112937993','',6.0000,3.6860,4.5000,0.0000,3.6860,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:01 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',5.30000000,0,'',12,'',5.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.086000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196801,'', CONVERT(DATETIME,'01-01-1900',103), 5218,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,9.50000000,9.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,9.50,'6228480380106','',13.0000,4.5000,7.2000,0.0000,4.5000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:02 PM',103),0,'','','O',0.00,0.00,'N','','','EA',9.50000000,0,'',5,'',9.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 3120
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5218
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196801,'', CONVERT(DATETIME,'01-01-1900',103), 5218,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,9.50000000,9.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,9.50,'6228480380106','',13.0000,4.5000,7.2000,0.0000,4.5000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:02 PM',103),0,'','','O',0.00,0.00,'N','','','EA',9.50000000,0,'',5,'',9.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196800,'', CONVERT(DATETIME,'01-01-1900',103), 3120,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,5.30000000,5.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,5.30,'9555112937993','',6.0000,3.6860,4.5000,0.0000,3.6860,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:01 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',5.30000000,0,'',12,'',5.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.006000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5218 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 3120 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 3120 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5218 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196802,'', CONVERT(DATETIME,'01-01-1900',103), 5221,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,8.50000000,8.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,8.50,'6228480380014','',11.0000,4.1000,7.0000,0.0000,4.1000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:03 PM',103),0,'','','O',0.00,0.00,'N','','','EA',8.50000000,0,'',6,'',8.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5221
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.006000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5221 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5221 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.183000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5221
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5221 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5221 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.077000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196802,'', CONVERT(DATETIME,'01-01-1900',103), 5221,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,8.50000000,8.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,8.50,'6228480380014','',11.0000,4.1000,7.0000,0.0000,4.1000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:03 PM',103),0,'','','O',0.00,0.00,'N','','','EA',8.50000000,0,'',6,'',8.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.116000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196803,'', CONVERT(DATETIME,'01-01-1900',103), 5766,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.30000000,3.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.30,'9555112936552','',4.0000,2.2310,2.8000,0.0000,2.2310,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:04 PM',103),0,'','','O',0.00,0.00,'N','','','EA',3.30000000,0,'',13,'',3.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.048000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5766
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.049000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5766 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5766 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 4.649000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5766 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5766 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5766
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196803,'', CONVERT(DATETIME,'01-01-1900',103), 5766,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.30000000,3.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.30,'9555112936552','',4.0000,2.2310,2.8000,0.0000,2.2310,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:04 PM',103),0,'','','O',0.00,0.00,'N','','','EA',3.30000000,0,'',13,'',3.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.331000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5766 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5766 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 5.725000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5765 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5765 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5765
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196804,'', CONVERT(DATETIME,'01-01-1900',103), 5765,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,4.30000000,4.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,4.30,'9555112936545','',5.5000,2.9100,3.6000,0.0000,2.9100,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:05 PM',103),0,'','','O',0.00,0.00,'N','','','EA',4.30000000,0,'',14,'',4.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5765 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5765 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5765 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5765 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5765
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.099000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196804,'', CONVERT(DATETIME,'01-01-1900',103), 5765,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,4.30000000,4.3000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,4.30,'9555112936545','',5.5000,2.9100,3.6000,0.0000,2.9100,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:05 PM',103),0,'','','O',0.00,0.00,'N','','','EA',4.30000000,0,'',14,'',4.30000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.103000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196805,'', CONVERT(DATETIME,'01-01-1900',103), 5150,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.90000000,3.9000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.90,'9555532001656','',6.0000,2.5000,3.5000,0.0000,2.5000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:06 PM',103),0,'','','O',0.00,0.00,'N','','','EA',3.90000000,0,'',15,'',3.90000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 4.980000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5150 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5150
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5150
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196805,'', CONVERT(DATETIME,'01-01-1900',103), 5150,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.90000000,3.9000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.90,'9555532001656','',6.0000,2.5000,3.5000,0.0000,2.5000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:06 PM',103),0,'','','O',0.00,0.00,'N','','','EA',3.90000000,0,'',15,'',3.90000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.730000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5150 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.396000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.056000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 5.230000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No) 
 Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.112000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.047000ms  app=.Net SqlClient Data Provider
Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 2.490000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:57] spid=70 tran=0 db=RMS rows=1 0.700000ms  app=.Net SqlClient Data Provider
Select ISNULL(SI_DL_Web_Status,'') From PI_Company Where Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780999 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
Select ISNULL(SI_DL_Web_Status,'') From PI_Company Where Company_Code=1
GO

