-- SQL captured 20260811-193407 from 192.168.16.75,49681
-- databases: RMS
-- 2265 statements, in execution order

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 19.734000ms  app=.Net SqlClient Data Provider
Select Def_Company_Code,user_id, login_name, full_name, password, status, access_level, Show_Cost, Skip_Item_Authorization, designation, email, phone_no, last_login_time, last_logout_time, added_date, lastmodifiedby, lastwritetimestamp,Check_User_Vendor from PI_Users where  login_name = 'ims' and Password = '1234' and Status = 'A'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 0.439000ms  app=.Net SqlClient Data Provider
Select Def_Company_Code,user_id, login_name, full_name, password, status, access_level, Show_Cost, Skip_Item_Authorization, designation, email, phone_no, last_login_time, last_logout_time, added_date, lastmodifiedby, lastwritetimestamp,Check_User_Vendor from PI_Users where  login_name = 'ims' and Password = '1234' and Status = 'A'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.339000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 2.892000ms  app=.Net SqlClient Data Provider
Select * from rms.dbo.SY_Remote_Server Where Remote_Server='.\FUNGSENG'
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=0 0.089000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 6.865000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777090 db=RMS rows=1 0.654000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777313 db=RMS rows=1 6.338000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 157.353000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:11:27] spid=60 tran=0 db=RMS rows=1 2.266000ms  app=.Net SqlClient Data Provider
Select Counter_No From RMS.dbo.PI_Counter Where Company_Code=0 AND Counter_Name='CUSTOMER2_ID'
GO

-- [08/11/2026 11:11:27] spid=60 tran=0 db=RMS rows=1 0.306000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=19 4.645000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Purchase_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=19 0.630000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 38.926000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777457 db=RMS rows=1 0.708000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:27] spid=58 tran=0 db=RMS rows=1 3.077000ms  app=.Net SqlClient Data Provider
Select Price_type,ISNULL(Read_only,'False') as Read_only from pi_User_mp_Price_Access where company_Code=1 And user_id=1
GO

-- [08/11/2026 11:11:27] spid=58 tran=16777470 db=RMS rows=1 0.168000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 2.827000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, a.Attachment_Path, a.PR_Attachment_Path, a.PO_Attachment_Path, a.PD_Attachment_Path, a.PI_Attachment_Path, a.SQ_Attachment_Path, a.SO_Attachment_Path, a.SD_Attachment_Path, a.SI_Attachment_Path, a.AD_Attachment_Path, a.Packing_Attachment_Path, a.Item_Attachment_Path, a.Member_Attachment_Path, a.IR_Attachment_Path, a.PR_Attachment_Level, a.PO_Attachment_Level, a.PD_Attachment_Level, a.PI_Attachment_Level, a.SQ_Attachment_Level, a.SO_Attachment_Level, a.SD_Attachment_Level, a.SI_Attachment_Level, a.AD_Attachment_Level, a.Packing_Attachment_Level, a.Item_Attachment_Level, a.Member_Attachment_Level, a.IR_Attachment_Level, a.Attachment_Level, a.ST_Attachment_Level, a.PR_Attachment_Folder, a.PO_Attachment_Folder, a.PD_Attachment_Folder, a.PI_Attachment_Folder, a.SQ_Attachment_Folder, a.SO_Attachment_Folder, a.SD_Attachment_Folder, a.SI_Attachment_Folder, a.AD_Attachment_Folder, a.Packing_Attachment_Folder, a.Item_Attachment_Folder, a.Member_Attachment_Folder, a.ST_Attachment_Folder, a.IR_Attachment_Folder, a.Attachment_Folder, a.Attachment_DocType, a.PR_Attachment_DocType, a.PO_Attachment_DocType, a.PD_Attachment_DocType, a.PI_Attachment_DocType, a.SQ_Attachment_DocType, a.SO_Attachment_DocType, a.SD_Attachment_DocType, a.SI_Attachment_DocType, a.AD_Attachment_DocType, a.Packing_Attachment_DocType, a.Item_Attachment_DocType, a.Member_Attachment_DocType, a.IR_Attachment_DocType, a.ST_Attachment_DocType, ISNULL(b.Def_Location,'N') AS Def_Location,Attachment_File_Format FROM PI_Company_Location a LEFT OUTER JOIN PI_User_Company_Access_Location b ON a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code WHERE a.Company_Code = 1 AND b.User_Id = 1
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777495 db=RMS rows=1 0.287000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 2.283000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_prelabel WHERE status = 'A'
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.278000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_prelabel WHERE status = 'A'
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777538 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.363000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 2.405000ms  app=.Net SqlClient Data Provider
Select count(*) from SY_My_List Where User_ID=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.440000ms  app=.Net SqlClient Data Provider
Select ISNULL(Use_EI,'N') as Use_EI From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777543 db=RMS rows=1 0.177000ms  app=.Net SqlClient Data Provider
Select ISNULL(Use_EI,'N') as Use_EI From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.314000ms  app=.Net SqlClient Data Provider
Select count(*) from SY_My_List Where User_ID=1
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

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.502000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_MY_Cart,'N') as Allow_My_Cart From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.510000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_Edit_Posted_PI_With_PD,'N') as Allow_Edit_Posted_PI_With_PD From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777547 db=RMS rows=1 0.244000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_MY_Cart,'N') as Allow_My_Cart From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777549 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_Edit_Posted_PI_With_PD,'N') as Allow_Edit_Posted_PI_With_PD From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777551 db=RMS rows=1 0.230000ms  app=.Net SqlClient Data Provider
Select ISNULL(Import_From,'') as Import_From From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.566000ms  app=.Net SqlClient Data Provider
Select ISNULL(Import_From,'') as Import_From From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.348000ms  app=.Net SqlClient Data Provider
Select ISNULL(Split_Send_Tab,'Y') as Split_Send_Tab From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=1 0.385000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_B2B,'N') as Allow_B2B From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777555 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
Select ISNULL(Allow_B2B,'N') as Allow_B2B From SY_System
GO

-- [08/11/2026 11:11:28] spid=58 tran=16777553 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
Select ISNULL(Split_Send_Tab,'Y') as Split_Send_Tab From SY_System
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

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 1.970000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.039000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 0.097000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:11:28] spid=58 tran=0 db=RMS rows=0 3.219000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.017000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=5 3.885000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Module_Access AS a WHERE a.Company_Code = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=5 0.482000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=1 0.844000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777578 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777580 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Structure_Enquiry,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=1 0.875000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Structure_Enquiry,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 3.064000ms  app=.Net SqlClient Data Provider
Select isnull(Monday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777583 db=RMS rows=0 0.105000ms  app=.Net SqlClient Data Provider
Select isnull(Monday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777585 db=RMS rows=0 0.052000ms  app=.Net SqlClient Data Provider
Select isnull(Tuesday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.921000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.239000ms  app=.Net SqlClient Data Provider
Select isnull(Thursday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.241000ms  app=.Net SqlClient Data Provider
Select isnull(Friday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.560000ms  app=.Net SqlClient Data Provider
Select isnull(Wednesday_Color,16777215) from PP_Setup where Company_Code=1
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

-- [08/11/2026 11:11:29] spid=58 tran=16777595 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Sunday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777593 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
Select isnull(Saturday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.237000ms  app=.Net SqlClient Data Provider
Select isnull(Saturday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.239000ms  app=.Net SqlClient Data Provider
Select isnull(Sunday_Color,16777215) from PP_Setup where Company_Code=1
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 88.761000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777703 db=RMS rows=0 0.111000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:29] spid=58 tran=0 db=RMS rows=0 6.049000ms  app=.Net SqlClient Data Provider
Select a.*,  CAST(a.Added_By as nvarchar) + '-' + b.Full_name as AddedName, CAST(a.Last_Modified_By as nvarchar) + '-' +c.Full_name as LastModifiedName, CAST(a.Download_By as nvarchar) + '-' +d.Full_name as DownloadName, (Select count(*) From My_Cart_Item b where a.Company_Code=b.Company_Code And a.Cart_No=b.Cart_No) As TotalItem , c1.Name as CustomerName, c2.Name as VendorName  From My_Cart a  INNER JOIN PI_Company_Location b1 ON (a.company_Code=b1.company_Code AND a.Location_Code=b1.Location_Code)  LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] c1 On (a.Customer=c1.Code And b1.Company_No=c1.Company_Code)  LEFT OUTER JOIN [ACC].[dbo].[AP_Vendor] c2 On (a.Vendor=c2.Code And b1.Company_No=c2.Company_Code)  Left Outer Join Pi_Users b On (a.Added_By = b.User_ID)  Left Outer Join Pi_Users c On (a.Last_Modified_By = c.User_ID)  Left Outer Join Pi_Users d On (a.Download_By = d.User_ID)  Where a.Status='A' AND a.Company_Code=1 AND a.Added_By=0 AND a.B2B_Added_By=1  Order By a.Cart_No
GO

-- [08/11/2026 11:11:29] spid=58 tran=16777784 db=RMS rows=0 0.068000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 1.488000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.210000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.484000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.779000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=11 1.892000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=11 0.539000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.080000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 2.027000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 2.155000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.078000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:37] spid=58 tran=0 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
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

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=11 0.037000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=11 0.024000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 6.731000ms  app=.Net SqlClient Data Provider
SELECT Current_Member_Type,Current_Reward_type FROM MS_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=58 tran=0 db=RMS rows=1 0.142000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:38] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=60 tran=0 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=60 tran=16779009 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=63 tran=16779013 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=63 tran=0 db=RMS rows=0 0.051000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=65 tran=0 db=RMS rows=0 0.041000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=65 tran=16779017 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=66 tran=16779021 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=66 tran=0 db=RMS rows=0 0.027000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=67 tran=0 db=RMS rows=0 0.032000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=67 tran=16779025 db=RMS rows=0 0.019000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=68 tran=0 db=RMS rows=11 0.032000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=68 tran=0 db=RMS rows=11 0.041000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=69 tran=0 db=RMS rows=0 1.240000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=69 tran=0 db=RMS rows=0 0.068000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=70 tran=0 db=RMS rows=0 0.052000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=70 tran=0 db=RMS rows=0 1.829000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.091000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=71 tran=16779045 db=RMS rows=0 0.034000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:11:38] spid=71 tran=16779123 db=RMS rows=1 1.818000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=1 36.899000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.015000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.717000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 0.168000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/11/2026 11:11:38] spid=71 tran=0 db=RMS rows=0 1.457000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:04] spid=71 tran=16779279 db=RMS rows=45 0.303000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name as Added_Name, c.full_name as Posted_Name FROM [dbo].[MP_Invoice_Batch] AS a LEFT OUTER JOIN [dbo].[PI_Users] AS b ON (b.user_id = a.added_by)                                    LEFT OUTER JOIN [dbo].[PI_Users] AS c ON (c.user_id = a.posted_by)                                   WHERE a.Company_Code = 1 AND a.Location_Code IN ('FST')   ORDER BY [Batch_No]
GO

-- [08/11/2026 11:12:04] spid=71 tran=0 db=RMS rows=45 3.894000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
SELECT Quote_Approval FROM MP_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=1 2.348000ms  app=.Net SqlClient Data Provider
SELECT Quote_Approval FROM MP_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:12:45] spid=71 tran=0 db=RMS rows=98 41.636000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Name AS CustomerName, b.Price_Type, d.Full_Name AS CancelledByName, e.Full_Name AS AddedByName, f.Full_Name AS ModifiedByName, g.Name AS AlternateCoName, f2.Full_Name AS QuotedByName, c.Description AS TermDesc, c.Credit_Days, Acc_Company=a.Company_Code FROM MP_Quote AS a LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] b ON (b.Code = a.Customer AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN [ACC].[dbo].[SY_Term] c ON (c.Term = a.Term AND c.Company_Code=a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] d ON (d.User_ID = a.Cancelled_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] e ON (e.User_ID = a.Added_By) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f ON (f.User_ID = a.Last_Modified_By) LEFT OUTER JOIN [ACC].[dbo].[AR_Customer] g ON (g.Code = a.Alternate_Company AND g.Company_Code = a.Company_Code) LEFT OUTER JOIN [RMS].[dbo].[PI_Users] f2 ON (f2.User_Id = a.Quoted_By) WHERE a.Company_Code=1 AND a.Status='A' AND (a.Download_Prelabel is null or a.Download_Prelabel='' ) AND a.Customer = '01/N01' AND NOT EXISTS (Select * from RMS..AR_Customer_InHouse x1 Where a.Company_Code=x1.Company_Code AND a.Location_Code=x1.Location_Code AND a.Customer=x1.Customer )  Order By a.Quote_Date Desc
GO

-- [08/11/2026 11:12:45] spid=71 tran=16780365 db=RMS rows=98 13.760000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:51] spid=70 tran=16780662 db=RMS rows=15 1.509000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.Uom AS BasicUom, b.Description, b.Return_Due, b.Average_Cost AS MasterAverage, b.Standard_Cost AS MasterStandard, b.Fifo_Cost AS MasterFifo, b.Last_Cost AS MasterLast, b.Misc_Cost AS MasterMisc, b.Grp, b.Dept, b.Subdept, b.Category, c.Full_Name AS CancelledByName, d.Price,  b1.Average_Cost AS LocAverage, b1.Standard_Cost AS LocStandard, b1.Last_Cost AS LocLast, b1.Fifo_Cost AS LocFifo, b1.Misc_Cost AS LocMisc, b.Type, b.Company_Comm_Rate, b.Promoter_Comm_Rate, b.Open_Price FROM MP_Quote_Item AS a INNER JOIN In_Stock AS b ON (b.Sku_No=a.Sku_No AND b.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Location AS b1 ON (a.Company_Code=b1.Company_Code AND a.Location_Code=b1.Location_Code AND a.sku_no = b1.sku_no) LEFT OUTER JOIN In_Stock_Uom AS d ON (a.sku_no = d.sku_no AND a.uom = d.uom AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Users AS c ON (c.User_Id=a.Cancelled_By) WHERE a.Quote_Prelabel = 'FST/SQ/003362' AND a.Company_Code=1 AND a.Status='A' ORDER BY a.Added_Date
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=15 11.154000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=71 tran=0 db=RMS rows=1 0.829000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.618000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5146 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5216 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780677 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005216 AND Uom='EA'
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

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.103000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.402000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005213 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=16780683 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(Pack_Size_Desc,'') FROM In_Stock_Uom WHERE Company_Code=1 AND Sku_No=005213 AND Uom='EA'
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=5213 AND Company_Code=1
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

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=5213 AND Company_Code=1
GO

-- [08/11/2026 11:12:51] spid=70 tran=0 db=RMS rows=1 0.100000ms  app=.Net SqlClient Data Provider
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.102000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 2.196000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.653000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 4.859000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010075'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.036000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010075'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 6.956000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010075', CONVERT(DATETIME,'26-04-2026',103), CONVERT(DATETIME,'25-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,15.000000,15,140.00,0.0000,0.00,0.0000,0.00,140.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'26-04-2026 19:11:42 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'25-06-2026',103), 'FST','','',0,'N','Y','','N','','','','',0.0000,140.0000,'FST/SQ/003362','','','','')
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=2 12.217000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010075', CONVERT(DATETIME,'26-04-2026',103), CONVERT(DATETIME,'25-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,15.000000,15,140.00,0.0000,0.00,0.0000,0.00,140.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'26-04-2026 19:11:42 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'25-06-2026',103), 'FST','','',0,'N','Y','','N','','','','',0.0000,140.0000,'FST/SQ/003362','','','','')
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.454000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.352000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.857000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5146 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 8.895000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5146 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 4.961000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196791,'', CONVERT(DATETIME,'01-01-1900',103), 5146,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,28.00000000,28.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,28.00,'9555553403576','',40.0000,18.9875,22.5000,0.0000,18.9875,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:52 PM',103),0,'','','O',0.00,0.00,'N','','','EA',28.00000000,0,'',1,'',28.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.202000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196791,'', CONVERT(DATETIME,'01-01-1900',103), 5146,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,28.00000000,28.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,28.00,'9555553403576','',40.0000,18.9875,22.5000,0.0000,18.9875,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:52 PM',103),0,'','','O',0.00,0.00,'N','','','EA',28.00000000,0,'',1,'',28.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.154000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5146
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 3.120000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5146
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.403000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.064000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.194000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5146 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.059000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.934000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196792,'', CONVERT(DATETIME,'01-01-1900',103), 5216,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,18.50000000,18.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,18.50,'6228480380076','',23.0000,8.4500,13.6000,0.0000,8.4500,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:53 PM',103),0,'','','O',0.00,0.00,'N','','','EA',18.50000000,0,'',2,'',18.50000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 3.519000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196792,'', CONVERT(DATETIME,'01-01-1900',103), 5216,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,18.50000000,18.5000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,18.50,'6228480380076','',23.0000,8.4500,13.6000,0.0000,8.4500,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:53 PM',103),0,'','','O',0.00,0.00,'N','','','EA',18.50000000,0,'',2,'',18.50000000,0.0000,1.0000,0)
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.297000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5464 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 6.219000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5464 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.084000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196795,'', CONVERT(DATETIME,'01-01-1900',103), 5464,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,7.70000000,7.7000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,7.70,'9555070732562','',11.5000,5.0000,6.9000,0.0000,5.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:56 PM',103),0,'','','O',0.00,0.00,'N','','','EA',7.70000000,0,'',7,'',7.70000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196795,'', CONVERT(DATETIME,'01-01-1900',103), 5464,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,7.70000000,7.7000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,7.70,'9555070732562','',11.5000,5.0000,6.9000,0.0000,5.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:56 PM',103),0,'','','O',0.00,0.00,'N','','','EA',7.70000000,0,'',7,'',7.70000000,0.0000,1.0000,0)
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 1.079000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196796,'', CONVERT(DATETIME,'01-01-1900',103), 2421,'PCS',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.00000000,3.0000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.00,'2002421000025','',3.2000,2.0000,2.4000,0.0000,2.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:12:57 PM',103),0,'','','O',0.00,0.00,'N','','','PCS',3.00000000,0,'',8,'',3.00000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.055000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 2421 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 2421
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5765 AND a2.Uom='EA'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 5.725000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5765 AND a2.Uom='EA'
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 1.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 5150
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010075',196805,'', CONVERT(DATETIME,'01-01-1900',103), 5150,'EA',1.00,'A',1.0000,0.0000,0.0000,0.0000,3.90000000,3.9000,0.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0.0000,3.90,'9555532001656','',6.0000,2.5000,3.5000,0.0000,2.5000,0.0000, CONVERT(DATETIME,'11-08-2026 19:13:06 PM',103),0,'','','O',0.00,0.00,'N','','','EA',3.90000000,0,'',15,'',3.90000000,0.0000,1.0000,0)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.730000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom  AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=5150 AND a2.Uom='EA'
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

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.396000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.056000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 1.000000 WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 5150 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.112000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 0.047000ms  app=.Net SqlClient Data Provider
Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=0 5.230000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No) 
 Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010075' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 2.490000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780806 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:12:57] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:12:57] spid=70 tran=16780999 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
Select ISNULL(SI_DL_Web_Status,'') From PI_Company Where Company_Code=1
GO

-- [08/11/2026 11:12:57] spid=70 tran=0 db=RMS rows=1 0.700000ms  app=.Net SqlClient Data Provider
Select ISNULL(SI_DL_Web_Status,'') From PI_Company Where Company_Code=1
GO

-- [08/11/2026 11:22:00] spid=60 tran=0 db=RMS rows=7 143.201000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:22:00] spid=60 tran=0 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:00] spid=60 tran=0 db=RMS rows=1 0.499000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:22:00] spid=60 tran=0 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:22:13] spid=60 tran=0 db=RMS rows=0 0.027000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:13] spid=60 tran=0 db=RMS rows=3 0.458000ms  app=.Net SqlClient Data Provider
SELECT Ref2, Description FROM MP_Quote_Ref2 WHERE Status='Y' AND Company_Code=1
GO

-- [08/11/2026 11:22:13] spid=60 tran=0 db=RMS rows=3 14.231000ms  app=.Net SqlClient Data Provider
SELECT Ref2, Description FROM MP_Quote_Ref2 WHERE Status='Y' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.013000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 2.230000ms  app=.Net SqlClient Data Provider
SELECT * From SY_Size Where Company_Code=1 Order By [Order]
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.240000ms  app=.Net SqlClient Data Provider
SELECT * From SY_Size Where Company_Code=1 Order By [Order]
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786679 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
SELECT Distinct Code From SY_Size Where Company_Code=1 Order By Code
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.575000ms  app=.Net SqlClient Data Provider
SELECT Distinct Code From SY_Size Where Company_Code=1 Order By Code
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 1.133000ms  app=.Net SqlClient Data Provider
SELECT * From SY_Color Where Company_Code=1 Order By [Order]
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.183000ms  app=.Net SqlClient Data Provider
SELECT * From SY_Color Where Company_Code=1 Order By [Order]
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 35.117000ms  app=.Net SqlClient Data Provider
exec In_Stock_Setup_Sel @CompanyCode=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 0.467000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 0.539000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.298000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=11 0.399000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.026000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=11 0.029000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=4 0.025000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.289000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.300000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=4 0.337000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.312000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.368000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.048000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.049000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786930 db=RMS rows=0 0.027000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 4.220000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 10.981000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='   ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.091000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='   ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786942 db=RMS rows=0 0.482000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='   ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786943 db=RMS rows=0 0.078000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='   ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786947 db=RMS rows=0 0.362000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='N  ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 8.532000ms  app=.Net SqlClient Data Provider
Select a.*,b.*,c.Default_Inventory_Costing From SY_Task_Data_Transfer a Left Outer Join PI_Company_Location b ON (a.Location_Code=b.Location_Code AND a.Company_Code=b.Company_Code) left outer join PI_Company c on ( a.Company_Code=c.Company_Code) Where a.Task_Code='N  ' AND a.Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 4.284000ms  app=.Net SqlClient Data Provider
SELECT a.*, ISNULL(c1.Area, '') as Area, ISNULL(c1.Zone, '') as Zone, c1.Default_Inventory_Costing FROM MP_Customer_Price_Type a  Inner Join PI_User_MP_Price_Access c ON (a.Company_Code=c.Company_Code AND a.Price_Type=c.Price_Type)  left join PI_Company_Location c1 on (a.Company_Code = c1.Company_Code and a.Location_Code = c1.Location_Code)  WHERE a.Status='Y' AND a.Company_Code=1 AND c.user_ID=1 Order by a.Price_Type
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786963 db=RMS rows=1 0.092000ms  app=.Net SqlClient Data Provider
SELECT a.*, ISNULL(c1.Area, '') as Area, ISNULL(c1.Zone, '') as Zone, c1.Default_Inventory_Costing FROM MP_Customer_Price_Type a  Inner Join PI_User_MP_Price_Access c ON (a.Company_Code=c.Company_Code AND a.Price_Type=c.Price_Type)  left join PI_Company_Location c1 on (a.Company_Code = c1.Company_Code and a.Location_Code = c1.Location_Code)  WHERE a.Status='Y' AND a.Company_Code=1 AND c.user_ID=1 Order by a.Price_Type
GO

-- [08/11/2026 11:22:39] spid=60 tran=16786969 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
SELECT a.Price_Type,a.Description FROM MP_Customer_Price_Type a Inner Join PI_User_MP_Price_Access c ON (a.Company_Code=c.Company_Code AND a.Price_Type=c.Price_Type) WHERE a.Status='Y' AND a.Company_Code=1 AND c.user_ID=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 1.088000ms  app=.Net SqlClient Data Provider
SELECT a.Price_Type,a.Description FROM MP_Customer_Price_Type a Inner Join PI_User_MP_Price_Access c ON (a.Company_Code=c.Company_Code AND a.Price_Type=c.Price_Type) WHERE a.Status='Y' AND a.Company_Code=1 AND c.user_ID=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 41.191000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,Cast(0 as decimal) as StockAmt , a.*,v.Name as LastVendorName,s.Full_Name as LastSalesRepName,g.product_image,g.Product_Image_Path ,(Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and a.Sku_no=b.Sku_no and a.uom=b.Uom and b.status='A' ) as Plu_No, ei1.Description as ItemClassDesc ,ei4.Description as SelfBillClassDesc, ei2.Description as CountryDesc, ei3.Description as TaxTypeDesc, a.Standard_Cost as Def_Cost, CASE WHEN a.BasicPrice=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.BasicPrice END as ProfitMgn, CASE WHEN a.Standard_Cost=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.Standard_Cost END as MarkupMgn, Cast(a.BasicPrice*a.Company_Comm_Rate/100 as decimal(12,2)) as Company_Comm_Amt, Cast(a.BasicPrice*a.Promoter_Comm_Rate/100 as decimal(12,2)) as Promoter_Comm_Amt, (Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and  a.Sku_no=b.Sku_no and a.Pack_Size_Desc=b.Uom and b.status='A' ) as Pack_Plu_No,CAST(0.0 as money) as Pack_Stock_Qty,CAST(0.0 as money) as Pack_Net_Qty,0 as Pack_Cost,(Select Price From In_stock_uom b Where a.Company_Code=b.Company_Code AND a.Sku_no=b.Sku_No AND a.Pack_Size_Uom=b.Uom) as Pack_Price , 0 as Loc_Stock_Qty,0 as Loc_Net_Qty , 0 as Web_Sold, CASE WHEN a.Flag3<>'Y' THEN 0 ELSE ( Select Top 1 Qty From Web_Item_Pricing web  Where web.Company_Code=a.Company_Code AND web.Sku_No=a.Sku_No ) END as Web_Qty FROM (SELECT DISTINCT a.EI_Tax_Type ,a.EI_Item_Class,a.EI_SelfBill_Class,a.EI_SelfBill_Country ,a.EI_SelfBill_Tax_Type,a.EI_Country ,a.Item_Type, a.Warranty_Period, a.Warranty_Period_Type, a.Nos,a.Max_Disc1,a.Max_Disc2,a.Max_Disc3,a.Special_Msg, a.Web_Special_Msg, a.Web_Mix_Match, a.Web_Chk_Date, a.Web_Item_Fr, a.Web_Item_To, a.Web_Daily_Qty, a.Web_Qty_Method, a.Alt_Plu , a.Loss_Percent, a5.GST_Price as GSTPrice, a.added_By,a.added_Date,a.last_modified_by, a.Last_Modified_Date, a.lastwritetimestamp,a.Volume,a.Volume_Length,a.Volume_height,Volume_Width,a.Volume_Uom,a.Volume_Factor,a.Weight,a.Weight_Uom,a.Weight_Factor,a.Comm_Type,a.Brand,a.Last_Vendor,NULLIF(a.Last_Sales_Rep_ID,0.00) as Last_Sales_Rep_ID,a.Record_Name,a.Check_Quota,a.description2,a.Pack_Size,a.Pack_Size_Uom,a.Pack_Size_Desc,a2.Matrix_No,a5.Price as BasicPrice,NULLIF(a.Company_Comm_Rate, 0.00) as Company_Comm_Rate, NULLIF(a.Promoter_Comm_Rate, 0.00) as Promoter_Comm_Rate, NULLIF(a.Company_Comm_Rate1, 0.00) as Company_Comm_Rate1, NULLIF(a.Promoter_Comm_Rate1, 0.00) as Promoter_Comm_Rate1, NULLIF(a.Company_Comm_Rate2, 0.00) as Company_Comm_Rate2, NULLIF(a.Promoter_Comm_Rate2, 0.00) as Promoter_Comm_Rate2, a.Company_Code, a.sku_no, a.Cku_No, a.uom, a.description, CASE WHEN a.status='C' THEN 'False' ELSE 'True' END AS Status, a.remarks, a.location, a.article_no,a.Size,a.Color,a.Actual_Size,a.Article_Desc,a.Intro_Date, NULLIF(a.Average_Cost, 0.00) AS Average_Cost,NULLIF(a.Standard_Cost, 0.00) AS Standard_Cost,NULLIF(a.Fifo_Cost, 0.00) AS Fifo_Cost,NULLIF(a.Last_Cost, 0.00) AS Last_Cost,NULLIF(a.Misc_Cost, 0.00) AS Misc_Cost, a.Budget_Qty,a.Budget_Amt,a.GST_Percent, a.MSIC_Code,Web_Grp,Web_Dept,Web_SubDept,Web_Category,Web_Promo_Grp,Quota_Grp, a.Purchase_GST_Code,a.Supply_GST_Code,Non_Buy,Flag1,Flag2,Flag3,Flag4,Flag5,Flag6,Flag7,Flag8,Flag9,Flag10, a.grp, a.dept, a.subdept, a.category, a.type, b.description as grpdesc, a.Ref1,a.Ref2,a.Ref3,a.Ref4,a.Ref1_Text,a.Ref2_Text,a.Ref3_Text,a.Ref4_Text,a.Open_Price,a.Open_Code,a.Qty_With_Decimal,a.Discountable,a.Allow_Zero_Price,a.Serial_No,a.Expiry,a.Batch_Expiry,a.Return_Due,a.Inventory_Item,a.Give_Point,a.Give_Rebate,a.No_Qty,a.No_Cost,a.Qty_On_Hand,a.Qty_On_Request,a.Qty_On_Sales,a.Qty_On_Sales_Order,a.Qty_On_Order,a.Qty_On_Received,a.Qty_On_Return,a.Qty_On_Trading,a.Qty_On_Customer_Return,a.Qty_On_Exchange,a.Qty_On_Repair,a.Qty_On_Adj_In,a.Qty_On_Adj_Out,a.Qty_On_Adj_Kiv,a.Qty_On_Quote,a.Issue_No,c.description as deptdesc, d.description as subdeptdesc, e.description as catdesc, f.description as typedesc , (Select Count(*) from In_Sku_Sub b Where a.Company_Code=b.Company_Code AND a.sku_no=b.sku_no) AS Item_Sub , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In+a.Qty_On_Order  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Net_Qty , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Stock_Qty FROM In_Stock a LEFT OUTER JOIN IN_Stock_Uom a5 ON (a.Sku_No = a5.Sku_No AND a.Uom=a5.Uom AND a.Company_Code=a5.Company_Code) LEFT OUTER JOIN IN_Matrix_Item a2 ON (a.Sku_No = a2.Sku_No AND a.Company_Code=a2.Company_Code)  LEFT OUTER JOIN PI_Group b ON (a.grp = b.grp AND a.Company_Code=b.Company_Code) LEFT OUTER JOIN PI_Department c ON (a.grp = c.grp AND a.dept = c.dept AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN PI_Sub_Dept d ON (a.grp = d.grp AND a.dept = d.dept AND a.subdept = d.subdept AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Category e ON (a.grp = e.grp AND a.dept = e.dept AND a.subdept = e.subdept AND a.category = e.category AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN PI_Stock_Type f ON (a.type = f.type AND a.Company_Code=f.Company_Code) WHERE a.Company_Code=1 AND a.Sku_No=-1) a  LEFT OUTER JOIN ACC.dbo.AP_Vendor v ON (a.Last_Vendor=v.Code  AND a.Company_Code=v.Company_Code )  LEFT OUTER JOIN Pr_Sales_Representative s ON (a.Last_Vendor=s.Vendor AND a.Last_Sales_Rep_ID=s.Sales_Rep_ID AND a.Company_Code=s.Company_Code)  LEFT OUTER JOIN In_Stock_Image g ON (a.Sku_No = g.Sku_No AND a.Company_Code=g.Company_Code  AND a.Uom=g.Uom AND g.Order_No=0)  LEFT OUTER JOIN SY_Purchase_GST_Code gst1 ON (gst1.Code=a.Purchase_GST_Code)  LEFT OUTER JOIN SY_Supply_GST_Code gst2 ON (gst2.Code=a.Supply_GST_Code)  LEFT OUTER JOIN EI_Item_Class ei1 ON (ei1.Code=a.EI_Item_Class collate database_default)  LEFT OUTER JOIN EI_Item_Class ei4 ON (ei4.Code=a.EI_SelfBill_Class collate database_default)  LEFT OUTER JOIN EI_Country ei2 ON (ei2.Code=a.EI_Country collate database_default)  LEFT OUTER JOIN EI_Tax_Type ei3 ON (ei3.Code=a.EI_Tax_Type collate database_default)  Order By a.Sku_No
GO

-- [08/11/2026 11:22:39] spid=60 tran=16787348 db=RMS rows=0 1.870000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,Cast(0 as decimal) as StockAmt , a.*,v.Name as LastVendorName,s.Full_Name as LastSalesRepName,g.product_image,g.Product_Image_Path ,(Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and a.Sku_no=b.Sku_no and a.uom=b.Uom and b.status='A' ) as Plu_No, ei1.Description as ItemClassDesc ,ei4.Description as SelfBillClassDesc, ei2.Description as CountryDesc, ei3.Description as TaxTypeDesc, a.Standard_Cost as Def_Cost, CASE WHEN a.BasicPrice=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.BasicPrice END as ProfitMgn, CASE WHEN a.Standard_Cost=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.Standard_Cost END as MarkupMgn, Cast(a.BasicPrice*a.Company_Comm_Rate/100 as decimal(12,2)) as Company_Comm_Amt, Cast(a.BasicPrice*a.Promoter_Comm_Rate/100 as decimal(12,2)) as Promoter_Comm_Amt, (Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and  a.Sku_no=b.Sku_no and a.Pack_Size_Desc=b.Uom and b.status='A' ) as Pack_Plu_No,CAST(0.0 as money) as Pack_Stock_Qty,CAST(0.0 as money) as Pack_Net_Qty,0 as Pack_Cost,(Select Price From In_stock_uom b Where a.Company_Code=b.Company_Code AND a.Sku_no=b.Sku_No AND a.Pack_Size_Uom=b.Uom) as Pack_Price , 0 as Loc_Stock_Qty,0 as Loc_Net_Qty , 0 as Web_Sold, CASE WHEN a.Flag3<>'Y' THEN 0 ELSE ( Select Top 1 Qty From Web_Item_Pricing web  Where web.Company_Code=a.Company_Code AND web.Sku_No=a.Sku_No ) END as Web_Qty FROM (SELECT DISTINCT a.EI_Tax_Type ,a.EI_Item_Class,a.EI_SelfBill_Class,a.EI_SelfBill_Country ,a.EI_SelfBill_Tax_Type,a.EI_Country ,a.Item_Type, a.Warranty_Period, a.Warranty_Period_Type, a.Nos,a.Max_Disc1,a.Max_Disc2,a.Max_Disc3,a.Special_Msg, a.Web_Special_Msg, a.Web_Mix_Match, a.Web_Chk_Date, a.Web_Item_Fr, a.Web_Item_To, a.Web_Daily_Qty, a.Web_Qty_Method, a.Alt_Plu , a.Loss_Percent, a5.GST_Price as GSTPrice, a.added_By,a.added_Date,a.last_modified_by, a.Last_Modified_Date, a.lastwritetimestamp,a.Volume,a.Volume_Length,a.Volume_height,Volume_Width,a.Volume_Uom,a.Volume_Factor,a.Weight,a.Weight_Uom,a.Weight_Factor,a.Comm_Type,a.Brand,a.Last_Vendor,NULLIF(a.Last_Sales_Rep_ID,0.00) as Last_Sales_Rep_ID,a.Record_Name,a.Check_Quota,a.description2,a.Pack_Size,a.Pack_Size_Uom,a.Pack_Size_Desc,a2.Matrix_No,a5.Price as BasicPrice,NULLIF(a.Company_Comm_Rate, 0.00) as Company_Comm_Rate, NULLIF(a.Promoter_Comm_Rate, 0.00) as Promoter_Comm_Rate, NULLIF(a.Company_Comm_Rate1, 0.00) as Company_Comm_Rate1, NULLIF(a.Promoter_Comm_Rate1, 0.00) as Promoter_Comm_Rate1, NULLIF(a.Company_Comm_Rate2, 0.00) as Company_Comm_Rate2, NULLIF(a.Promoter_Comm_Rate2, 0.00) as Promoter_Comm_Rate2, a.Company_Code, a.sku_no, a.Cku_No, a.uom, a.description, CASE WHEN a.status='C' THEN 'False' ELSE 'True' END AS Status, a.remarks, a.location, a.article_no,a.Size,a.Color,a.Actual_Size,a.Article_Desc,a.Intro_Date, NULLIF(a.Average_Cost, 0.00) AS Average_Cost,NULLIF(a.Standard_Cost, 0.00) AS Standard_Cost,NULLIF(a.Fifo_Cost, 0.00) AS Fifo_Cost,NULLIF(a.Last_Cost, 0.00) AS Last_Cost,NULLIF(a.Misc_Cost, 0.00) AS Misc_Cost, a.Budget_Qty,a.Budget_Amt,a.GST_Percent, a.MSIC_Code,Web_Grp,Web_Dept,Web_SubDept,Web_Category,Web_Promo_Grp,Quota_Grp, a.Purchase_GST_Code,a.Supply_GST_Code,Non_Buy,Flag1,Flag2,Flag3,Flag4,Flag5,Flag6,Flag7,Flag8,Flag9,Flag10, a.grp, a.dept, a.subdept, a.category, a.type, b.description as grpdesc, a.Ref1,a.Ref2,a.Ref3,a.Ref4,a.Ref1_Text,a.Ref2_Text,a.Ref3_Text,a.Ref4_Text,a.Open_Price,a.Open_Code,a.Qty_With_Decimal,a.Discountable,a.Allow_Zero_Price,a.Serial_No,a.Expiry,a.Batch_Expiry,a.Return_Due,a.Inventory_Item,a.Give_Point,a.Give_Rebate,a.No_Qty,a.No_Cost,a.Qty_On_Hand,a.Qty_On_Request,a.Qty_On_Sales,a.Qty_On_Sales_Order,a.Qty_On_Order,a.Qty_On_Received,a.Qty_On_Return,a.Qty_On_Trading,a.Qty_On_Customer_Return,a.Qty_On_Exchange,a.Qty_On_Repair,a.Qty_On_Adj_In,a.Qty_On_Adj_Out,a.Qty_On_Adj_Kiv,a.Qty_On_Quote,a.Issue_No,c.description as deptdesc, d.description as subdeptdesc, e.description as catdesc, f.description as typedesc , (Select Count(*) from In_Sku_Sub b Where a.Company_Code=b.Company_Code AND a.sku_no=b.sku_no) AS Item_Sub , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In+a.Qty_On_Order  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Net_Qty , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Stock_Qty FROM In_Stock a LEFT OUTER JOIN IN_Stock_Uom a5 ON (a.Sku_No = a5.Sku_No AND a.Uom=a5.Uom AND a.Company_Code=a5.Company_Code) LEFT OUTER JOIN IN_Matrix_Item a2 ON (a.Sku_No = a2.Sku_No AND a.Company_Code=a2.Company_Code)  LEFT OUTER JOIN PI_Group b ON (a.grp = b.grp AND a.Company_Code=b.Company_Code) LEFT OUTER JOIN PI_Department c ON (a.grp = c.grp AND a.dept = c.dept AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN PI_Sub_Dept d ON (a.grp = d.grp AND a.dept = d.dept AND a.subdept = d.subdept AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Category e ON (a.grp = e.grp AND a.dept = e.dept AND a.subdept = e.subdept AND a.category = e.category AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN PI_Stock_Type f ON (a.type = f.type AND a.Company_Code=f.Company_Code) WHERE a.Company_Code=1 AND a.Sku_No=-1) a  LEFT OUTER JOIN ACC.dbo.AP_Vendor v ON (a.Last_Vendor=v.Code  AND a.Company_Code=v.Company_Code )  LEFT OUTER JOIN Pr_Sales_Representative s ON (a.Last_Vendor=s.Vendor AND a.Last_Sales_Rep_ID=s.Sales_Rep_ID AND a.Company_Code=s.Company_Code)  LEFT OUTER JOIN In_Stock_Image g ON (a.Sku_No = g.Sku_No AND a.Company_Code=g.Company_Code  AND a.Uom=g.Uom AND g.Order_No=0)  LEFT OUTER JOIN SY_Purchase_GST_Code gst1 ON (gst1.Code=a.Purchase_GST_Code)  LEFT OUTER JOIN SY_Supply_GST_Code gst2 ON (gst2.Code=a.Supply_GST_Code)  LEFT OUTER JOIN EI_Item_Class ei1 ON (ei1.Code=a.EI_Item_Class collate database_default)  LEFT OUTER JOIN EI_Item_Class ei4 ON (ei4.Code=a.EI_SelfBill_Class collate database_default)  LEFT OUTER JOIN EI_Country ei2 ON (ei2.Code=a.EI_Country collate database_default)  LEFT OUTER JOIN EI_Tax_Type ei3 ON (ei3.Code=a.EI_Tax_Type collate database_default)  Order By a.Sku_No
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=7 0.042000ms  app=.Net SqlClient Data Provider
Select 'False' as Checked,Area,Description From PI_Area Where Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=7 0.665000ms  app=.Net SqlClient Data Provider
Select 'False' as Checked,Area,Description From PI_Area Where Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=2 0.441000ms  app=.Net SqlClient Data Provider
Select 'False' as Checked,Zone,Description From PI_Zone Where Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=2 0.025000ms  app=.Net SqlClient Data Provider
Select 'False' as Checked,Zone,Description From PI_Zone Where Company_Code=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=2 40.968000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'PI_Stock_Type_Sel'
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=2 0.538000ms  app=.Net SqlClient Data Provider
exec PI_Stock_Type_Sel @CompanyCode=1
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:22:39] spid=60 tran=16788073 db=RMS rows=1 3.971000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,Cast(0 as decimal) as StockAmt , a.*,v.Name as LastVendorName,s.Full_Name as LastSalesRepName,g.product_image,g.Product_Image_Path ,(Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and a.Sku_no=b.Sku_no and a.uom=b.Uom and b.status='A' ) as Plu_No, ei1.Description as ItemClassDesc ,ei4.Description as SelfBillClassDesc, ei2.Description as CountryDesc, ei3.Description as TaxTypeDesc, a.Standard_Cost as Def_Cost, CASE WHEN a.BasicPrice=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.BasicPrice END as ProfitMgn, CASE WHEN a.Standard_Cost=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.Standard_Cost END as MarkupMgn, Cast(a.BasicPrice*a.Company_Comm_Rate/100 as decimal(12,2)) as Company_Comm_Amt, Cast(a.BasicPrice*a.Promoter_Comm_Rate/100 as decimal(12,2)) as Promoter_Comm_Amt, (Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and  a.Sku_no=b.Sku_no and a.Pack_Size_Desc=b.Uom and b.status='A' ) as Pack_Plu_No,CAST(0.0 as money) as Pack_Stock_Qty,CAST(0.0 as money) as Pack_Net_Qty,0 as Pack_Cost,(Select Price From In_stock_uom b Where a.Company_Code=b.Company_Code AND a.Sku_no=b.Sku_No AND a.Pack_Size_Uom=b.Uom) as Pack_Price , 0 as Loc_Stock_Qty,0 as Loc_Net_Qty , 0 as Web_Sold, CASE WHEN a.Flag3<>'Y' THEN 0 ELSE ( Select Top 1 Qty From Web_Item_Pricing web  Where web.Company_Code=a.Company_Code AND web.Sku_No=a.Sku_No ) END as Web_Qty FROM (SELECT DISTINCT a.EI_Tax_Type ,a.EI_Item_Class,a.EI_SelfBill_Class,a.EI_SelfBill_Country ,a.EI_SelfBill_Tax_Type,a.EI_Country ,a.Item_Type, a.Warranty_Period, a.Warranty_Period_Type, a.Nos,a.Max_Disc1,a.Max_Disc2,a.Max_Disc3,a.Special_Msg, a.Web_Special_Msg, a.Web_Mix_Match, a.Web_Chk_Date, a.Web_Item_Fr, a.Web_Item_To, a.Web_Daily_Qty, a.Web_Qty_Method, a.Alt_Plu , a.Loss_Percent, a5.GST_Price as GSTPrice, a.added_By,a.added_Date,a.last_modified_by, a.Last_Modified_Date, a.lastwritetimestamp,a.Volume,a.Volume_Length,a.Volume_height,Volume_Width,a.Volume_Uom,a.Volume_Factor,a.Weight,a.Weight_Uom,a.Weight_Factor,a.Comm_Type,a.Brand,a.Last_Vendor,NULLIF(a.Last_Sales_Rep_ID,0.00) as Last_Sales_Rep_ID,a.Record_Name,a.Check_Quota,a.description2,a.Pack_Size,a.Pack_Size_Uom,a.Pack_Size_Desc,a2.Matrix_No,a5.Price as BasicPrice,NULLIF(a.Company_Comm_Rate, 0.00) as Company_Comm_Rate, NULLIF(a.Promoter_Comm_Rate, 0.00) as Promoter_Comm_Rate, NULLIF(a.Company_Comm_Rate1, 0.00) as Company_Comm_Rate1, NULLIF(a.Promoter_Comm_Rate1, 0.00) as Promoter_Comm_Rate1, NULLIF(a.Company_Comm_Rate2, 0.00) as Company_Comm_Rate2, NULLIF(a.Promoter_Comm_Rate2, 0.00) as Promoter_Comm_Rate2, a.Company_Code, a.sku_no, a.Cku_No, a.uom, a.description, CASE WHEN a.status='C' THEN 'False' ELSE 'True' END AS Status, a.remarks, a.location, a.article_no,a.Size,a.Color,a.Actual_Size,a.Article_Desc,a.Intro_Date, NULLIF(a.Average_Cost, 0.00) AS Average_Cost,NULLIF(a.Standard_Cost, 0.00) AS Standard_Cost,NULLIF(a.Fifo_Cost, 0.00) AS Fifo_Cost,NULLIF(a.Last_Cost, 0.00) AS Last_Cost,NULLIF(a.Misc_Cost, 0.00) AS Misc_Cost, a.Budget_Qty,a.Budget_Amt,a.GST_Percent, a.MSIC_Code,Web_Grp,Web_Dept,Web_SubDept,Web_Category,Web_Promo_Grp,Quota_Grp, a.Purchase_GST_Code,a.Supply_GST_Code,Non_Buy,Flag1,Flag2,Flag3,Flag4,Flag5,Flag6,Flag7,Flag8,Flag9,Flag10, a.grp, a.dept, a.subdept, a.category, a.type, b.description as grpdesc, a.Ref1,a.Ref2,a.Ref3,a.Ref4,a.Ref1_Text,a.Ref2_Text,a.Ref3_Text,a.Ref4_Text,a.Open_Price,a.Open_Code,a.Qty_With_Decimal,a.Discountable,a.Allow_Zero_Price,a.Serial_No,a.Expiry,a.Batch_Expiry,a.Return_Due,a.Inventory_Item,a.Give_Point,a.Give_Rebate,a.No_Qty,a.No_Cost,a.Qty_On_Hand,a.Qty_On_Request,a.Qty_On_Sales,a.Qty_On_Sales_Order,a.Qty_On_Order,a.Qty_On_Received,a.Qty_On_Return,a.Qty_On_Trading,a.Qty_On_Customer_Return,a.Qty_On_Exchange,a.Qty_On_Repair,a.Qty_On_Adj_In,a.Qty_On_Adj_Out,a.Qty_On_Adj_Kiv,a.Qty_On_Quote,a.Issue_No,c.description as deptdesc, d.description as subdeptdesc, e.description as catdesc, f.description as typedesc , (Select Count(*) from In_Sku_Sub b Where a.Company_Code=b.Company_Code AND a.sku_no=b.sku_no) AS Item_Sub , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In+a.Qty_On_Order  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Net_Qty , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Stock_Qty FROM In_Stock a LEFT OUTER JOIN IN_Stock_Uom a5 ON (a.Sku_No = a5.Sku_No AND a.Uom=a5.Uom AND a.Company_Code=a5.Company_Code) LEFT OUTER JOIN IN_Matrix_Item a2 ON (a.Sku_No = a2.Sku_No AND a.Company_Code=a2.Company_Code)  LEFT OUTER JOIN PI_Group b ON (a.grp = b.grp AND a.Company_Code=b.Company_Code) LEFT OUTER JOIN PI_Department c ON (a.grp = c.grp AND a.dept = c.dept AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN PI_Sub_Dept d ON (a.grp = d.grp AND a.dept = d.dept AND a.subdept = d.subdept AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Category e ON (a.grp = e.grp AND a.dept = e.dept AND a.subdept = e.subdept AND a.category = e.category AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN PI_Stock_Type f ON (a.type = f.type AND a.Company_Code=f.Company_Code) WHERE a.Company_Code=1 AND a.Sku_No=1) a  LEFT OUTER JOIN ACC.dbo.AP_Vendor v ON (a.Last_Vendor=v.Code  AND a.Company_Code=v.Company_Code )  LEFT OUTER JOIN Pr_Sales_Representative s ON (a.Last_Vendor=s.Vendor AND a.Last_Sales_Rep_ID=s.Sales_Rep_ID AND a.Company_Code=s.Company_Code)  LEFT OUTER JOIN In_Stock_Image g ON (a.Sku_No = g.Sku_No AND a.Company_Code=g.Company_Code  AND a.Uom=g.Uom AND g.Order_No=0)  LEFT OUTER JOIN SY_Purchase_GST_Code gst1 ON (gst1.Code=a.Purchase_GST_Code)  LEFT OUTER JOIN SY_Supply_GST_Code gst2 ON (gst2.Code=a.Supply_GST_Code)  LEFT OUTER JOIN EI_Item_Class ei1 ON (ei1.Code=a.EI_Item_Class collate database_default)  LEFT OUTER JOIN EI_Item_Class ei4 ON (ei4.Code=a.EI_SelfBill_Class collate database_default)  LEFT OUTER JOIN EI_Country ei2 ON (ei2.Code=a.EI_Country collate database_default)  LEFT OUTER JOIN EI_Tax_Type ei3 ON (ei3.Code=a.EI_Tax_Type collate database_default)  Order By a.Sku_No
GO

-- [08/11/2026 11:22:39] spid=60 tran=0 db=RMS rows=1 21.648000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Selected,Cast(0 as decimal) as StockAmt , a.*,v.Name as LastVendorName,s.Full_Name as LastSalesRepName,g.product_image,g.Product_Image_Path ,(Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and a.Sku_no=b.Sku_no and a.uom=b.Uom and b.status='A' ) as Plu_No, ei1.Description as ItemClassDesc ,ei4.Description as SelfBillClassDesc, ei2.Description as CountryDesc, ei3.Description as TaxTypeDesc, a.Standard_Cost as Def_Cost, CASE WHEN a.BasicPrice=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.BasicPrice END as ProfitMgn, CASE WHEN a.Standard_Cost=0 THEN 0 ELSE (a.BasicPrice-a.Standard_Cost)*100/a.Standard_Cost END as MarkupMgn, Cast(a.BasicPrice*a.Company_Comm_Rate/100 as decimal(12,2)) as Company_Comm_Amt, Cast(a.BasicPrice*a.Promoter_Comm_Rate/100 as decimal(12,2)) as Promoter_Comm_Amt, (Select Top 1 plu_no from in_stock_Plu b where a.company_Code=b.company_Code and  a.Sku_no=b.Sku_no and a.Pack_Size_Desc=b.Uom and b.status='A' ) as Pack_Plu_No,CAST(0.0 as money) as Pack_Stock_Qty,CAST(0.0 as money) as Pack_Net_Qty,0 as Pack_Cost,(Select Price From In_stock_uom b Where a.Company_Code=b.Company_Code AND a.Sku_no=b.Sku_No AND a.Pack_Size_Uom=b.Uom) as Pack_Price , 0 as Loc_Stock_Qty,0 as Loc_Net_Qty , 0 as Web_Sold, CASE WHEN a.Flag3<>'Y' THEN 0 ELSE ( Select Top 1 Qty From Web_Item_Pricing web  Where web.Company_Code=a.Company_Code AND web.Sku_No=a.Sku_No ) END as Web_Qty FROM (SELECT DISTINCT a.EI_Tax_Type ,a.EI_Item_Class,a.EI_SelfBill_Class,a.EI_SelfBill_Country ,a.EI_SelfBill_Tax_Type,a.EI_Country ,a.Item_Type, a.Warranty_Period, a.Warranty_Period_Type, a.Nos,a.Max_Disc1,a.Max_Disc2,a.Max_Disc3,a.Special_Msg, a.Web_Special_Msg, a.Web_Mix_Match, a.Web_Chk_Date, a.Web_Item_Fr, a.Web_Item_To, a.Web_Daily_Qty, a.Web_Qty_Method, a.Alt_Plu , a.Loss_Percent, a5.GST_Price as GSTPrice, a.added_By,a.added_Date,a.last_modified_by, a.Last_Modified_Date, a.lastwritetimestamp,a.Volume,a.Volume_Length,a.Volume_height,Volume_Width,a.Volume_Uom,a.Volume_Factor,a.Weight,a.Weight_Uom,a.Weight_Factor,a.Comm_Type,a.Brand,a.Last_Vendor,NULLIF(a.Last_Sales_Rep_ID,0.00) as Last_Sales_Rep_ID,a.Record_Name,a.Check_Quota,a.description2,a.Pack_Size,a.Pack_Size_Uom,a.Pack_Size_Desc,a2.Matrix_No,a5.Price as BasicPrice,NULLIF(a.Company_Comm_Rate, 0.00) as Company_Comm_Rate, NULLIF(a.Promoter_Comm_Rate, 0.00) as Promoter_Comm_Rate, NULLIF(a.Company_Comm_Rate1, 0.00) as Company_Comm_Rate1, NULLIF(a.Promoter_Comm_Rate1, 0.00) as Promoter_Comm_Rate1, NULLIF(a.Company_Comm_Rate2, 0.00) as Company_Comm_Rate2, NULLIF(a.Promoter_Comm_Rate2, 0.00) as Promoter_Comm_Rate2, a.Company_Code, a.sku_no, a.Cku_No, a.uom, a.description, CASE WHEN a.status='C' THEN 'False' ELSE 'True' END AS Status, a.remarks, a.location, a.article_no,a.Size,a.Color,a.Actual_Size,a.Article_Desc,a.Intro_Date, NULLIF(a.Average_Cost, 0.00) AS Average_Cost,NULLIF(a.Standard_Cost, 0.00) AS Standard_Cost,NULLIF(a.Fifo_Cost, 0.00) AS Fifo_Cost,NULLIF(a.Last_Cost, 0.00) AS Last_Cost,NULLIF(a.Misc_Cost, 0.00) AS Misc_Cost, a.Budget_Qty,a.Budget_Amt,a.GST_Percent, a.MSIC_Code,Web_Grp,Web_Dept,Web_SubDept,Web_Category,Web_Promo_Grp,Quota_Grp, a.Purchase_GST_Code,a.Supply_GST_Code,Non_Buy,Flag1,Flag2,Flag3,Flag4,Flag5,Flag6,Flag7,Flag8,Flag9,Flag10, a.grp, a.dept, a.subdept, a.category, a.type, b.description as grpdesc, a.Ref1,a.Ref2,a.Ref3,a.Ref4,a.Ref1_Text,a.Ref2_Text,a.Ref3_Text,a.Ref4_Text,a.Open_Price,a.Open_Code,a.Qty_With_Decimal,a.Discountable,a.Allow_Zero_Price,a.Serial_No,a.Expiry,a.Batch_Expiry,a.Return_Due,a.Inventory_Item,a.Give_Point,a.Give_Rebate,a.No_Qty,a.No_Cost,a.Qty_On_Hand,a.Qty_On_Request,a.Qty_On_Sales,a.Qty_On_Sales_Order,a.Qty_On_Order,a.Qty_On_Received,a.Qty_On_Return,a.Qty_On_Trading,a.Qty_On_Customer_Return,a.Qty_On_Exchange,a.Qty_On_Repair,a.Qty_On_Adj_In,a.Qty_On_Adj_Out,a.Qty_On_Adj_Kiv,a.Qty_On_Quote,a.Issue_No,c.description as deptdesc, d.description as subdeptdesc, e.description as catdesc, f.description as typedesc , (Select Count(*) from In_Sku_Sub b Where a.Company_Code=b.Company_Code AND a.sku_no=b.sku_no) AS Item_Sub , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In+a.Qty_On_Order  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Net_Qty , (a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In  - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading  - a.Qty_On_Sales-a.Qty_On_Return) AS Stock_Qty FROM In_Stock a LEFT OUTER JOIN IN_Stock_Uom a5 ON (a.Sku_No = a5.Sku_No AND a.Uom=a5.Uom AND a.Company_Code=a5.Company_Code) LEFT OUTER JOIN IN_Matrix_Item a2 ON (a.Sku_No = a2.Sku_No AND a.Company_Code=a2.Company_Code)  LEFT OUTER JOIN PI_Group b ON (a.grp = b.grp AND a.Company_Code=b.Company_Code) LEFT OUTER JOIN PI_Department c ON (a.grp = c.grp AND a.dept = c.dept AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN PI_Sub_Dept d ON (a.grp = d.grp AND a.dept = d.dept AND a.subdept = d.subdept AND a.Company_Code=d.Company_Code) LEFT OUTER JOIN PI_Category e ON (a.grp = e.grp AND a.dept = e.dept AND a.subdept = e.subdept AND a.category = e.category AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN PI_Stock_Type f ON (a.type = f.type AND a.Company_Code=f.Company_Code) WHERE a.Company_Code=1 AND a.Sku_No=1) a  LEFT OUTER JOIN ACC.dbo.AP_Vendor v ON (a.Last_Vendor=v.Code  AND a.Company_Code=v.Company_Code )  LEFT OUTER JOIN Pr_Sales_Representative s ON (a.Last_Vendor=s.Vendor AND a.Last_Sales_Rep_ID=s.Sales_Rep_ID AND a.Company_Code=s.Company_Code)  LEFT OUTER JOIN In_Stock_Image g ON (a.Sku_No = g.Sku_No AND a.Company_Code=g.Company_Code  AND a.Uom=g.Uom AND g.Order_No=0)  LEFT OUTER JOIN SY_Purchase_GST_Code gst1 ON (gst1.Code=a.Purchase_GST_Code)  LEFT OUTER JOIN SY_Supply_GST_Code gst2 ON (gst2.Code=a.Supply_GST_Code)  LEFT OUTER JOIN EI_Item_Class ei1 ON (ei1.Code=a.EI_Item_Class collate database_default)  LEFT OUTER JOIN EI_Item_Class ei4 ON (ei4.Code=a.EI_SelfBill_Class collate database_default)  LEFT OUTER JOIN EI_Country ei2 ON (ei2.Code=a.EI_Country collate database_default)  LEFT OUTER JOIN EI_Tax_Type ei3 ON (ei3.Code=a.EI_Tax_Type collate database_default)  Order By a.Sku_No
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=0 0.605000ms  app=.Net SqlClient Data Provider
Select Sales_Rep_ID as ID,Full_Name From PR_Sales_Representative Where Company_Code=1 AND Vendor=''
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=0 0.261000ms  app=.Net SqlClient Data Provider
Select Sales_Rep_ID as ID,Full_Name From PR_Sales_Representative Where Company_Code=1 AND Vendor=''
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=94 0.157000ms  app=.Net SqlClient Data Provider
Select Code,description from PI_Brand where company_Code=1
GO

-- [08/11/2026 11:23:00] spid=60 tran=0 db=RMS rows=94 0.933000ms  app=.Net SqlClient Data Provider
Select Code,description from PI_Brand where company_Code=1
GO

-- [08/11/2026 11:23:03] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788227 db=RMS rows=1 14.417000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 1 AND a.Company_Code=1
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788227 db=RMS rows=1 0.953000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 1 AND a.Company_Code=1
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788227 db=RMS rows=1 0.352000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 1 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788227 db=RMS rows=1 1.703000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 1 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:23:03] spid=60 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:03] spid=60 tran=0 db=RMS rows=1 5.934000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=1 AND b.Uom='ROL' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788365 db=RMS rows=1 2.364000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=1 AND b.Uom='ROL' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:23:03] spid=60 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:03] spid=60 tran=16788391 db=RMS rows=2 14.616000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=1ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:23:03] spid=60 tran=0 db=RMS rows=2 17.336000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=1ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=1 5.608000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=1 AND a2.Uom='ROL'
GO

-- [08/11/2026 11:23:40] spid=60 tran=16788757 db=RMS rows=1 0.082000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=1 AND a2.Uom='ROL'
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=1 0.079000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=1 AND Company_Code=1
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=1 7.552000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=1 AND Company_Code=1
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=1 0.691000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=1 AND Company_Code=1
GO

-- [08/11/2026 11:23:40] spid=60 tran=0 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=1 AND Company_Code=1
GO

-- [08/11/2026 11:23:44] spid=60 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:44] spid=60 tran=0 db=RMS rows=0 0.197000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=000001 AND a.Uom='ROL'
GO

-- [08/11/2026 11:23:44] spid=60 tran=0 db=RMS rows=0 1.101000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=000001 AND a.Uom='ROL'
GO

-- [08/11/2026 11:23:53] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:53] spid=60 tran=0 db=RMS rows=1 3.838000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788926 db=RMS rows=1 0.069000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=0 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.070000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 1.522000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=0 2.295000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010076'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.753000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=0 0.037000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010076'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.045000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 1.164000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010076', CONVERT(DATETIME,'16-04-2026',103), CONVERT(DATETIME,'15-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,11.000000,1,1100.00,0.0000,0.00,0.0000,0.00,1100.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'16-04-2026 19:21:45 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'10-10-2026',103), 'FST','','',0.0000,'N','Y','','N','','','','',0,1100.00,'','','','','')
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=2 3.759000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010076', CONVERT(DATETIME,'16-04-2026',103), CONVERT(DATETIME,'15-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,11.000000,1,1100.00,0.0000,0.00,0.0000,0.00,1100.00,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'16-04-2026 19:21:45 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'10-10-2026',103), 'FST','','',0.0000,'N','Y','','N','','','','',0,1100.00,'','','','','')
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.774000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.463000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 2.464000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010076',196806,'', CONVERT(DATETIME,'01-01-1900',103), 1,'ROL',1.00,'A',10.0000,0.0000,1.0000,0.0000,110.00000000,110.000000,0,0.00,0,0.00,0,0.00,0,0.00,0,1100.00,'2000001000014','',120.0000,88.0000,93.0000,0.0000,88.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:23:40 PM',103),0.0000,'','','O',0.00,0.00,'N','','','ROL',120.0000,0,'',1,'',110.00000000,0.0000,10.0000,0)
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.058000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010076',196806,'', CONVERT(DATETIME,'01-01-1900',103), 1,'ROL',1.00,'A',10.0000,0.0000,1.0000,0.0000,110.00000000,110.000000,0,0.00,0,0.00,0,0.00,0,0.00,0,1100.00,'2000001000014','',120.0000,88.0000,93.0000,0.0000,88.0000,0.0000, CONVERT(DATETIME,'11-08-2026 19:23:40 PM',103),0.0000,'','','O',0.00,0.00,'N','','','ROL',120.0000,0,'',1,'',110.00000000,0.0000,10.0000,0)
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.733000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 11.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 1.997000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 11.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 1
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 1.350000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 1 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 1 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 11.000000 WHERE Sku_No = 1 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.764000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 11.000000 WHERE Sku_No = 1 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=0 6.310000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010076' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No) 
 Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010076' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=0 0.144000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010076' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No)
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=0 0.072000ms  app=.Net SqlClient Data Provider
Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010076' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 0.049000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:23:53] spid=60 tran=16788927 db=RMS rows=1 4.400000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:28:57] spid=60 tran=0 db=RMS rows=7 141.569000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:28:57] spid=60 tran=0 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:28:57] spid=60 tran=0 db=RMS rows=1 0.462000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:28:57] spid=60 tran=0 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:29:40] spid=60 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794287 db=RMS rows=1 2.325000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794287 db=RMS rows=1 27.140000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794287 db=RMS rows=2 1.619000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794287 db=RMS rows=2 0.126000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:29:40] spid=60 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794545 db=RMS rows=0 7.942000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:29:40] spid=60 tran=0 db=RMS rows=0 13.211000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:29:40] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:29:40] spid=60 tran=0 db=RMS rows=2 2.821000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:29:40] spid=60 tran=16794571 db=RMS rows=2 0.724000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:00] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:30:00] spid=60 tran=16794658 db=RMS rows=1 1.666000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='CTN' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:00] spid=60 tran=0 db=RMS rows=1 8.071000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='CTN' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:00] spid=60 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:30:00] spid=60 tran=0 db=RMS rows=2 5.663000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:00] spid=60 tran=16794684 db=RMS rows=2 1.166000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:03] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:30:03] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:30:03] spid=60 tran=16794710 db=RMS rows=0 6.561000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:03] spid=60 tran=0 db=RMS rows=0 11.558000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:03] spid=60 tran=0 db=RMS rows=2 0.722000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:30:03] spid=60 tran=16794717 db=RMS rows=2 0.705000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:31:08] spid=60 tran=0 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=16794995 db=RMS rows=0 0.030000ms  app=.Net SqlClient Data Provider
Select Company_Code from PI_Company_Name Order by Company_Code
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.674000ms  app=.Net SqlClient Data Provider
Select Company_Code from PI_Company_Name Order by Company_Code
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 3.222000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked,location_code, Name from PI_Company_Location where company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked,location_code, Name from PI_Company_Location where company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.033000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked, Code, Description from MY_Cart_Type where status='A' AND company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 2.173000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked, Code, Description from MY_Cart_Type where status='A' AND company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=2 1.062000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked, Code, Description from MP_Invoice_Type where company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=2 0.181000ms  app=.Net SqlClient Data Provider
Select Cast(0 as bit) as Checked, Code, Description from MP_Invoice_Type where company_code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=16795066 db=RMS rows=1 2.091000ms  app=.Net SqlClient Data Provider
SELECT a.* , b.Description AS BranchDesc, c.Description AS TypeDesc, d.Description AS PriceTypeDesc, e.description as NationalityDesc, f.Description as OccupationDesc, g.Description as MemberTypeDesc, h.description as RaceDesc, i.Description as ReligionDesc, j.Description as NewspaperDesc, k.Description AS DefaultRewardTypeDesc, l.Description AS DefaultMemberTypeDesc, m.Description as cityDesc, n.Description AS stateDesc, o.Description AS countryDesc FROM MS_Setup a LEFT OUTER JOIN MS_Branch b ON (b.Branch = a.Branch) LEFT OUTER JOIN SY_Nationality e ON (e.Nationality = a.Default_Nationality  AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN SY_Occupation f ON (f.Occupation = a.Default_Occupation AND a.Company_Code=f.Company_Code) LEFT OUTER JOIN MS_Member_Type g ON (g.Member_Type = a.Current_Member_Type AND a.Company_Code=g.Company_Code) LEFT OUTER JOIN SY_Race h ON (h.Race = a.Default_Race AND a.Company_Code=h.Company_Code) LEFT OUTER JOIN SY_Religion i ON (i.Religion = a.Default_Religion AND a.Company_Code=i.Company_Code) LEFT OUTER JOIN SY_Newspaper j ON (j.Newspaper = a.Default_Newspaper AND a.Company_Code=j.Company_Code) LEFT OUTER JOIN MS_Reward_Type c ON (c.Reward_Type = a.Current_Reward_Type AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN MP_Customer_Price_Type d ON (d.Price_Type = a.Current_Price_Type AND d.Company_Code = 1) LEFT OUTER JOIN MS_Reward_Type k ON (k.Reward_Type = a.Default_Reward_type AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN MS_Member_Type l ON (l.Member_Type = a.Default_Member_type AND l.Company_Code = a.Company_Code) LEFT OUTER JOIN PI_City m ON a.Default_City=m.City LEFT OUTER JOIN PI_State n ON a.Default_State=n.State LEFT OUTER JOIN PI_Country o ON a.Default_Country=o.Country WHERE a.Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 14.077000ms  app=.Net SqlClient Data Provider
SELECT a.* , b.Description AS BranchDesc, c.Description AS TypeDesc, d.Description AS PriceTypeDesc, e.description as NationalityDesc, f.Description as OccupationDesc, g.Description as MemberTypeDesc, h.description as RaceDesc, i.Description as ReligionDesc, j.Description as NewspaperDesc, k.Description AS DefaultRewardTypeDesc, l.Description AS DefaultMemberTypeDesc, m.Description as cityDesc, n.Description AS stateDesc, o.Description AS countryDesc FROM MS_Setup a LEFT OUTER JOIN MS_Branch b ON (b.Branch = a.Branch) LEFT OUTER JOIN SY_Nationality e ON (e.Nationality = a.Default_Nationality  AND a.Company_Code=e.Company_Code) LEFT OUTER JOIN SY_Occupation f ON (f.Occupation = a.Default_Occupation AND a.Company_Code=f.Company_Code) LEFT OUTER JOIN MS_Member_Type g ON (g.Member_Type = a.Current_Member_Type AND a.Company_Code=g.Company_Code) LEFT OUTER JOIN SY_Race h ON (h.Race = a.Default_Race AND a.Company_Code=h.Company_Code) LEFT OUTER JOIN SY_Religion i ON (i.Religion = a.Default_Religion AND a.Company_Code=i.Company_Code) LEFT OUTER JOIN SY_Newspaper j ON (j.Newspaper = a.Default_Newspaper AND a.Company_Code=j.Company_Code) LEFT OUTER JOIN MS_Reward_Type c ON (c.Reward_Type = a.Current_Reward_Type AND a.Company_Code=c.Company_Code) LEFT OUTER JOIN MP_Customer_Price_Type d ON (d.Price_Type = a.Current_Price_Type AND d.Company_Code = 1) LEFT OUTER JOIN MS_Reward_Type k ON (k.Reward_Type = a.Default_Reward_type AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN MS_Member_Type l ON (l.Member_Type = a.Default_Member_type AND l.Company_Code = a.Company_Code) LEFT OUTER JOIN PI_City m ON a.Default_City=m.City LEFT OUTER JOIN PI_State n ON a.Default_State=n.State LEFT OUTER JOIN PI_Country o ON a.Default_Country=o.Country WHERE a.Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=11 0.772000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=11 0.032000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.140000ms  app=.Net SqlClient Data Provider
SELECT * FROM MS_Statement_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.802000ms  app=.Net SqlClient Data Provider
SELECT * FROM MS_Statement_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 0.562000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code,a.Name From PI_Company_Location a  WHERE a.Company_code = 1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code,a.Name From PI_Company_Location a  WHERE a.Company_code = 1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=16795078 db=RMS rows=1 0.271000ms  app=.Net SqlClient Data Provider
Select ISNULL(IMS_Customer_Central,'N') From SY_System
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 1.187000ms  app=.Net SqlClient Data Provider
Select ISNULL(IMS_Customer_Central,'N') From SY_System
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=8 37.406000ms  app=.Net SqlClient Data Provider
exec PI_Users_Sel
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=2 0.918000ms  app=.Net SqlClient Data Provider
SELECT a.Designation, a.Description From PI_Designation a
GO

-- [08/11/2026 11:32:02] spid=60 tran=16795233 db=RMS rows=2 0.213000ms  app=.Net SqlClient Data Provider
SELECT a.Designation, a.Description From PI_Designation a
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.026000ms  app=.Net SqlClient Data Provider
Select Code,description from CF_Production_Line where company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.673000ms  app=.Net SqlClient Data Provider
Select Code,description from CF_Production_Line where company_Code=1
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.873000ms  app=.Net SqlClient Data Provider
Select Code,Description,Stored_Prod,[Index] from SY_Auto_Search Where Type='PLU'
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.030000ms  app=.Net SqlClient Data Provider
Select Code,Description,Stored_Prod,[Index] from SY_Auto_Search Where Type='PLU'
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
Select Code,Description,Stored_Prod,[Index] from SY_Auto_Search Where Type='SKU'
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.080000ms  app=.Net SqlClient Data Provider
Select Code,Description,Stored_Prod,[Index] from SY_Auto_Search Where Type='SKU'
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:02] spid=60 tran=0 db=RMS rows=1 1.264000ms  app=.Net SqlClient Data Provider
Select User_ID, Full_Name From ACC.dbo.SY_User
GO

-- [08/11/2026 11:32:02] spid=60 tran=16795261 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
Select User_ID, Full_Name From ACC.dbo.SY_User
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795372 db=RMS rows=1 1.280000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 35.153000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 13.946000ms  app=.Net SqlClient Data Provider
Select -16192 as Color,cast(CASE WHEN b.Company_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_Company a  Left Outer Join CTL_User_Company b ON (a.Company_ID=b.Company_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795382 db=RMS rows=0 0.044000ms  app=.Net SqlClient Data Provider
Select -16192 as Color,cast(CASE WHEN b.Company_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_Company a  Left Outer Join CTL_User_Company b ON (a.Company_ID=b.Company_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795389 db=RMS rows=0 0.035000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.Company_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_Company a  Left Outer Join CTL_User_Company_PriceChecker b ON (a.Company_ID=b.Company_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.929000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.Company_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_Company a  Left Outer Join CTL_User_Company_PriceChecker b ON (a.Company_ID=b.Company_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 2.923000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.User_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,a.* from CTL_Select_Structure a  Left Outer Join CTL_Select_Structure_User b ON (a.Code=b.Code AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795397 db=RMS rows=0 0.045000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.User_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,a.* from CTL_Select_Structure a  Left Outer Join CTL_Select_Structure_User b ON (a.Code=b.Code AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795405 db=RMS rows=0 0.043000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.RCompany_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_RCompany a  Left Outer Join CTL_User_RCompany b ON (a.RCompany_ID=b.RCompany_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 1.750000ms  app=.Net SqlClient Data Provider
Select cast(CASE WHEN b.RCompany_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected,* from CTL_RCompany a  Left Outer Join CTL_User_RCompany b ON (a.RCompany_ID=b.RCompany_ID AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 2.502000ms  app=.Net SqlClient Data Provider
Select '' as del,cast(CASE WHEN b.Location_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected, cast(CASE WHEN b.DT_AD_Create_Event ='Y' THEN 1 ELSE 0 END as bit) as DistADCreateEvent , cast(CASE WHEN b.DT_SI_Create_Event ='Y' THEN 1 ELSE 0 END as bit) as DistSICreateEvent , cast(CASE WHEN b.DT_AD_Add_item ='Y' THEN 1 ELSE 0 END as bit) as DistADAddItem , cast(CASE WHEN b.DT_SI_Add_item ='Y' THEN 1 ELSE 0 END as bit) as DistSIAddItem , * from Web_Select_Location a  Left Outer Join PI_User_App_Select_Location b ON (a.Location_ID=b.Location_ID And b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795421 db=RMS rows=1 0.272000ms  app=.Net SqlClient Data Provider
Select '' as del,cast(CASE WHEN b.Location_ID IS NULL THEN 0 ELSE 1 END as bit) as Selected, cast(CASE WHEN b.DT_AD_Create_Event ='Y' THEN 1 ELSE 0 END as bit) as DistADCreateEvent , cast(CASE WHEN b.DT_SI_Create_Event ='Y' THEN 1 ELSE 0 END as bit) as DistSICreateEvent , cast(CASE WHEN b.DT_AD_Add_item ='Y' THEN 1 ELSE 0 END as bit) as DistADAddItem , cast(CASE WHEN b.DT_SI_Add_item ='Y' THEN 1 ELSE 0 END as bit) as DistSIAddItem , * from Web_Select_Location a  Left Outer Join PI_User_App_Select_Location b ON (a.Location_ID=b.Location_ID And b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795428 db=RMS rows=1 0.196000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name from PI_User_App a  Left Outer Join MP_Representative b ON (a.Company_Code=b.Company_Code AND a.Promoter_ID=b.Representative_ID )  Where a.Company_Code=1 And User_ID=000001
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 1.111000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name from PI_User_App a  Left Outer Join MP_Representative b ON (a.Company_Code=b.Company_Code AND a.Promoter_ID=b.Representative_ID )  Where a.Company_Code=1 And User_ID=000001
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=474 3.482000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795432 db=RMS rows=474 0.353000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795467 db=RMS rows=1 0.091000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code, a.Company_Name, CASE WHEN c.User_ID is null THEN 'False' ELSE 'True' END AS Def_Company, a.SQL_Server_Workstation,a.Use_Diff_Connection,a.Remote_Company_Code  From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) Left Outer join PI_Users c ON (a.Company_Code=c.Def_Company_Code AND c.User_ID=1)  Order By a.Area,a.Zone,a.Ordering,a.ACC_Company_Code
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 8.356000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code, a.Company_Name, CASE WHEN c.User_ID is null THEN 'False' ELSE 'True' END AS Def_Company, a.SQL_Server_Workstation,a.Use_Diff_Connection,a.Remote_Company_Code  From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) Left Outer join PI_Users c ON (a.Company_Code=c.Def_Company_Code AND c.User_ID=1)  Order By a.Area,a.Zone,a.Ordering,a.ACC_Company_Code
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 5.225000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code,a.Location_Code, a.Name, CASE WHEN b.Def_Location='Y' THEN 'True' ELSE 'False' END AS Def_Location,CASE WHEN b.Show_Cost='Y' THEN 'True' ELSE 'False' END AS Show_Cost , CASE WHEN b.Notify_Packing='Y' THEN 'True' ELSE 'False' END as Notify_Packing , CASE WHEN b.Notify_Packing_Complete='Y' THEN 'True' ELSE 'False' END as Notify_Packing_Complete ,  CASE WHEN b.Notify_Delivery='Y' THEN 'True' ELSE 'False' END as Notify_Delivery,  CASE WHEN b.Notify_Delivery_Complete='Y' THEN 'True' ELSE 'False' END as Notify_Delivery_Complete ,  CASE WHEN b.DT_Ordering='Y' THEN 'True' ELSE 'False' END as DT_Ordering,  CASE WHEN b.DT_Edit_Price='Y' THEN 'True' ELSE 'False' END as DT_Edit_Price ,  CASE WHEN b.AD_DL_Allow='Y' THEN 'True' ELSE 'False' END as AD_DL_Allow, b.AD_DL_Location, b.AD_DL_Code  From PI_Company_Location a Left Outer Join PI_User_Company_Access_Location b ON (a.Company_Code=b.Company_Code And a.Location_Code=b.Location_Code And b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795505 db=RMS rows=1 0.137000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code,a.Location_Code, a.Name, CASE WHEN b.Def_Location='Y' THEN 'True' ELSE 'False' END AS Def_Location,CASE WHEN b.Show_Cost='Y' THEN 'True' ELSE 'False' END AS Show_Cost , CASE WHEN b.Notify_Packing='Y' THEN 'True' ELSE 'False' END as Notify_Packing , CASE WHEN b.Notify_Packing_Complete='Y' THEN 'True' ELSE 'False' END as Notify_Packing_Complete ,  CASE WHEN b.Notify_Delivery='Y' THEN 'True' ELSE 'False' END as Notify_Delivery,  CASE WHEN b.Notify_Delivery_Complete='Y' THEN 'True' ELSE 'False' END as Notify_Delivery_Complete ,  CASE WHEN b.DT_Ordering='Y' THEN 'True' ELSE 'False' END as DT_Ordering,  CASE WHEN b.DT_Edit_Price='Y' THEN 'True' ELSE 'False' END as DT_Edit_Price ,  CASE WHEN b.AD_DL_Allow='Y' THEN 'True' ELSE 'False' END as AD_DL_Allow, b.AD_DL_Location, b.AD_DL_Code  From PI_Company_Location a Left Outer Join PI_User_Company_Access_Location b ON (a.Company_Code=b.Company_Code And a.Location_Code=b.Location_Code And b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:04] spid=60 tran=16795517 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID Is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code,a.Price_Type, a.Description as Name, Cast(ISNULL(Read_Only,'False') as bit) as Read_Only From MP_Customer_Price_Type a Left Outer Join PI_User_MP_Price_Access b ON (a.Company_Code=b.Company_Code AND a.Price_Type=b.Price_Type AND b.User_ID=1)
GO

-- [08/11/2026 11:32:04] spid=60 tran=0 db=RMS rows=1 1.163000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID Is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code,a.Price_Type, a.Description as Name, Cast(ISNULL(Read_Only,'False') as bit) as Read_Only From MP_Customer_Price_Type a Left Outer Join PI_User_MP_Price_Access b ON (a.Company_Code=b.Company_Code AND a.Price_Type=b.Price_Type AND b.User_ID=1)
GO

-- [08/11/2026 11:32:17] spid=60 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 34.084000ms  app=.Net SqlClient Data Provider
UPDATE PI_Users SET Login_Name = 'IMS', Full_Name = 'IMS', Password = '1234',Show_Cost = 'N', Status = 'A', LastModifiedBy = 1, Designation='ADM', Email='ims@gmail.com', Email_Footer='', ACC_User_ID=1, Role_ID=1,Location='FST', LastWriteTimeStamp = GETDATE(), Show_Uom = 'Y', Instalment_Lookup = 'N', Show_Plu = 'Y',Allow_Custom_Report = 'N',Allow_Structure_Enquiry = 'N', Show_PriceType = 'Y', Show_PurQuote = 'Y', Show_PurOrder = 'Y', Show_PurDelivery = 'Y', Show_PurInvoice = 'Y', Show_TrdQuote = 'Y', Show_TrdDelivery = 'Y', Show_TrdInvoice = 'Y', Show_PosSales = 'Y', Show_Substitute = 'Y', Show_Matrix = 'Y', Show_Adjustment = 'Y', Show_InOut = 'Y', Show_Qty = 'Y', Show_Customer_Price = 'Y', Show_Warranty = 'N', Show_Service = 'N', Skip_Item_Authorization = 'Y', Sku_Auto_Search='Y',Member_Auto_Search = 'Y', Auto_Search='Y', Def_Company_Code=1, Shared_Access_Right='N',Show_PurRequest='Y', Show_TrdOrder='Y', Show_SerialNo='Y', Show_BatchExp='Y', Change_Item_factor='Y', Change_Item_Price='Y', Pr_Approver= 0, Mp_Approver= 0, Qty_Adj_Approver= 0, Cost_Adj_Approver= 0,Show_Select_Item='Y',Allow_Access_CMS='N', Show_Command_Center='Y', Show_Article='Y', Show_Multi_Branch='Y', Change_Item_Desc='Y', Change_Member_Name = 'Y', Plu_Auto_Search = 'N', Allow_Remote_pulling = 'Y',Allow_Remote_Pull_Promo='Y', Show_stock_History = 'Y', Show_Price_History = 'Y', Show_MPrice_History = 'Y', Allow_Trd_BelowCost = 'Y', Allow_Remote_Push_Doc = 'N', Allow_Remote_Push_MPItem = 'N', IR_Approver = 0, Allow_Change_Barcode_PRice = 'N', Load_Serial = 'N', Serial_Late_Validation = 'N', Allow_Status='N', Allow_Open_Price='N', Allow_Qty_With_Decimal='N', Allow_Inventory_Item='N', Allow_Zero_Price='N', Allow_Discountable='N',Allow_Serial_No='N', Allow_Expiry='N', Allow_Give_Point='N', Allow_Give_Rebate='N', Allow_Issue_No='N', Allow_Batch_Expiry='N', Allow_Return_Due='N', Allow_Open_Code='N', Article_Auto_Search='N', Skulookup_MultiPrice='Y', Skulookup_SerialNo='N', Skulookup_BatchExpiry='N', Skulookup_StkReorder='N', Skulookup_ShowImage='N', Skulookup_NewSku='Y', Skulookup_PurchaseAnalysis='N', Skulookup_Access='Y', Memberlookup_Access='N', Memberlookup_Supplement='N', Memberlookup_Redeem='N', Memberlookup_Renewal='N', Memberlookup_Adjustment='N', Memberlookup_Pos='N', Memberlookup_InOut='N',Member_lookup_Show_Topup='N', Allow_Trading_Price_Change='N',Allow_Edit_GST_Code='N', Allow_Edit_PI_GST_Code='Y', Allow_Edit_PI_Tax='Y', Allow_Edit_SI_GST_Code='Y', Allow_Edit_SI_Tax='Y', Allow_Edit_AD_GST_Code='Y', Allow_Edit_AD_Tax='Y', Allow_Edit_Stock_Budget='N', Allow_Edit_Non_Buy='N', User_Loc_Batch_Access='', My_Cart_Type_List='', Invoice_Type_list='' , Allow_Edit_Tax='N', Allow_Edit_New_Cost='N', Edit_Doc_Web_Status='N', Allow_Set_Structure_Inclusive_GST='Y',Check_User_Vendor='N',Check_Sku_Authorization='N',Check_Item_Listing_Fees='N' ,Allow_Edit_Standard_Cost='N', PR_Allow_Chg_Qty='N', PR_Allow_Chg_Price='N', PR_Allow_Chg_Disc='N', PR_Allow_Selective_Item='N',Memberlookup_PointExpiry='N', Allow_Edit_IMaster_GST_Code='N', Allow_Edit_Structure='Y', Allow_Edit_Brand='Y', Allow_Edit_Stock_Type='Y', Allow_Edit_Commission='Y', Not_Allow_Update_SI='N',Not_Allow_Delete_SI='N',Set_SI_As_Sales_Date='N' ,SI_Access_Audit_Lookup='N',SI_Access_Prompt_Pwd='N',SI_Allow_Minus_Qty='N',SI_Allow_FOC='Y',Allow_SI_RV_Payment='N',Allow_Save_Overdue_SI='N', Allow_Edit_SI_Declaration='N', SI_Payment_Mode='N', BOM_Ctrl_Entry='N', PSD_Allow_Edit_After_Print='N', Allow_Print_SI_Declaration='N',SI_Show_Last_PI='N',SL_Status='0', Memberlookup_RemotePullMember='N', Memberlookup_Offline='N', Show_OpenClose='N', Change_Last_COst='N', Change_fifo_Cost='N', Change_Average_Cost='N', Allow_Change_Mark_Amount = 'N', Allow_Edit_Posted_PK = 'N', Allow_Change_PK_Unit_Price = 'N', Auto_Cal_PK_Header_Amount = 'Y', Show_PI_Cost = 'N', Show_SI_Cost = 'N', Show_AD_Cost = 'N', Show_PK_Cost = 'N', Show_ST_Cost = 'N', Show_IR_Cost = 'N', NA_Allow_Read = 'N', NA_Allow_Write = 'N', NA_Allow_Update = 'N', NA_Allow_Delete = 'N', NA_Allow_Others = 'N', Pr_Approver2 = 0, Pr_Approver3 = 0, Pr_Approver4 = 0, Pr_Approver5 = 0, Pr_Approver6 = 0, Mp_Approver2 = 0, Mp_Approver3 = 0, Mp_Approver4 = 0, Mp_Approver5 = 0, Mp_Approver6 = 0, Qty_Adj_Approver2 = 0, Qty_Adj_Approver3 = 0, Qty_Adj_Approver4 = 0, Qty_Adj_Approver5 = 0, Qty_Adj_Approver6 = 0, Ir_Approver2 = 0, Ir_Approver3 = 0, Ir_Approver4 = 0, Ir_Approver5 = 0, Ir_Approver6 = 0, Allow_LogiN_PSS = 'N', Change_Posted_PI_Header = 'N', Change_Posted_SI_Header = 'N', Edit_Posted_Header_SI = 'N', Edit_Posted_Header_PI = 'N', Edit_Posted_Header_AD = 'N', Edit_InOut_Cost = 'N', Allow_Day_End = 'Y', Allow_Pos_Simulate = 'Y', Sku_Auto_Search_Length = 4, Plu_Auto_Search_Length = 0, Member_Auto_Search_Length = 0, Article_Auto_Search_Length = 0, Serial_Auto_Search = 'N', Batch_Auto_Search = 'N', Serial_Auto_Search_Length = 0, Batch_Auto_Search_Length = 0, Doc_Auto_Search = 'N', Doc_Auto_Search_Length = 0, PR_Allow_Download_PR_Only = 'N', PR_View_Total_Day = 0, JO_Total_Print = 0, Multi_SI_Format = '', Multi_AD_Format = '', Multi_PR_Format = '', Multi_Cart_Format = '', PR_Report_Format = '', PO_Report_Format = '', PriceChecker_Admin = 'Y', Allow_In_Non_Cost = 'N', EI_Allow_Entry='N', EI_Allow_Submit='N', EI_Allow_Reverse='N', EI_Allow_Delete='N', EI_Allow_Edit_AF_Submit='N',Allow_In_Non_Qty = 'N', Allow_IssueItem_BelowQty = 'Y', Show_My_List = 'N', Lookup_Item_Authorization = 'N', Allow_Zero_Cost = 'Y' ,IMS_PR='N',IMS_PO='N',IMS_PD='N',IMS_PI='N',IMS_SQ='N',IMS_SO='N',IMS_SD='N',IMS_SI='N',IMS_AD='N',IMS_IN_PC='N',IMS_IN_PCMulti='N',IMS_IN_Performance='N',IMS_RP='N',IMS_RO='N',IMS_PL='N', IMS_Scan_Show_SI='N',IMS_Scan_Show_AD='N', IMS_Cart_Packing='N', IMS_Cart_Delivery='N', IMS_Cart_Allow_Cancel='N', IMS_Cart_Allow_Edit='N', IMS_Cart_Allow_Del_Item='N', IMS_Cart_Allow_Add_More_Qty='N', IMS_Cart_New_Order_Notify='N',Change_Posted_AD_Header = 'N', Allow_Cancel_PostDoc = 'Y', Send_SMS = 'N', SMS_Phone1 = '', SMS_Phone2 = '', SMS_Phone3 = '', Def_Login_POS_DB = '', Deduct_POS_Test_Qty = 'N', Default_Entry_By_Plu = 'N', PR_Entry_By_Plu_Only = 'N', Default_Sales_Rep = 0, Not_Allow_Add_Plu_FactorNot1 = 'N', Not_Allow_Add_New_item = 'N', Allow_Edit_SQ_Date = 'Y', Allow_Edit_SI_Date = 'Y', MP_ExceedCredit_AllowSave = 'Y', MP_ExceedCredit_AllowPrint = 'Y', Show_Fifo = 'N', Allow_Reset_Qty = 'N', Allow_Remote_Pull_Exclude_Qty = 'N', Allow_Change_AD_Status = 'N', Check_User_AD_Code = 'N', Allow_Reverse_AutoAdjust = 'N', Lookup_Instalment = 'N', Allow_Show_Select_Discount = 'N', Show_Doc_DiscByRate = 'N', Login_WMS = 'N',WMS_Access_Item_Master = 'N',WMS_Access_Member = 'N',WMS_Add_Item = 'N',WMS_Update_Item = 'N',WMS_Add_Plu = 'N',WMS_Update_Price_Type = 'N',WMS_Show_Cost = 'N',WMS_Change_Loc_Cost = 'N',WMS_Show_Price = 'N',WMS_Add_Member = 'N',WMS_Update_Member = 'N', New_Remote_Pull_Doc='N', New_Remote_Push_Doc='N', Default_Branch =0, MP_Allow_Alternate_Desc ='N', Lookup_Default_LastEntry = 'N', Lookup_HIde_PI_Cost = 'N', Allow_Remote_Sync_Stock='N', Change_Member_MLU = 'N', Allow_Device_Sync = 'N', Allow_Record_name='N', Allow_Check_Quota='N'  ,Allow_Web_Item='N',Allow_Use_Budget='N',Allow_By_Weight='N',Allow_Non_Buy='N',Allow_By_Count='N',Allow_Print_Date='N',Online_Sales_Hide_Cost='N' ,Show_IMReference_AD='N',Show_IMReference_SI='N',Show_IMReference_PI='N',IMS2_Allow_Login='N',IMS2_Form_Single_Sku='N',IMS2_Form_Multi_Sku='N',IMS2_Form_Member_Pulling='N',IMS2_SkuLookup='N',IMS2_View_Costing='N',IMS2_TabUom='N',IMS2_TabQty='N',IMS2_TabInOut='N',IMS2_TabPI='N',IMS2_TabSI='N',IMS2_TabAD='N',IMS2_TabPOS='N',Allow_Edit_Posted_Service_Job = 'N',Memor_AllowLogin = 'Y' ,Memor_Format = '' ,Memor_Show1 = 'N' ,Memor_Show2 = 'N' ,Memor_Show3 = 'N' ,Memor_Show4 = 'N' ,Memor_Show5 = 'N' ,CC_Show_Qty = 'N' ,CC_Show_Amount = 'N' ,Memor_ShowCost = 'Y' ,Memor_ShowCPS = 'Y' ,Memor_ShowPIInfo = 'Y' ,Memor_ShowPromoPeriod = 'N' ,Memor_ShowQty = 'Y' ,Memor_ShowRef = 'Y' ,Memor_ShowRefText = 'Y' ,Memor_ShowStructure = 'Y' ,Show_Stock_Qty='Y',Allow_Edit_Posted_Closing_Qty='N',App_CheckA1='N', App_CheckA2='N', App_CheckA3='N', App_CheckA4='N', App_CheckA5='N' ,App_CheckB1='N', App_CheckB2='N', App_CheckB3='N', App_CheckB4='N', App_CheckB5='N' ,App_CheckC1='N', App_CheckC2='N', App_CheckC3='N', App_CheckC4='N', App_CheckC5='N' ,App_CheckD1='N', App_CheckD2='N', App_CheckD3='N', App_CheckD4='N', App_CheckD5='N' ,App_CheckE1='N', App_CheckE2='N', App_CheckE3='N', App_CheckE4='N', App_CheckE5='N' ,App_CheckF1='N', App_CheckF2='N', App_CheckF3='N', App_CheckF4='N', App_CheckF5='N' ,App_CheckG1='N', App_CheckG2='N', App_CheckG3='N', App_CheckG4='N', App_CheckG5='N' ,App_CheckH1='N', App_CheckH2='N', App_CheckH3='N', App_CheckH4='N', App_CheckH5='N' ,App_CheckI1='N', App_CheckI2='N', App_CheckI3='N', App_CheckI4='N', App_CheckI5='N' ,Multi_Price_Upd_Max_Item = 0, SkuLookup_Rebate = 'N' ,Allow_Cancel_Cart = 'Y',Allow_login_Production = 'Y',Allow_Login_Delivery = 'Y',Production_Line = '', Allow_Edit_Non_Local_Entry = 'N', Allow_Exceed_Stock_Budget = 'N' , Auto_Search_Sku_Code = '', Auto_Search_Plu_Code = '', SI_Use_Basic_Uom = 'N', PI_Use_Basic_Uom = 'N', PI_Hide_Cost = 'N', AD_Hide_Cost = 'N', AD_Use_Basic_Uom = 'N', Allow_UnPost_Item = 'N', Allow_Set_GST_Company_Setting = 'Y', Allow_Structure_Budget_Over_Limit = 'N', Allow_Edit_Posted_Rebate = 'N', SL_Allow_Delete='N', SL_Allow_Reverse='N' , Lock_Timer=0, SL_Age_Alert=0, SI_Price_Checking=0, Hide_Selling_Price='N', PI_Image_Require=0, AD_Image_Require=0, SI_Image_Require=0, SD_Image_Require=0, MDI_Mode=1, Max_Disc_Level=0, rpt_zoom=100, Allow_Batch_Expiry_Over_Qty='N', MS_Adj_Allow_Add_Point = 'Y', MS_Adj_Allow_Minus_Point = 'Y' , Allow_Edit_Expired_Doc = 'N', Allow_Create_Web_Member = 'N', Allow_Update_Web_Member = 'N', Edit_Member_New_Ic = 'Y', Edit_MS_Alternate_Limit = 'Y', Allow_Edit_Branch = 'N', App_Allow_Login = 'N', App_Allow_PriceCheck = 'N', App_Allow_Stock_Take = 'N', App_Allow_Upload_Image = 'N', App_Allow_PI = 'N', App_Allow_SI = 'N'  ,Cart_Allow_Search='N',Cart_Allow_Approve='N',Cart_Allow_Set_To_Ready='N',Cart_Allow_Cancel_Pending='N',Cart_Allow_Set_To_Deliver='N',Cart_Allow_Set_To_Collect='N',Cart_Allow_Preview_Invoice='N',Lookup_Hide_Vendor='N',Lookup_Hide_Customer='N',Cart_Allow_Verify_Payment='N',PO_DL_Full_Access='N', Allow_Overwrite_Pick_No='N', Cart_Allow_Return_Request='N', Cart_Allow_Generate_EVoucher='N', Cart_Allow_Generate_Discount_Voucher='N', Cart_Allow_Edit_Voucher='N', Cart_Allow_Send_SMS='N', Cart_Allow_Send_WhatsApp='N', Cart_Allow_Send_Push_Notification='N', Cart_Allow_Cancel_Voucher='N' ,EI_Submit_AD='N',EI_Submit_Consolidate='N',EI_Submit_MR='N',EI_Submit_Multiple='N',EI_Submit_PI='N',EI_Submit_POL='N',EI_Submit_POS='N',EI_Submit_SI='N',EI_Submit_Single='N',EI_Submit_Rebate='N',EI_Allow_Submit_Any_Date='N' WHERE user_id = 1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.244000ms  app=.Net SqlClient Data Provider
UPDATE PI_Users SET Login_Name = 'IMS', Full_Name = 'IMS', Password = '1234',Show_Cost = 'N', Status = 'A', LastModifiedBy = 1, Designation='ADM', Email='ims@gmail.com', Email_Footer='', ACC_User_ID=1, Role_ID=1,Location='FST', LastWriteTimeStamp = GETDATE(), Show_Uom = 'Y', Instalment_Lookup = 'N', Show_Plu = 'Y',Allow_Custom_Report = 'N',Allow_Structure_Enquiry = 'N', Show_PriceType = 'Y', Show_PurQuote = 'Y', Show_PurOrder = 'Y', Show_PurDelivery = 'Y', Show_PurInvoice = 'Y', Show_TrdQuote = 'Y', Show_TrdDelivery = 'Y', Show_TrdInvoice = 'Y', Show_PosSales = 'Y', Show_Substitute = 'Y', Show_Matrix = 'Y', Show_Adjustment = 'Y', Show_InOut = 'Y', Show_Qty = 'Y', Show_Customer_Price = 'Y', Show_Warranty = 'N', Show_Service = 'N', Skip_Item_Authorization = 'Y', Sku_Auto_Search='Y',Member_Auto_Search = 'Y', Auto_Search='Y', Def_Company_Code=1, Shared_Access_Right='N',Show_PurRequest='Y', Show_TrdOrder='Y', Show_SerialNo='Y', Show_BatchExp='Y', Change_Item_factor='Y', Change_Item_Price='Y', Pr_Approver= 0, Mp_Approver= 0, Qty_Adj_Approver= 0, Cost_Adj_Approver= 0,Show_Select_Item='Y',Allow_Access_CMS='N', Show_Command_Center='Y', Show_Article='Y', Show_Multi_Branch='Y', Change_Item_Desc='Y', Change_Member_Name = 'Y', Plu_Auto_Search = 'N', Allow_Remote_pulling = 'Y',Allow_Remote_Pull_Promo='Y', Show_stock_History = 'Y', Show_Price_History = 'Y', Show_MPrice_History = 'Y', Allow_Trd_BelowCost = 'Y', Allow_Remote_Push_Doc = 'N', Allow_Remote_Push_MPItem = 'N', IR_Approver = 0, Allow_Change_Barcode_PRice = 'N', Load_Serial = 'N', Serial_Late_Validation = 'N', Allow_Status='N', Allow_Open_Price='N', Allow_Qty_With_Decimal='N', Allow_Inventory_Item='N', Allow_Zero_Price='N', Allow_Discountable='N',Allow_Serial_No='N', Allow_Expiry='N', Allow_Give_Point='N', Allow_Give_Rebate='N', Allow_Issue_No='N', Allow_Batch_Expiry='N', Allow_Return_Due='N', Allow_Open_Code='N', Article_Auto_Search='N', Skulookup_MultiPrice='Y', Skulookup_SerialNo='N', Skulookup_BatchExpiry='N', Skulookup_StkReorder='N', Skulookup_ShowImage='N', Skulookup_NewSku='Y', Skulookup_PurchaseAnalysis='N', Skulookup_Access='Y', Memberlookup_Access='N', Memberlookup_Supplement='N', Memberlookup_Redeem='N', Memberlookup_Renewal='N', Memberlookup_Adjustment='N', Memberlookup_Pos='N', Memberlookup_InOut='N',Member_lookup_Show_Topup='N', Allow_Trading_Price_Change='N',Allow_Edit_GST_Code='N', Allow_Edit_PI_GST_Code='Y', Allow_Edit_PI_Tax='Y', Allow_Edit_SI_GST_Code='Y', Allow_Edit_SI_Tax='Y', Allow_Edit_AD_GST_Code='Y', Allow_Edit_AD_Tax='Y', Allow_Edit_Stock_Budget='N', Allow_Edit_Non_Buy='N', User_Loc_Batch_Access='', My_Cart_Type_List='', Invoice_Type_list='' , Allow_Edit_Tax='N', Allow_Edit_New_Cost='N', Edit_Doc_Web_Status='N', Allow_Set_Structure_Inclusive_GST='Y',Check_User_Vendor='N',Check_Sku_Authorization='N',Check_Item_Listing_Fees='N' ,Allow_Edit_Standard_Cost='N', PR_Allow_Chg_Qty='N', PR_Allow_Chg_Price='N', PR_Allow_Chg_Disc='N', PR_Allow_Selective_Item='N',Memberlookup_PointExpiry='N', Allow_Edit_IMaster_GST_Code='N', Allow_Edit_Structure='Y', Allow_Edit_Brand='Y', Allow_Edit_Stock_Type='Y', Allow_Edit_Commission='Y', Not_Allow_Update_SI='N',Not_Allow_Delete_SI='N',Set_SI_As_Sales_Date='N' ,SI_Access_Audit_Lookup='N',SI_Access_Prompt_Pwd='N',SI_Allow_Minus_Qty='N',SI_Allow_FOC='Y',Allow_SI_RV_Payment='N',Allow_Save_Overdue_SI='N', Allow_Edit_SI_Declaration='N', SI_Payment_Mode='N', BOM_Ctrl_Entry='N', PSD_Allow_Edit_After_Print='N', Allow_Print_SI_Declaration='N',SI_Show_Last_PI='N',SL_Status='0', Memberlookup_RemotePullMember='N', Memberlookup_Offline='N', Show_OpenClose='N', Change_Last_COst='N', Change_fifo_Cost='N', Change_Average_Cost='N', Allow_Change_Mark_Amount = 'N', Allow_Edit_Posted_PK = 'N', Allow_Change_PK_Unit_Price = 'N', Auto_Cal_PK_Header_Amount = 'Y', Show_PI_Cost = 'N', Show_SI_Cost = 'N', Show_AD_Cost = 'N', Show_PK_Cost = 'N', Show_ST_Cost = 'N', Show_IR_Cost = 'N', NA_Allow_Read = 'N', NA_Allow_Write = 'N', NA_Allow_Update = 'N', NA_Allow_Delete = 'N', NA_Allow_Others = 'N', Pr_Approver2 = 0, Pr_Approver3 = 0, Pr_Approver4 = 0, Pr_Approver5 = 0, Pr_Approver6 = 0, Mp_Approver2 = 0, Mp_Approver3 = 0, Mp_Approver4 = 0, Mp_Approver5 = 0, Mp_Approver6 = 0, Qty_Adj_Approver2 = 0, Qty_Adj_Approver3 = 0, Qty_Adj_Approver4 = 0, Qty_Adj_Approver5 = 0, Qty_Adj_Approver6 = 0, Ir_Approver2 = 0, Ir_Approver3 = 0, Ir_Approver4 = 0, Ir_Approver5 = 0, Ir_Approver6 = 0, Allow_LogiN_PSS = 'N', Change_Posted_PI_Header = 'N', Change_Posted_SI_Header = 'N', Edit_Posted_Header_SI = 'N', Edit_Posted_Header_PI = 'N', Edit_Posted_Header_AD = 'N', Edit_InOut_Cost = 'N', Allow_Day_End = 'Y', Allow_Pos_Simulate = 'Y', Sku_Auto_Search_Length = 4, Plu_Auto_Search_Length = 0, Member_Auto_Search_Length = 0, Article_Auto_Search_Length = 0, Serial_Auto_Search = 'N', Batch_Auto_Search = 'N', Serial_Auto_Search_Length = 0, Batch_Auto_Search_Length = 0, Doc_Auto_Search = 'N', Doc_Auto_Search_Length = 0, PR_Allow_Download_PR_Only = 'N', PR_View_Total_Day = 0, JO_Total_Print = 0, Multi_SI_Format = '', Multi_AD_Format = '', Multi_PR_Format = '', Multi_Cart_Format = '', PR_Report_Format = '', PO_Report_Format = '', PriceChecker_Admin = 'Y', Allow_In_Non_Cost = 'N', EI_Allow_Entry='N', EI_Allow_Submit='N', EI_Allow_Reverse='N', EI_Allow_Delete='N', EI_Allow_Edit_AF_Submit='N',Allow_In_Non_Qty = 'N', Allow_IssueItem_BelowQty = 'Y', Show_My_List = 'N', Lookup_Item_Authorization = 'N', Allow_Zero_Cost = 'Y' ,IMS_PR='N',IMS_PO='N',IMS_PD='N',IMS_PI='N',IMS_SQ='N',IMS_SO='N',IMS_SD='N',IMS_SI='N',IMS_AD='N',IMS_IN_PC='N',IMS_IN_PCMulti='N',IMS_IN_Performance='N',IMS_RP='N',IMS_RO='N',IMS_PL='N', IMS_Scan_Show_SI='N',IMS_Scan_Show_AD='N', IMS_Cart_Packing='N', IMS_Cart_Delivery='N', IMS_Cart_Allow_Cancel='N', IMS_Cart_Allow_Edit='N', IMS_Cart_Allow_Del_Item='N', IMS_Cart_Allow_Add_More_Qty='N', IMS_Cart_New_Order_Notify='N',Change_Posted_AD_Header = 'N', Allow_Cancel_PostDoc = 'Y', Send_SMS = 'N', SMS_Phone1 = '', SMS_Phone2 = '', SMS_Phone3 = '', Def_Login_POS_DB = '', Deduct_POS_Test_Qty = 'N', Default_Entry_By_Plu = 'N', PR_Entry_By_Plu_Only = 'N', Default_Sales_Rep = 0, Not_Allow_Add_Plu_FactorNot1 = 'N', Not_Allow_Add_New_item = 'N', Allow_Edit_SQ_Date = 'Y', Allow_Edit_SI_Date = 'Y', MP_ExceedCredit_AllowSave = 'Y', MP_ExceedCredit_AllowPrint = 'Y', Show_Fifo = 'N', Allow_Reset_Qty = 'N', Allow_Remote_Pull_Exclude_Qty = 'N', Allow_Change_AD_Status = 'N', Check_User_AD_Code = 'N', Allow_Reverse_AutoAdjust = 'N', Lookup_Instalment = 'N', Allow_Show_Select_Discount = 'N', Show_Doc_DiscByRate = 'N', Login_WMS = 'N',WMS_Access_Item_Master = 'N',WMS_Access_Member = 'N',WMS_Add_Item = 'N',WMS_Update_Item = 'N',WMS_Add_Plu = 'N',WMS_Update_Price_Type = 'N',WMS_Show_Cost = 'N',WMS_Change_Loc_Cost = 'N',WMS_Show_Price = 'N',WMS_Add_Member = 'N',WMS_Update_Member = 'N', New_Remote_Pull_Doc='N', New_Remote_Push_Doc='N', Default_Branch =0, MP_Allow_Alternate_Desc ='N', Lookup_Default_LastEntry = 'N', Lookup_HIde_PI_Cost = 'N', Allow_Remote_Sync_Stock='N', Change_Member_MLU = 'N', Allow_Device_Sync = 'N', Allow_Record_name='N', Allow_Check_Quota='N'  ,Allow_Web_Item='N',Allow_Use_Budget='N',Allow_By_Weight='N',Allow_Non_Buy='N',Allow_By_Count='N',Allow_Print_Date='N',Online_Sales_Hide_Cost='N' ,Show_IMReference_AD='N',Show_IMReference_SI='N',Show_IMReference_PI='N',IMS2_Allow_Login='N',IMS2_Form_Single_Sku='N',IMS2_Form_Multi_Sku='N',IMS2_Form_Member_Pulling='N',IMS2_SkuLookup='N',IMS2_View_Costing='N',IMS2_TabUom='N',IMS2_TabQty='N',IMS2_TabInOut='N',IMS2_TabPI='N',IMS2_TabSI='N',IMS2_TabAD='N',IMS2_TabPOS='N',Allow_Edit_Posted_Service_Job = 'N',Memor_AllowLogin = 'Y' ,Memor_Format = '' ,Memor_Show1 = 'N' ,Memor_Show2 = 'N' ,Memor_Show3 = 'N' ,Memor_Show4 = 'N' ,Memor_Show5 = 'N' ,CC_Show_Qty = 'N' ,CC_Show_Amount = 'N' ,Memor_ShowCost = 'Y' ,Memor_ShowCPS = 'Y' ,Memor_ShowPIInfo = 'Y' ,Memor_ShowPromoPeriod = 'N' ,Memor_ShowQty = 'Y' ,Memor_ShowRef = 'Y' ,Memor_ShowRefText = 'Y' ,Memor_ShowStructure = 'Y' ,Show_Stock_Qty='Y',Allow_Edit_Posted_Closing_Qty='N',App_CheckA1='N', App_CheckA2='N', App_CheckA3='N', App_CheckA4='N', App_CheckA5='N' ,App_CheckB1='N', App_CheckB2='N', App_CheckB3='N', App_CheckB4='N', App_CheckB5='N' ,App_CheckC1='N', App_CheckC2='N', App_CheckC3='N', App_CheckC4='N', App_CheckC5='N' ,App_CheckD1='N', App_CheckD2='N', App_CheckD3='N', App_CheckD4='N', App_CheckD5='N' ,App_CheckE1='N', App_CheckE2='N', App_CheckE3='N', App_CheckE4='N', App_CheckE5='N' ,App_CheckF1='N', App_CheckF2='N', App_CheckF3='N', App_CheckF4='N', App_CheckF5='N' ,App_CheckG1='N', App_CheckG2='N', App_CheckG3='N', App_CheckG4='N', App_CheckG5='N' ,App_CheckH1='N', App_CheckH2='N', App_CheckH3='N', App_CheckH4='N', App_CheckH5='N' ,App_CheckI1='N', App_CheckI2='N', App_CheckI3='N', App_CheckI4='N', App_CheckI5='N' ,Multi_Price_Upd_Max_Item = 0, SkuLookup_Rebate = 'N' ,Allow_Cancel_Cart = 'Y',Allow_login_Production = 'Y',Allow_Login_Delivery = 'Y',Production_Line = '', Allow_Edit_Non_Local_Entry = 'N', Allow_Exceed_Stock_Budget = 'N' , Auto_Search_Sku_Code = '', Auto_Search_Plu_Code = '', SI_Use_Basic_Uom = 'N', PI_Use_Basic_Uom = 'N', PI_Hide_Cost = 'N', AD_Hide_Cost = 'N', AD_Use_Basic_Uom = 'N', Allow_UnPost_Item = 'N', Allow_Set_GST_Company_Setting = 'Y', Allow_Structure_Budget_Over_Limit = 'N', Allow_Edit_Posted_Rebate = 'N', SL_Allow_Delete='N', SL_Allow_Reverse='N' , Lock_Timer=0, SL_Age_Alert=0, SI_Price_Checking=0, Hide_Selling_Price='N', PI_Image_Require=0, AD_Image_Require=0, SI_Image_Require=0, SD_Image_Require=0, MDI_Mode=1, Max_Disc_Level=0, rpt_zoom=100, Allow_Batch_Expiry_Over_Qty='N', MS_Adj_Allow_Add_Point = 'Y', MS_Adj_Allow_Minus_Point = 'Y' , Allow_Edit_Expired_Doc = 'N', Allow_Create_Web_Member = 'N', Allow_Update_Web_Member = 'N', Edit_Member_New_Ic = 'Y', Edit_MS_Alternate_Limit = 'Y', Allow_Edit_Branch = 'N', App_Allow_Login = 'N', App_Allow_PriceCheck = 'N', App_Allow_Stock_Take = 'N', App_Allow_Upload_Image = 'N', App_Allow_PI = 'N', App_Allow_SI = 'N'  ,Cart_Allow_Search='N',Cart_Allow_Approve='N',Cart_Allow_Set_To_Ready='N',Cart_Allow_Cancel_Pending='N',Cart_Allow_Set_To_Deliver='N',Cart_Allow_Set_To_Collect='N',Cart_Allow_Preview_Invoice='N',Lookup_Hide_Vendor='N',Lookup_Hide_Customer='N',Cart_Allow_Verify_Payment='N',PO_DL_Full_Access='N', Allow_Overwrite_Pick_No='N', Cart_Allow_Return_Request='N', Cart_Allow_Generate_EVoucher='N', Cart_Allow_Generate_Discount_Voucher='N', Cart_Allow_Edit_Voucher='N', Cart_Allow_Send_SMS='N', Cart_Allow_Send_WhatsApp='N', Cart_Allow_Send_Push_Notification='N', Cart_Allow_Cancel_Voucher='N' ,EI_Submit_AD='N',EI_Submit_Consolidate='N',EI_Submit_MR='N',EI_Submit_Multiple='N',EI_Submit_PI='N',EI_Submit_POL='N',EI_Submit_POS='N',EI_Submit_SI='N',EI_Submit_Single='N',EI_Submit_Rebate='N',EI_Allow_Submit_Any_Date='N' WHERE user_id = 1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
UPDATE PI_Users SET Allow_Cancel_ActiveDoc = 'Y', Allow_Delete_Member_Profile = 'N',Check_User_AdjustCode = 'N' WHERE user_id = 1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 2.524000ms  app=.Net SqlClient Data Provider
UPDATE PI_Users SET Allow_Cancel_ActiveDoc = 'Y', Allow_Delete_Member_Profile = 'N',Check_User_AdjustCode = 'N' WHERE user_id = 1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=474 1.614000ms  app=.Net SqlClient Data Provider
DELETE PI_User_Permission WHERE user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=474 0.377000ms  app=.Net SqlClient Data Provider
DELETE PI_User_Permission WHERE user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.020000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_ACCESS_LOCAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QUOTA_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Batch','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.581000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Batch','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.072000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_ACCESS_LOCAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.085000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QUOTA_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_ITEMBYFIELD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Posting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Entry','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_ITEMMASTER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.054000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_EVENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.081000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Prelabel','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_EVENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Entry','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Prelabel','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.021000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_ITEMMASTER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IS_ITEMBYFIELD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VL_Posting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_HOLIDAY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER_USE_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PROMOTION_PWQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_BATCH_EXPIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_PWF','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER_USE_AT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_PRINTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_CUSTOM_REPORT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_CUSTOM_REPORT_MT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_PWQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_SERIAL_NO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_MEMOR_CAL_LICENSE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.187000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER_USE_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_PRINTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_PWF','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_PWQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VOUCHER_USE_AT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_SERIAL_NO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_CUSTOM_REPORT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_MEMOR_CAL_LICENSE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_CUSTOM_REPORT_MT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_HOLIDAY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_BATCH_EXPIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.069000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PROMOTION_PWQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.216000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_NOTE_ATTACHMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_ADJ_POST_TO_ACCOUNTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_ITEM_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_REQUISITION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_REQUISITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.052000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.060000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_ITEM_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_NOTE_ATTACHMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_REQUISITION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_REQUISITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_ADJ_POST_TO_ACCOUNTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_POST','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SALES_ORDER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_POST_TO_ACC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.161000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_POST','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.169000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.195000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION_APPROVAL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_POST_TO_ACC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SALES_ORDER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.167000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PIPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PR','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PRApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_POST_TO_ACCOUNT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PI','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_AD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_AD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PI','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PR','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PIPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_ADApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PRApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_POST_TO_ACCOUNT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_TOPPING_MENU','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_CF_TOPPING_MENU_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SI','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SIPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SQApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PIAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SIAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_ADJ_AFTER_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.158000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_CF_TOPPING_MENU_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.164000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_TOPPING_MENU','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SI','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SIAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SIPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SQApproval','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_ADJ_AFTER_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_PIAccPosting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_REMOTE_SO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_CLOSING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_COMPOSITE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_TRANSFER_OUT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SKU_SUB','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DATA_TRANSFER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_SEND_MAIL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_BARCODE_SYNC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_POS_CONSOLIDATE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DATA_COMPARER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TASK','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DB_ANALYZER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_HOUSE_KEEPING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_TRANSFER_IN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_SEND_FAX','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TASK_SCHEDULE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_SEND_FAX','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_TRANSFER_IN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SKU_SUB','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_SEND_MAIL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_CLOSING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_COMPOSITE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_TRANSFER_OUT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_BARCODE_SYNC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DATA_TRANSFER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_POS_CONSOLIDATE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TASK','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DB_ANALYZER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_HOUSE_KEEPING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DATA_COMPARER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TASK_SCHEDULE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICING_TAG','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTI_SKU','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_SV_SERVICE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_REGISTRATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_SV_SERVICE_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DT_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DT_LOOKUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_FNN_IMPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_BUDGET_GENERATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_POSPOSTTOACCLINKACCOUNTLOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_CLOSING_POSTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_SV_SERVICE_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DT_LOOKUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_BUDGET_GENERATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DT_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_FNN_IMPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_SV_SERVICE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_POSPOSTTOACCLINKACCOUNTLOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICING_TAG','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_ITEM_CLOSING_POSTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_REGISTRATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.048000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTI_SKU','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.173000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICING_TAG_LAYOUT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.283000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_AXIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_COMMISSION_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_PROFIT_SETTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_AUTOGENERATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LABEL_DESIGNER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_STRUCTURE_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_STRUCTURE_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.055000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_REMOVER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_STRUCTURE_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICING_TAG_LAYOUT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_REMOVER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.255000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_AXIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_COMMISSION_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LABEL_DESIGNER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_PROFIT_SETTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_STRUCTURE_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_CUSTOMER_DISCOUNT_AUTOGENERATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APP_SELECT_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APP_SELECT_STRUCTURE_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_DRCR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_PATTERN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EVENT_DEFINITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_AXIS_SETTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_SUMMARY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_CustomerItem','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_CustomerLabels','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_POST_TO_INVENTORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.188000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APP_SELECT_STRUCTURE_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_PATTERN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_SUMMARY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_CustomerItem','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_CustomerLabels','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APP_SELECT_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_POST_TO_INVENTORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_AXIS_SETTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MATRIX_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EVENT_DEFINITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_DRCR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.178000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Structure_MM_Member','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.189000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_LIVEUPDATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Structure_MM_POS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_POST_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CASH_COLLECTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STRUCTURE_PRINTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_LIVEUPDATE_STRUC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Structure_MM_Member','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_LIVEUPDATE_STRUC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SAVE_REBATE_POST_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CASH_COLLECTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Structure_MM_POS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STRUCTURE_PRINTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_LIVEUPDATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DAY_END','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ONLINE_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_AUTO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_RESET_QTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DAY_END_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_BATCH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_SHIP_TO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VENDOR_LISTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_ONLINE_STRUCTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_PAYMENT_BREAKDOWN_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT_BY_POS_PAYMENT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT_BY_CUSTOMER_PAYMENT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_SHIP_TO','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_AUTO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_BATCH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_TOPUP_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_RESET_QTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DAY_END_REMOTE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ONLINE_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_ONLINE_STRUCTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_PAYMENT_BREAKDOWN_TO_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT_BY_CUSTOMER_PAYMENT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_POST_TO_ACCOUNT_BY_POS_PAYMENT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VENDOR_LISTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.045000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DAY_END','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE_VENDOR_DISTRIBUTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_BACK_DELIVERY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_TRANSFER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_STATUS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USERS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_RECEIVED','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SALES_RETURN_DUE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_STRUCTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_AUTO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.052000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CHANGE_PASSWORD','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.057000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.065000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_PRELABEL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICE_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_AUTO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PRICE_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_RECUR_PRELABEL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USERS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_STATUS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CHANGE_PASSWORD','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_BACK_DELIVERY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INVOICE_RECEIVED','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_TRANSFER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SALES_RETURN_DUE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE_VENDOR_DISTRIBUTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MULTIPRICE_BY_STRUCTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_USER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_STOCK_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_STOCK_COUNT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MILTI_SALES_REPORT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_VENDOR_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_SALESMAN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_SALESMAN_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_SALESMAN_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_VENDOR_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_CUSTOMER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER_INHOUSE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_SALESMAN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_CUSTOMER_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_STOCK_COUNT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_STOCK_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MILTI_SALES_REPORT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_SALESMAN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_SALESMAN_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_VENDOR_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SELECT_VENDOR_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_USER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_CUSTOMER_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_SALESMAN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_SALESMAN_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SELECT_CUSTOMER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER_INHOUSE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ADJ_BY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EXPORT_IMPORT_BRANCH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EXPORT_IMPORT_HQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SI_BY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNTGROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_EVENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_SETTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO_BACK','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHING_SCALE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY_ITEM_IMPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_CUTOFF','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_LIVE_POINT_REBATE_CONSOLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO_BACK','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_LIVE_POINT_REBATE_CONSOLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO_BACK','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SI_BY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ADJ_BY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_ENTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_EVENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_CUTOFF','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_POSTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_SETTING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNTGROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO_BACK','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHING_SCALE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EXPORT_IMPORT_HQ','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EXPORT_IMPORT_BRANCH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY_ITEM_IMPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NAME','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MEMBER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RENEWAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Name_Quota','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EXPORT_ENTRY_TO_ACC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ITEM_LIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_LIVE_UPDATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_TYPE_EXTRA','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ENTRY_EXPRESS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_LIVE_UPDATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EXPORT_ENTRY_TO_ACC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MEMBER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NAME','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ENTRY_EXPRESS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_ITEM_LIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RENEWAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_BY_STRUCTURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_TYPE_EXTRA','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_BY_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Name_Quota','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.136000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SELECT_ITEM_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.184000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_Event_GWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_DOWNLOAD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_BILL_OF_MATERIAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_PRODUCTION_LINE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_DATE_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SELECT_ITEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.053000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_PRINTERGROUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.090000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_DATE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_DATE_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SELECT_ITEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_Event_GWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_PRINTERGROUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SELECT_ITEM_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_DOWNLOAD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_BILL_OF_MATERIAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_DATE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_PRODUCTION_LINE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_RAW_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_SKU_MULTI_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_CUTTING_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MY_CART_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_RAW_MATERIAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_OVERVIEW','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY_COPY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_DELIVERY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_BILLING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_SALES_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY_DELETE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_SELECT_CUSTOMER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_DELIVERY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_OVERVIEW','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_SELECT_CUSTOMER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY_COPY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_ENTRY_DELETE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_PRODUCTION_BILLING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PP_CUSTOMER_SALES_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_RAW_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.048000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_CUTTING_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.054000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_SKU_MULTI_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.058000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MY_CART_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.067000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEIGHT_RAW_MATERIAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SLIDE_ITEM1','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_BANNER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_BANNER_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_GENERATE_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Sub_Dept','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Category','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_IMS_USER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Promo_Grp','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Dept','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_Cutting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.045000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_MT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Group','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.053000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_CUTTING_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_IMS_USER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_CUTTING_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AD_Cutting','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Promo_Grp','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Category','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Dept','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_BANNER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Sub_Dept','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_BANNER_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SLIDE_ITEM1','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_MT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Web_Group','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_GENERATE_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SALES_REP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_SELECT_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_CITY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_MESSAGE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_EVOUCHER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SLIDE_ITEM2','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PICKUP_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_EVOUCHER_NEWMEMBER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_LOC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_CUSTOMER_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.139000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_EVOUCHER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_EVOUCHER_NEWMEMBER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_MESSAGE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PICKUP_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SLIDE_ITEM2','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_CITY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_CUSTOMER_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_SALES_REP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_LOC','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_VENDOR_SELECT_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_OPENCLOSE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIGNATURE_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_SIGNATURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_MEMBERSHIP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_STRUCTURELIST','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_PURCHASE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_SALES_POSSALES','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_TRADING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_MOVEMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.052000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PR_REQUISITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.054000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_BACKUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_SALES_POSSALES','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_PURCHASE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_STRUCTURELIST','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_MOVEMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_BACKUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_OPENCLOSE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_TRADING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_MEMBERSHIP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIGNATURE_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_SIGNATURE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WEB_PR_REQUISITION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_CENTER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_END_STOCK_OPENCLOSE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.015000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PRICE_CHANGE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_PACKING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_GRP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_DEPT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_AUTO_CALLCARD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_OWNER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_DEALER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_WARRANTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_SUBDEPT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_BACK_ORDER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CALLCARD_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_POS_PAYMENT_BREAKDOWN','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.193000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_END_STOCK_OPENCLOSE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_DEPT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_GRP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_PACKING','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_AUTO_CALLCARD','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CALLCARD_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_WARRANTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_SUBDEPT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_POS_PAYMENT_BREAKDOWN','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_BACK_ORDER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_DEALER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_OWNER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_CENTER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PRICE_CHANGE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.191000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_PRODUCTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_PURCHASE_STATUS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMOR_LIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.038000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_AD_ADJUSTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_MENU_ACCESS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WARRANTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.051000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WEB','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WEIGHT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WARRANTY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COMPANY_MENU_ACCESS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_AD_ADJUSTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WEB','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.014000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_PRODUCTION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_RPT_WEIGHT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMOR_LIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_PURCHASE_STATUS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_ON_BEHALF','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_ROLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AP_FREQUENCY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VENDOR_ACCESS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INV_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_SALES_REP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_COST_CENTER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INV_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_REQ_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AP_FREQUENCY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_VENDOR_ACCESS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_COST_CENTER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INV_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_INV_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_PO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_RDO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_REQ_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_ROLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_SALES_REP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_AGENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_VENDOR_ON_BEHALF','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ChangePassword','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DEPARTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_AUTHORIZATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_QTY_ADJ_USER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MY_LIST_SETTINGS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_LABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STRUCTURE_TRANSFER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SUB_DEPARTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UOM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UOM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DEPARTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'GID_QTY_ADJ_USER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_QTY_ADJ_LABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ChangePassword','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SUB_DEPARTMENT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MY_LIST_SETTINGS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ITEM_AUTHORIZATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STRUCTURE_TRANSFER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BRAND','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COLOR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Inventory_MT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIZE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USER_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_ITEM_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_PACKING_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_PRINTER_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USER_GRP_STRUCTURE_AUTH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ItemAuthorization_Item','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.152000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Inventory_MT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BARCODE_PRINTER_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SELECT_ITEM_CODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_PACKING_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USER_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_USER_GRP_STRUCTURE_AUTH','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ItemAuthorization_Item','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BRAND','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COLOR','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIZE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.192000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_COMPARE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_CONSOLIDATE_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_MULTI_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_SINGLE_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_PURCHASE_GST_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_SUPPLY_GST_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNT_ID','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNT_ID_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_FIX_LOC_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_FIXTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_MAINTENANCE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_GENERATE_GAF','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_COMPARE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_CONSOLIDATE_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNT_ID','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_MAINTENANCE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_GENERATE_GAF','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_FIX_LOC_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_COUNT_ID_ITEM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_MULTI_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_SUPPLY_GST_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EI_SINGLE_SUBMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GST_PURCHASE_GST_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STK_FIXTURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AGENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CASHIER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SHIFT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_DEPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DENOMINATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PAYMENT_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_TERMINALS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_SUBDEPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EVENT_PRE_LABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AGENT_COMMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTER_COMMISSION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AGENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_SUBDEPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_EVENT_PRE_LABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_DEPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CASHIER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DENOMINATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PAYMENT_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_TERMINALS','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTER_COMMISSION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.039000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SHIFT','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AGENT_COMMISSION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LOCATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_BUDGET_GRP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.157000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DOC_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INV_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AR_FREQUENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER_CALLCARD','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF5','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_REPRESENTATIVE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MP_CATEGORY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AR_FREQUENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DOC_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF5','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_DO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_SO_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INV_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_BATCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_REPRESENTATIVE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_CUSTOMER_CALLCARD','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTATION_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_QUOTE_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENTCODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.012000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RENEWAL_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.017000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PROFILE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_BRANCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MEMBER_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_DocSetup','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENT_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_BRANCH','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MEMBER_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Trading_DocSetup','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_EVENT_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENT_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_SETUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_ADJUSTMENTCODE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.058000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RENEWAL_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.065000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REDEEM_PRELABEL','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PROFILE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.066000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REWARD_TYPE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_PRELABEL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DESIGNATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_OCCUPATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RELIGION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_PERSON','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NEWSPAPER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RACE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NATIONALITY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RELATIONSHIP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_WARRANTY_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.045000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.013000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RELATIONSHIP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RACE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_DESIGNATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_RELIGION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_PERSON','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SERVICE_PRELABEL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NEWSPAPER','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_OCCUPATION','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_NATIONALITY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_WS_WARRANTY_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AREA','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CITY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ZONE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STATE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_MENU','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COUNTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CURRENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_GROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIGNATURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_MATRIX','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CREDIT_TERM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_MENU_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_Combo_Item','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Menu_Set_Time','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_TABLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_Combo_Item','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_MENU_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CREDIT_TERM','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CURRENCY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INV_MATRIX','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_Menu_Set_Time','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SIGNATURE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STATE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ZONE','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AREA','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_MENU','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CF_TABLE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_CITY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_GROUP','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_COUNTRY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POSTRADING_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_ITEM_GWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MESSAGE_SERVICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MESSAGE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_TOPUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_TOPUP_ENTRY_COPYING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SUMMARY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SALESPURCHASE_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_REPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_DECLARATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_DRIVER_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SALES_CUSTOMER_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_PERIODIC_AVERAGECOSTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_TEMPLATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_TOPUP_ENTRY_COPYING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_TOPUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_SETUP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_REPORT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SUMMARY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SMS_TEMPLATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PURCHASE_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MESSAGE_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POSTRADING_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_MESSAGE_SERVICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PROMOTION_ITEM_GWP','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SALESPURCHASE_CHART','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SALES_CUSTOMER_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_DECLARATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_TRADING_INVOICE_DRIVER_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_UT_PERIODIC_AVERAGECOSTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_CASHIER_DECLARE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AUDIT_TRAIL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_REAL_TIME','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_RESET_QTY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LINK_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_PROJECT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_LOCATION_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DOCUMENT_COMPARER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_BY_COMP_LEDGER_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_PROJECT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_BYCOMPANY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_IN_RESET_QTY','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_DOCUMENT_COMPARER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_BY_COMP_LEDGER_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_LOCATION_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_BYCOMPANY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_LOCATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_PROJECT_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_LINK_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_GL_PROJECT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_SY_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.040000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_CASHIER_DECLARE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.068000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_AUDIT_TRAIL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.070000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_REAL_TIME','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_APPROVAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REQUEST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_DO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SALESBREAKDOWN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_ADJUSTMENT_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_RECEIPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_PAYMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.044000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.058000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_BACKORDER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.010000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF1','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.016000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_BACKORDER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_ENQUIRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_PAYMENT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_DO','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REQUEST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_APPROVAL','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_ACC_LEDGER_ADJUSTMENT_CATEGORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_RECEIPT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF2','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF3','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_REF4','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_SALESBREAKDOWN','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_TERMINALSALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.018000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_EXPORT_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PC_SLIDER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_REDEEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APPS_VENDOR_ASSIGN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP1','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP2','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP3','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP4','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_IMPORT_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PC_PROMOLIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APPS_VENDOR_ACTIVATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PC_SLIDER','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP3','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP4','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_REDEEM_ENTRY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APPS_VENDOR_ACTIVATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_APPS_VENDOR_ASSIGN_CODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_ACCOUNT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP2','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.033000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PROMO_GROUP1','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_TERMINALSALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MEMBER_APPS_PC_PROMOLIST','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.043000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_IMPORT_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.067000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_EXPORT_SALES','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_EINVOICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSEANALYSISCODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_MANUAL_STOCK_GENERATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_MANUAL_STOCK_SETTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_REDEEM_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_ANALYSIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSECODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSETYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_OPENCLOSE_ANALYSIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_OPENCLOSE_PERIODIC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_DAILYSALES','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SALES_HISTORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_EVENT_CUTOFF_EDIT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PUSH_NOTIFICATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.072000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_TRANSACTIONS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.019000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_TRANSACTIONS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.007000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSEANALYSISCODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_ANALYSIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_EINVOICE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_STAMP_REDEEM_ITEM','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSECODE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_REPORT_OPENCLOSETYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_OPENCLOSE_ANALYSIS','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_OPENCLOSE_PERIODIC','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_MANUAL_STOCK_SETTING','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_MANUAL_STOCK_GENERATE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_POS_DAILYSALES','F',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_PR_SALES_HISTORY','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_STOCK_EVENT_CUTOFF_EDIT','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.009000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_MS_PUSH_NOTIFICATION','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.037000ms  app=.Net SqlClient Data Provider
Delete From PI_User_Company_Access WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.008000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_COMMISSION_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.031000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Permission (Company_Code,user_id, menu_id, access_right, added_by, lastmodifiedby, lastwritetimestamp) VALUES (1,1,'ID_INVENTORY_COMMISSION_TYPE','D',1,1,CONVERT(DATETIME, '11-08-2026 19:32:17 PM', 103))
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.411000ms  app=.Net SqlClient Data Provider
Delete From PI_User_Company_Access WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.230000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Company_Access (Company_Code,user_id) VALUES (1,1)
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.334000ms  app=.Net SqlClient Data Provider
Delete From PI_User_MP_Price_Access WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.546000ms  app=.Net SqlClient Data Provider
Delete From PI_User_Company_Access_Location WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.183000ms  app=.Net SqlClient Data Provider
Delete From PI_User_Company_Access_Location WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Company_Access (Company_Code,user_id) VALUES (1,1)
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.029000ms  app=.Net SqlClient Data Provider
Delete From PI_User_MP_Price_Access WHERE User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_MP_Price_Access (Company_Code,Price_Type,User_ID, Read_Only) VALUES (1,'NP  ',1,'False')
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Company_Access_Location (Company_Code,Location_Code,User_ID,Def_Location,Show_cost, Notify_Packing, Notify_Packing_Complete , Notify_Delivery, Notify_Delivery_Complete,DT_Ordering,DT_Edit_Price, AD_DL_Allow, AD_DL_Location, AD_DL_Code) VALUES (1,'FST',1,'Y','Y','N','N','N','N','N','N','N','','')
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.269000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_MP_Price_Access (Company_Code,Price_Type,User_ID, Read_Only) VALUES (1,'NP  ',1,'False')
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.428000ms  app=.Net SqlClient Data Provider
INSERT INTO PI_User_Company_Access_Location (Company_Code,Location_Code,User_ID,Def_Location,Show_cost, Notify_Packing, Notify_Packing_Complete , Notify_Delivery, Notify_Delivery_Complete,DT_Ordering,DT_Edit_Price, AD_DL_Allow, AD_DL_Location, AD_DL_Code) VALUES (1,'FST',1,'Y','Y','N','N','N','N','N','N','N','','')
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 1.250000ms  app=.Net SqlClient Data Provider
Delete CTL_User_Company Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.915000ms  app=.Net SqlClient Data Provider
Delete CTL_User_Company Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
Delete CTL_User_RCompany Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.082000ms  app=.Net SqlClient Data Provider
Delete CTL_User_Company_Pricechecker Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.288000ms  app=.Net SqlClient Data Provider
Delete CTL_User_RCompany Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.382000ms  app=.Net SqlClient Data Provider
Delete CTL_User_Company_Pricechecker Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.386000ms  app=.Net SqlClient Data Provider
Delete PI_User_Company_Name Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
Delete PI_User_Company_Name Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=0 0.207000ms  app=.Net SqlClient Data Provider
Delete CTL_Select_Structure_User Where User_ID=1
GO

-- [08/11/2026 11:32:17] spid=60 tran=16795552 db=RMS rows=1 0.506000ms  app=.Net SqlClient Data Provider
Delete CTL_Select_Structure_User Where User_ID=1
GO

-- [08/11/2026 11:32:25] spid=60 tran=0 db=RMS rows=1 0.088000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code, a.Company_Name, CASE WHEN c.User_ID is null THEN 'False' ELSE 'True' END AS Def_Company, a.SQL_Server_Workstation,a.Use_Diff_Connection,a.Remote_Company_Code  From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) Left Outer join PI_Users c ON (a.Company_Code=c.Def_Company_Code AND c.User_ID=1)  Order By a.Area,a.Zone,a.Ordering,a.ACC_Company_Code
GO

-- [08/11/2026 11:32:25] spid=60 tran=16795595 db=RMS rows=1 0.069000ms  app=.Net SqlClient Data Provider
Select CASE WHEN b.User_ID is null THEN 'False' ELSE 'True' END AS Access, a.Company_Code, a.Company_Name, CASE WHEN c.User_ID is null THEN 'False' ELSE 'True' END AS Def_Company, a.SQL_Server_Workstation,a.Use_Diff_Connection,a.Remote_Company_Code  From PI_Company a Left Outer Join PI_User_Company_Access b ON (a.Company_Code=b.Company_Code AND b.User_ID=1) Left Outer join PI_Users c ON (a.Company_Code=c.Def_Company_Code AND c.User_ID=1)  Order By a.Area,a.Zone,a.Ordering,a.ACC_Company_Code
GO

-- [08/11/2026 11:32:25] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795599 db=RMS rows=1 0.042000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.920000ms  app=.Net SqlClient Data Provider
Select Apps_Hosting_QR, EI_Company From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 66.041000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795772 db=RMS rows=1 2.494000ms  app=.Net SqlClient Data Provider
SELECT a.*, s.Remote_Pull_Price_Nearest_Cent, s.Remote_Pull_Price_Rounding_Method, s.SI_Import_Item_Overwrite_By_PriceType, s.AD_Import_Item_Overwrite_By_PriceType, s.Import_Item_Rounding_Decimal, s.Import_Item_Unit_Price_Combine_Tax ,s.Check_Article_Integrity,s.Article_Integrity_Fields,SN_Ref1, SN_Ref2, SN_Ref3, SN_Ref4, SN_Ref5, SN_Ref_Date1, SN_Ref_Date2, SN_Ref_Date3, SN_Ref_Date4, SN_Ref_Date5, s.Remote_Pull_Doc_Code, s.Remote_Push_Doc_Code, s.Remote_Pull_Doc_Loc_Filter,s.Remote_Push_Doc_Loc_Filter, s.In_House_Barcode_No_CD, s.Allow_SN_Multi_In, s.Allow_SN_Reissue,s.Check_SN_Validity,s.Local_Location_Code,b.Description AS CityDesc,c.Description AS StateDesc,d.Description AS CountryDesc, f.rate, g.Full_Name AS ModifiedName, h.Full_Name AS AddedName, i.Company_Name AS AccCompanyName, i.Check_Level1, i.Check_Level2, i.Check_Level3, i.Check_Level4, i.Check_Level5, area.Description as AreaDesc, zone.Description as ZoneDesc, i.Ledger_Length1, i.Ledger_Length2, i.Ledger_Length3, i.Ledger_Length4, i.Ledger_Length5, grp.Name as GroupDesc, pr.Post_Method as Pr_Post_Method, mp.Post_Method as MP_Post_Method, s.Post_Method as AD_Post_Method, DT_Database_Fr,DT_Database_To, DT_Sales_Date_Fr, DT_Sales_Date_To, DT_Enable_Delete, DT_Interval, GetDate() as Current_Server_Date, e.Description AS LocalBranchName, i.AR_Ref1_Text_Compulsory,i.AR_Ref2_Text_Compulsory,AR_Ref3_Text_Compulsory,AR_Ref4_Text_Compulsory, i.AR_Ref1_Text_No_Duplicate,i.AR_Ref2_Text_No_Duplicate,AR_Ref3_Text_No_Duplicate,AR_Ref4_Text_No_Duplicate, i.AP_Ref1_Text_Compulsory,i.AP_Ref2_Text_Compulsory,AP_Ref3_Text_Compulsory,AP_Ref4_Text_Compulsory, i.AP_Ref1_Text_No_Duplicate,i.AP_Ref2_Text_No_Duplicate,AP_Ref3_Text_No_Duplicate,AP_Ref4_Text_No_Duplicate ,Web_PriceType1,Web_PriceType2,Web_PriceType3,Web_PriceType4,Web_PriceType5, s.WS_Barcode_18_Digit ,Custom_Field1,Custom_Field2,Custom_Field3,Custom_Field4,Custom_Field5,Custom_Field6,Custom_Field7,Custom_Field8,Custom_Field9,Custom_Field10 ,Def_Template_In_Promo_Item, Def_Template_Ms_Promo_Item FROM PI_Company a LEFT OUTER JOIN SY_Group grp ON (grp.[Group] = a.[Group]) Left Outer Join PI_City b ON (a.City=b.City) Left Outer Join PI_State c ON (a.State=c.State) Left Outer Join PI_Country d ON (a.Country=d.Country ) LEFT OUTER JOIN PI_Currency AS f ON (f.currency = a.currency_type AND f.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Area AS area ON (area.Area = a.Area AND area.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Zone AS zone ON (zone.Zone = a.Zone AND zone.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Users AS g ON (g.User_ID = a.LastModifiedBy) LEFT OUTER JOIN PI_Users AS h ON (h.User_ID = a.Added_By) LEFT OUTER JOIN Pr_Setup AS pr ON (pr.Company_Code = a.Company_Code) LEFT OUTER JOIN MP_Setup AS mp ON (mp.Company_Code = a.Company_Code) LEFT OUTER JOIN IN_Stock_Setup AS s ON (s.Company_Code = a.Company_Code) LEFT OUTER JOIN [Acc].[dbo].[Sy_Company] AS i ON (i.Company_Code = a.Acc_Company_Code) LEFT OUTER JOIN MS_Branch AS e ON (e.Branch = a.Local_Branch)  Where a.Company_Code = 1
GO

-- [08/11/2026 11:32:26] spid=61 tran=0 db=RMS rows=1 0.036000ms  app=.Net SqlClient Data Provider
Select Counter_No From RMS.dbo.PI_Counter Where Company_Code=0 AND Counter_Name='CUSTOMER2_ID'
GO

-- [08/11/2026 11:32:26] spid=61 tran=0 db=RMS rows=1 0.585000ms  app=.Net SqlClient Data Provider
Select Counter_No From RMS.dbo.PI_Counter Where Company_Code=0 AND Counter_Name='CUSTOMER2_ID'
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.581000ms  app=.Net SqlClient Data Provider
Select Location_Code, ISNULL(DocRunningFollowLocationCode,'') as DocRunningFollowLocationCode , ISNULL(DocRunningFollowLocationCodeAD,'') as DocRunningFollowLocationCodeAD from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795784 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
Select Location_Code, ISNULL(DocRunningFollowLocationCode,'') as DocRunningFollowLocationCode , ISNULL(DocRunningFollowLocationCodeAD,'') as DocRunningFollowLocationCodeAD from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=17 0.066000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Supply_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=19 0.087000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Purchase_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=17 0.507000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Supply_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=19 0.525000ms  app=.Net SqlClient Data Provider
Select Code,Description,Rate From SY_Purchase_GST_Code Where Status='A' Order by Ordering
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.201000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnVMS,'') From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=5 0.448000ms  app=.Net SqlClient Data Provider
Select a.* from RMS.dbo.IN_Stock_Setup_Plu a Where a.Status='True' And a.company_code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795806 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnVMS,'') From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=5 0.031000ms  app=.Net SqlClient Data Provider
Select a.* from RMS.dbo.IN_Stock_Setup_Plu a Where a.Status='True' And a.company_code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795813 db=RMS rows=1 0.470000ms  app=.Net SqlClient Data Provider
Select Location_Code,Use_GST,Compulsory_GST, Name, ISNULL(Default_Doc_Printer_Path,'') as Default_Doc_Printer_Path, ISNULL(ACC_Entry_Ref_Setting,'') as ACC_Entry_Ref_Setting  ,* from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 2.808000ms  app=.Net SqlClient Data Provider
Select Location_Code,Use_GST,Compulsory_GST, Name, ISNULL(Default_Doc_Printer_Path,'') as Default_Doc_Printer_Path, ISNULL(ACC_Entry_Ref_Setting,'') as ACC_Entry_Ref_Setting  ,* from PI_Company_Location where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.213000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnCTL,'') From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.518000ms  app=.Net SqlClient Data Provider
Select Price_Type from PI_Company_Location Where company_code=1 and location_Code=''
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795815 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
Select ISNULL(cnCTL,'') From SY_System
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.033000ms  app=.Net SqlClient Data Provider
Select Price_Type from PI_Company_Location Where company_code=1 and location_Code=''
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795821 db=RMS rows=498 0.105000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id  AND b.status = 'A' ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=498 0.990000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.menu_id, a.access_right, b.status FROM PI_User_Permission a INNER JOIN PI_Users b ON (b.user_id = a.user_id  AND b.status = 'A' ) WHERE a.user_id = 1 AND Company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.012000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=5 1.139000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Module_Access AS a WHERE a.Company_Code = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=5 0.101000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Module_Access AS a WHERE a.Company_Code = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795827 db=RMS rows=51 0.109000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Menu_Access AS a WHERE a.Company_Code =1 AND ( Module_No=1 OR  Module_No=2 OR  Module_No=3 OR  Module_No=4 OR  Module_No=8) Order By a.Module_No
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=51 1.451000ms  app=.Net SqlClient Data Provider
SELECT a.* FROM PI_Company_Menu_Access AS a WHERE a.Company_Code =1 AND ( Module_No=1 OR  Module_No=2 OR  Module_No=3 OR  Module_No=4 OR  Module_No=8) Order By a.Module_No
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 2.343000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Company_Name a  Inner Join RMS.dbo.PI_User_Company_Name b ON (a.Company_Code=b.Company_Code AND a.Name_No=b.Name_No )  Where a.Company_Code=1 AND b.User_ID=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795832 db=RMS rows=0 0.099000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Company_Name a  Inner Join RMS.dbo.PI_User_Company_Name b ON (a.Company_Code=b.Company_Code AND a.Name_No=b.Name_No )  Where a.Company_Code=1 AND b.User_ID=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.017000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.052000ms  app=.Net SqlClient Data Provider
Select Code,Description from ACC.dbo.CM_Commission_Type Where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 2.995000ms  app=.Net SqlClient Data Provider
Select Code,Description from ACC.dbo.CM_Commission_Type Where company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 2.915000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795836 db=RMS rows=1 2.894000ms  app=.Net SqlClient Data Provider
Select a.*, b.Full_Name As DefaultPrApprName, c.Full_Name As DefaultMpApprName, d.Full_Name AS DefaultQtyAdjApprName, e.Full_Name AS DefaultCostAdjApprName, f.Full_Name AS DefaultIrApprName, b2.Full_Name AS DefaultPrApprName2, c2.Full_Name AS DefaultMpApprName2,  d2.Full_Name AS DefaultQtyAdjApprName2, f2.Full_Name AS DefaultIrApprName2, b3.Full_Name AS DefaultPrApprName3, c3.Full_Name AS DefaultMpApprName3,  d3.Full_Name AS DefaultQtyAdjApprName3, f3.Full_Name AS DefaultIrApprName3, b4.Full_Name AS DefaultPrApprName4, c4.Full_Name AS DefaultMpApprName4,  d4.Full_Name AS DefaultQtyAdjApprName4, f4.Full_Name AS DefaultIrApprName4, b5.Full_Name AS DefaultPrApprName5, c5.Full_Name AS DefaultMpApprName5,  d5.Full_Name AS DefaultQtyAdjApprName5, f5.Full_Name AS DefaultIrApprName5, b6.Full_Name AS DefaultPrApprName6, c6.Full_Name AS DefaultMpApprName6,  d6.Full_Name AS DefaultQtyAdjApprName6, f6.Full_Name AS DefaultIrApprName6, g.description AS BranchName  from PI_Users a Left Outer Join PI_Users b On (b.User_Id = a.Pr_Approver) Left Outer Join PI_Users c On (c.User_Id = a.Mp_Approver) Left Outer Join PI_Users d On (d.User_Id = a.Qty_Adj_Approver) Left Outer Join PI_Users e On (e.User_Id = a.Cost_Adj_Approver) Left Outer Join PI_Users f ON (f.User_Id = a.Ir_Approver) LEFT OUTER JOIN [dbo].[PI_Users] b2 on (b2.User_Id = a.Pr_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] c2 on (c2.User_Id = a.Mp_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] d2 on (d2.User_Id = a.Qty_Adj_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] f2 on (f2.User_Id = a.Ir_Approver2) LEFT OUTER JOIN [dbo].[PI_Users] b3 on (b3.User_Id = a.Pr_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] c3 on (c3.User_Id = a.Mp_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] d3 on (d3.User_Id = a.Qty_Adj_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] f3 on (f3.User_Id = a.Ir_Approver3) LEFT OUTER JOIN [dbo].[PI_Users] b4 on (b4.User_Id = a.Pr_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] c4 on (c4.User_Id = a.Mp_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] d4 on (d4.User_Id = a.Qty_Adj_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] f4 on (f4.User_Id = a.Ir_Approver4) LEFT OUTER JOIN [dbo].[PI_Users] b5 on (b5.User_Id = a.Pr_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] c5 on (c5.User_Id = a.Mp_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] d5 on (d5.User_Id = a.Qty_Adj_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] f5 on (f5.User_Id = a.Ir_Approver5) LEFT OUTER JOIN [dbo].[PI_Users] b6 on (b6.User_Id = a.Pr_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] c6 on (c6.User_Id = a.Mp_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] d6 on (d6.User_Id = a.Qty_Adj_Approver6) LEFT OUTER JOIN [dbo].[PI_Users] f6 on (f6.User_Id = a.Ir_Approver6) LEFT OUTER JOIN [dbo].[ms_branch] g on (g.branch = a.default_branch) Where a.user_id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795838 db=RMS rows=1 0.027000ms  app=.Net SqlClient Data Provider
Select Price_type,ISNULL(Read_only,'False') as Read_only from pi_User_mp_Price_Access where company_Code=1 And user_id=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.396000ms  app=.Net SqlClient Data Provider
Select Price_type,ISNULL(Read_only,'False') as Read_only from pi_User_mp_Price_Access where company_Code=1 And user_id=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.689000ms  app=.Net SqlClient Data Provider
Select Skip_Item_Authorization from PI_Users where user_id=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 0.030000ms  app=.Net SqlClient Data Provider
Select Skip_Item_Authorization from PI_Users where user_id=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795878 db=RMS rows=1 0.291000ms  app=.Net SqlClient Data Provider
SELECT a.Use_PTS,a.Location_Code,a.Update_Batch_Expiry,a.Update_Serial_No,a.Update_Qty_On_Sales,a.Location_Code,a.Use_Instalment,a.Instalment_Ref1,a.Instalment_Ref2, a.Member_Lookup_Get_Last,a.Tax_Rate FROM POS.dbo.SY_Company a
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 55.398000ms  app=.Net SqlClient Data Provider
SELECT a.Use_PTS,a.Location_Code,a.Update_Batch_Expiry,a.Update_Serial_No,a.Update_Qty_On_Sales,a.Location_Code,a.Use_Instalment,a.Instalment_Ref1,a.Instalment_Ref2, a.Member_Lookup_Get_Last,a.Tax_Rate FROM POS.dbo.SY_Company a
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 5.803000ms  app=.Net SqlClient Data Provider
Select a.Location_Code,b.Name,a.Def_Location,b.Price_Type,Area,Zone,ISNULL(b.Adjustment_UnitPrice, 0) AS Adjustment_UnitPrice, Connection, ISNULL(b.Use_Location_Cost,'N') AS Use_Location_Cost, ISNULL(b.Use_Location_Price,'N') AS Use_Location_Price,b.Company_No, ISNULL(a.Show_Cost,'N') as Show_Cost, Company_No as ACC_Company, Use_GST, Compulsory_GST, Use_SST FROM PI_User_Company_Access_Location a Inner Join PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) WHERE a.Company_Code=1 AND a.User_ID=1 and Status = 'A' ORDER BY b.[Order]
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795892 db=RMS rows=1 0.192000ms  app=.Net SqlClient Data Provider
Select a.Location_Code,b.Name,a.Def_Location,b.Price_Type,Area,Zone,ISNULL(b.Adjustment_UnitPrice, 0) AS Adjustment_UnitPrice, Connection, ISNULL(b.Use_Location_Cost,'N') AS Use_Location_Cost, ISNULL(b.Use_Location_Price,'N') AS Use_Location_Price,b.Company_No, ISNULL(a.Show_Cost,'N') as Show_Cost, Company_No as ACC_Company, Use_GST, Compulsory_GST, Use_SST FROM PI_User_Company_Access_Location a Inner Join PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) WHERE a.Company_Code=1 AND a.User_ID=1 and Status = 'A' ORDER BY b.[Order]
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795902 db=RMS rows=1 0.122000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, a.Attachment_Path, a.PR_Attachment_Path, a.PO_Attachment_Path, a.PD_Attachment_Path, a.PI_Attachment_Path, a.SQ_Attachment_Path, a.SO_Attachment_Path, a.SD_Attachment_Path, a.SI_Attachment_Path, a.AD_Attachment_Path, a.Packing_Attachment_Path, a.Item_Attachment_Path, a.Member_Attachment_Path, a.IR_Attachment_Path, a.PR_Attachment_Level, a.PO_Attachment_Level, a.PD_Attachment_Level, a.PI_Attachment_Level, a.SQ_Attachment_Level, a.SO_Attachment_Level, a.SD_Attachment_Level, a.SI_Attachment_Level, a.AD_Attachment_Level, a.Packing_Attachment_Level, a.Item_Attachment_Level, a.Member_Attachment_Level, a.IR_Attachment_Level, a.Attachment_Level, a.ST_Attachment_Level, a.PR_Attachment_Folder, a.PO_Attachment_Folder, a.PD_Attachment_Folder, a.PI_Attachment_Folder, a.SQ_Attachment_Folder, a.SO_Attachment_Folder, a.SD_Attachment_Folder, a.SI_Attachment_Folder, a.AD_Attachment_Folder, a.Packing_Attachment_Folder, a.Item_Attachment_Folder, a.Member_Attachment_Folder, a.ST_Attachment_Folder, a.IR_Attachment_Folder, a.Attachment_Folder, a.Attachment_DocType, a.PR_Attachment_DocType, a.PO_Attachment_DocType, a.PD_Attachment_DocType, a.PI_Attachment_DocType, a.SQ_Attachment_DocType, a.SO_Attachment_DocType, a.SD_Attachment_DocType, a.SI_Attachment_DocType, a.AD_Attachment_DocType, a.Packing_Attachment_DocType, a.Item_Attachment_DocType, a.Member_Attachment_DocType, a.IR_Attachment_DocType, a.ST_Attachment_DocType, ISNULL(b.Def_Location,'N') AS Def_Location,Attachment_File_Format FROM PI_Company_Location a LEFT OUTER JOIN PI_User_Company_Access_Location b ON a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code WHERE a.Company_Code = 1 AND b.User_Id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 3.326000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, a.Attachment_Path, a.PR_Attachment_Path, a.PO_Attachment_Path, a.PD_Attachment_Path, a.PI_Attachment_Path, a.SQ_Attachment_Path, a.SO_Attachment_Path, a.SD_Attachment_Path, a.SI_Attachment_Path, a.AD_Attachment_Path, a.Packing_Attachment_Path, a.Item_Attachment_Path, a.Member_Attachment_Path, a.IR_Attachment_Path, a.PR_Attachment_Level, a.PO_Attachment_Level, a.PD_Attachment_Level, a.PI_Attachment_Level, a.SQ_Attachment_Level, a.SO_Attachment_Level, a.SD_Attachment_Level, a.SI_Attachment_Level, a.AD_Attachment_Level, a.Packing_Attachment_Level, a.Item_Attachment_Level, a.Member_Attachment_Level, a.IR_Attachment_Level, a.Attachment_Level, a.ST_Attachment_Level, a.PR_Attachment_Folder, a.PO_Attachment_Folder, a.PD_Attachment_Folder, a.PI_Attachment_Folder, a.SQ_Attachment_Folder, a.SO_Attachment_Folder, a.SD_Attachment_Folder, a.SI_Attachment_Folder, a.AD_Attachment_Folder, a.Packing_Attachment_Folder, a.Item_Attachment_Folder, a.Member_Attachment_Folder, a.ST_Attachment_Folder, a.IR_Attachment_Folder, a.Attachment_Folder, a.Attachment_DocType, a.PR_Attachment_DocType, a.PO_Attachment_DocType, a.PD_Attachment_DocType, a.PI_Attachment_DocType, a.SQ_Attachment_DocType, a.SO_Attachment_DocType, a.SD_Attachment_DocType, a.SI_Attachment_DocType, a.AD_Attachment_DocType, a.Packing_Attachment_DocType, a.Item_Attachment_DocType, a.Member_Attachment_DocType, a.IR_Attachment_DocType, a.ST_Attachment_DocType, ISNULL(b.Def_Location,'N') AS Def_Location,Attachment_File_Format FROM PI_Company_Location a LEFT OUTER JOIN PI_User_Company_Access_Location b ON a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code WHERE a.Company_Code = 1 AND b.User_Id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=1 1.037000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=16795904 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
Select isnull(Allow_Custom_Report,'N') from PI_Users where User_Id = 1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.038000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.042000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.723000ms  app=.Net SqlClient Data Provider
SELECT Event_No FROM MS_Event WHERE Start_Date <= CONVERT(DATETIME, '01-01-2015', 103) AND End_Date >= CONVERT(DATETIME, '01-01-2015', 103) AND Status = 'A' And company_Code=1
GO

-- [08/11/2026 11:32:26] spid=60 tran=0 db=RMS rows=0 0.914000ms  app=.Net SqlClient Data Provider
SELECT event_no FROM in_event WHERE start_date <= CONVERT(DATETIME, '01-01-2015', 103) AND end_date >= CONVERT(DATETIME, '01-01-2015', 103) AND status = 'A' AND company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 24.204000ms  app=.Net SqlClient Data Provider
exec In_Stock_Setup_Sel @CompanyCode=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.341000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.536000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Counter WHERE Company_Code=1 AND Counter_Name='Expiry_Batch_No'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.047000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Secret_Code WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.026000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=11 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.279000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RO_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.292000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_RP_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=11 0.361000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.265000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.279000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.291000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM sy_WEB_PL_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Requisition_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM AD_Adjustment_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.007000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.032000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='AC' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.336000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SB' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.045000ms  app=.Net SqlClient Data Provider
SELECT * FROM In_Stock_Signature WHERE Module='SC' AND Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.387000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.953000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.025000ms  app=.Net SqlClient Data Provider
Select Costing_Exclude_Tax from PR_Setup Where Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=16796071 db=RMS rows=0 0.026000ms  app=.Net SqlClient Data Provider
SELECT a.user_id, a.full_name, b.access_control, b.purchase_limit FROM PI_Users AS a LEFT OUTER JOIN In_Inventory_Control AS b ON (b.user_id = a.user_id) WHERE Company_Code=1 ORDER BY a.user_id
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 8.588000ms  app=.Net SqlClient Data Provider
exec MP_Setup_Sel @CompanyCode=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=11 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=11 0.028000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.322000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.324000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.026000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Quote_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.274000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.295000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_Invoice_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=4 0.311000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_DO_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.266000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.266000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.274000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SD_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.020000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SO_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.021000ms  app=.Net SqlClient Data Provider
SELECT * FROM MP_SQ_Pick_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.001000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.011000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.032000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.398000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SD'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.046000ms  app=.Net SqlClient Data Provider
SELECT * FROM PI_Report_Copy WHERE Company_Code = 1 AND Type = 'SI'
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.923000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/11/2026 11:32:35] spid=60 tran=16796171 db=RMS rows=0 0.065000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name FROM MP_Access_Control AS a INNER JOIN PI_Users AS b ON (a.user_id = b.user_id) ORDER BY a.user_id
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT MP_Batch_Exp_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.025000ms  app=.Net SqlClient Data Provider
SELECT MP_Serial_No_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.472000ms  app=.Net SqlClient Data Provider
SELECT MP_Batch_Exp_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.575000ms  app=.Net SqlClient Data Provider
SELECT MP_Serial_No_Opt  FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.457000ms  app=.Net SqlClient Data Provider
SELECT MP_Return_Due_Opt FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.022000ms  app=.Net SqlClient Data Provider
SELECT MP_Return_Due_Opt FROM In_Stock_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 0.023000ms  app=.Net SqlClient Data Provider
SELECT Current_Member_Type,Current_Reward_type FROM MS_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=1 1.424000ms  app=.Net SqlClient Data Provider
SELECT Current_Member_Type,Current_Reward_type FROM MS_Setup WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=60 tran=0 db=RMS rows=0 2.654000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=60 tran=16796262 db=RMS rows=0 0.040000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=61 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=61 tran=0 db=RMS rows=0 0.022000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=61 tran=16796263 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=63 tran=16796267 db=RMS rows=0 0.018000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=63 tran=0 db=RMS rows=0 0.029000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=64 tran=0 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=64 tran=16796271 db=RMS rows=0 0.017000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=65 tran=16796275 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=65 tran=0 db=RMS rows=0 0.026000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=66 tran=0 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=66 tran=16796279 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=67 tran=0 db=RMS rows=11 0.026000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=67 tran=0 db=RMS rows=11 0.035000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Signature WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=68 tran=0 db=RMS rows=0 0.440000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=68 tran=0 db=RMS rows=0 0.023000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=69 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=69 tran=0 db=RMS rows=0 0.404000ms  app=.Net SqlClient Data Provider
SELECT * FROM SY_Pos_Web_Signature WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.028000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=70 tran=16796299 db=RMS rows=0 0.016000ms  app=.Net SqlClient Data Provider
SELECT a.Company_Code, a.Sku_No, a.Uom, c.Description AS UomDesc, CASE WHEN a.Uom = (SELECT Uom FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Sku_No=a.Sku_No AND Plu_No='') THEN 'Y' ELSE 'N' END AS PluUom FROM In_Stock_Uom a LEFT OUTER JOIN PI_Uom c ON (a.Company_Code=c.Company_Code AND a.Uom=c.Uom) WHERE a.Company_Code=1 AND a.Sku_No= (SELECT Sku_No FROM In_Stock_Plu WHERE Company_Code=a.Company_Code AND Plu_No='')
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=16796377 db=RMS rows=1 0.341000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=1 7.593000ms  app=.Net SqlClient Data Provider
SELECT a.Location_Code, b.Name, a.Def_Location , ISNULL(b.Customer_Alt_Company,'') AS Customer_Alt_Company , Vendor_Alt_Company = ISNULL(b.Vendor_Alt_Company,''), CustAltCoName = ISNULL(c.Name,''), VendorAltCoName = ISNULL(d.Name,''), b.Company_No, AR_Bank_Code = ISNULL(b.AR_Receipt_Bank,''), AR_Bank_Name = ISNULL(e.Bank_Name,''),AP_Bank_Code = ISNULL(b.AP_Payment_Bank,''), AP_Bank_Name = ISNULL(f.Bank_Name,'') FROM PI_User_Company_Access_Location a INNER JOIN PI_Company_Location b ON (a.Company_Code=b.Company_Code AND a.Location_Code=b.Location_Code) LEFT OUTER JOIN ACC.dbo.AR_Customer c ON ( b.Company_No=c.Company_Code AND   b.Customer_Alt_Company=c.Code) LEFT OUTER JOIN ACC.dbo.AP_Vendor d ON ( b.Company_No=d.Company_Code AND   b.Vendor_Alt_Company=d.Code) LEFT OUTER JOIN ACC.dbo.SY_Bank e ON (b.Company_No=e.Company_Code AND b.AR_Receipt_Bank=e.Bank_Code) LEFT OUTER JOIN ACC.dbo.SY_Bank f ON (b.Company_No=f.Company_Code AND b.AP_Payment_Bank=f.Bank_Code) WHERE a.Company_Code=1 AND a.User_ID=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.930000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Payment_Type_Voucher Where Payment_Type='' AND company_Code=1 AND Serial_No='asd'
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.036000ms  app=.Net SqlClient Data Provider
Select * from RMS.dbo.PI_Payment_Type_Voucher Where Payment_Type='' AND company_Code=1 AND Serial_No='asd'
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.038000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 2.406000ms  app=.Net SqlClient Data Provider
SELECT Sku_No,Description From IN_Stock Where Company_Code=0
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.421000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.025000ms  app=.Net SqlClient Data Provider
Select Project_Code, Description From SY_Project WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.004000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.024000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.374000ms  app=.Net SqlClient Data Provider
Select Location_Code,Description From SY_Location WHERE Company_Code=1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.003000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=0 0.002000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=11 0.280000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=1 0.035000ms  app=.Net SqlClient Data Provider
Select 'AUTO' as Code,'AUTO PRELABEL' as Description
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=1 0.548000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=1 0.002000ms  app=.Net SqlClient Data Provider
Select 'AUTO' as Code,'AUTO PRELABEL' as Description
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=1 0.026000ms  app=.Net SqlClient Data Provider
SELECT Count(Location_Code) FROM [dbo].[Pi_Company_Location]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:35] spid=70 tran=0 db=RMS rows=11 0.029000ms  app=.Net SqlClient Data Provider
SELECT * FROM [dbo].[MP_Representative]  WHERE Company_Code = 1
GO

-- [08/11/2026 11:32:40] spid=69 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:40] spid=69 tran=16796558 db=RMS rows=45 0.207000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name as Added_Name, c.full_name as Posted_Name FROM [dbo].[MP_Invoice_Batch] AS a LEFT OUTER JOIN [dbo].[PI_Users] AS b ON (b.user_id = a.added_by)                                    LEFT OUTER JOIN [dbo].[PI_Users] AS c ON (c.user_id = a.posted_by)                                   WHERE a.Company_Code = 1 AND a.Location_Code IN ('FST')   ORDER BY [Batch_No]
GO

-- [08/11/2026 11:32:40] spid=69 tran=0 db=RMS rows=45 2.851000ms  app=.Net SqlClient Data Provider
SELECT a.*, b.full_name as Added_Name, c.full_name as Posted_Name FROM [dbo].[MP_Invoice_Batch] AS a LEFT OUTER JOIN [dbo].[PI_Users] AS b ON (b.user_id = a.added_by)                                    LEFT OUTER JOIN [dbo].[PI_Users] AS c ON (c.user_id = a.posted_by)                                   WHERE a.Company_Code = 1 AND a.Location_Code IN ('FST')   ORDER BY [Batch_No]
GO

-- [08/11/2026 11:32:43] spid=69 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:43] spid=69 tran=0 db=RMS rows=1 1.851000ms  app=.Net SqlClient Data Provider
exec MP_Invoice_Batch_SelByBatch @CompanyCode=1,@Batch_No=46
GO

-- [08/11/2026 11:32:53] spid=69 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:53] spid=69 tran=0 db=RMS rows=11 0.505000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/11/2026 11:32:53] spid=69 tran=0 db=RMS rows=11 0.043000ms  app=.Net SqlClient Data Provider
Select Representative_ID as ID, Full_Name From RMS.dbo.MP_Representative Where Status='A' AND Company_Code=1
GO

-- [08/11/2026 11:32:59] spid=69 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:59] spid=69 tran=0 db=RMS rows=0 0.006000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:32:59] spid=69 tran=0 db=RMS rows=2 40.241000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'PI_Credit_Term_Sel'
GO

-- [08/11/2026 11:32:59] spid=69 tran=0 db=RMS rows=7 1.148000ms  app=.Net SqlClient Data Provider
exec PI_Credit_Term_Sel @CompanyCode=1
GO

-- [08/11/2026 11:33:02] spid=68 tran=0 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:02] spid=68 tran=0 db=RMS rows=3 1.282000ms  app=.Net SqlClient Data Provider
exec [RMS].[sys].[sp_procedure_params_100_managed] @procedure_name=N'PI_Credit_Term_SelByTerm'
GO

-- [08/11/2026 11:33:02] spid=68 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:02] spid=68 tran=0 db=RMS rows=1 3.678000ms  app=.Net SqlClient Data Provider
exec PI_Credit_Term_SelByTerm @CompanyCode=1,@Credit_Term='030 '
GO

-- [08/11/2026 11:33:10] spid=68 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:10] spid=68 tran=0 db=RMS rows=7 42.721000ms  app=.Net SqlClient Data Provider
exec MP_Customer_SelByCode @CompanyCode=1,@Code=N'01/N01',@UserID=1,@GetByLocation=N'Y',@FilterString=N' AND a.Company_Code = 1',@CompanyCode2=1
GO

-- [08/11/2026 11:33:10] spid=68 tran=0 db=RMS rows=0 0.015000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:10] spid=68 tran=0 db=RMS rows=1 0.028000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:33:10] spid=68 tran=0 db=RMS rows=1 0.350000ms  app=.Net SqlClient Data Provider
Select Type From RMS.dbo.PI_Credit_Term WHere Term='060' AND Company_Code=1
GO

-- [08/11/2026 11:33:13] spid=68 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797381 db=RMS rows=1 11.123000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797381 db=RMS rows=1 0.195000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no,a.Cku_No, a.uom, a.status, a.grp, a.dept, a.subdept, a.category, a.description, a.article_no, a.size, a.actual_size, a.color, a.type, a.open_price, a.company_comm_rate, a.promoter_comm_rate, a.company_comm_rate1, a.promoter_comm_rate1, a.company_comm_rate2, a.promoter_comm_rate2, a.average_cost, a.standard_cost, a.last_cost, a.fifo_cost, a.misc_cost, a1.qty_on_hand, a1.qty_on_order, a1.qty_on_request, a1.qty_on_received, a1.qty_on_customer_return, a1.qty_on_return, a1.qty_on_trading, a1.qty_on_sales, a1.qty_on_sales_order, a1.qty_on_exchange, a1.qty_on_repair, a1.qty_on_adj_in, a1.qty_on_adj_out, a1.qty_on_adj_kiv, a.discountable, a.return_due, w.description AS grpdesc, x.description AS deptdesc, y.description AS subdesc, z.description AS catdesc,a2.Description as ColorDesc, a.Brand, a.Ref1, a.Ref2, a.Ref3, a.Ref4, a.Ref1_Text, a.Ref2_Text, a.Ref3_Text,a.Ref4_Text, j.Description AS Ref1Desc, k.Description AS Ref2Desc, m.Description AS Ref3Desc, n.Description AS Ref4Desc, a.Open_Code, a.Allow_Zero_Price, a.Give_Point, a.Give_Rebate, a.Check_Quota, a.Record_Name, BrandDesc=p.Description, a.Purchase_GST_Code,a.Supply_GST_Code,r.Rate as PurchaseGSTRate, s.Rate as SupplyGSTRate, a.Special_Msg, a.Web_Special_Msg ,a.Pack_Size,a.Pack_Size_Desc,a.Pack_Size_Uom,(a.Qty_On_Hand + a.Qty_On_Received + a.Qty_On_Customer_Return + a.Qty_On_Adj_In - a.Qty_On_Adj_Out - a.Qty_On_Sales_Order-a.Qty_On_Trading - a.Qty_On_Return) as ItemMasterStkQty FROM In_Stock a INNER JOIN PI_Group w ON (w.grp = a.grp AND w.Company_Code=a.Company_Code) INNER JOIN PI_Department x ON (x.grp = w.grp and x.dept = a.dept AND x.Company_Code=a.Company_Code) INNER JOIN PI_Sub_Dept y ON (y.grp = x.grp and y.dept = x.dept and y.subdept = a.subdept AND y.Company_Code=a.Company_Code) INNER JOIN PI_Category z ON (z.grp = y.grp and z.dept = y.dept and z.subdept = y.subdept and z.category = a.category AND z.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref1 J ON (j.Ref1 = a.Ref1  AND j.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref2 k ON (k.Ref2 = a.Ref2  AND k.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref3 m ON (m.Ref3 = a.Ref3  AND m.Company_Code=a.Company_Code) LEFT OUTER JOIN In_Stock_Ref4 n ON (n.Ref4 = a.Ref4  AND n.Company_Code=a.Company_Code) LEFT OUTER JOIN PI_Brand p ON (p.Code = a.Brand AND p.Company_Code=a.Company_Code) Left Outer Join IN_Stock_Location a1 ON (a.Sku_No=a1.Sku_No AND a.Company_Code=a1.Company_Code AND a1.Location_Code='FST') Left Outer Join SY_Color a2 ON (a.Color=a2.Code AND a.Company_Code=a2.Company_Code) LEFT OUTER JOIN SY_Purchase_GST_Code r ON (r.Code=a.Purchase_GST_Code) LEFT OUTER JOIN SY_Supply_GST_Code s ON (s.Code=a.Supply_GST_Code) WHERE a.sku_no = 6 AND a.Company_Code=1
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797381 db=RMS rows=2 0.117000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797381 db=RMS rows=2 1.179000ms  app=.Net SqlClient Data Provider
SELECT a.sku_no, a.uom, b.description, a.status, a.factor, a.price, a.Remark, a.Pack_Size_Desc, Total_Volume, Total_Volume_Uom,a.SI_Unit_DIsc,SI_Unit_DIsc_Rate,Inclusive_Tax, GST_Price FROM In_Stock_UOM a INNER JOIN PI_Uom b ON (b.uom = a.uom AND b.Company_Code=a.Company_Code) WHERE a.sku_no = 6 And a.Company_Code = 1 order by a.factor
GO

-- [08/11/2026 11:33:13] spid=68 tran=0 db=RMS rows=0 0.008000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:13] spid=68 tran=0 db=RMS rows=0 9.370000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797558 db=RMS rows=0 6.254000ms  app=.Net SqlClient Data Provider
SELECT TOP 1 a.Invoice_Prelabel, b.Unit_Price FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C' AND a.Company_Code=1 AND a.Customer='01/N01' AND b.Sku_No=6 AND b.Uom='EA' ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:33:13] spid=68 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:13] spid=68 tran=16797584 db=RMS rows=2 0.690000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:33:13] spid=68 tran=0 db=RMS rows=2 2.492000ms  app=.Net SqlClient Data Provider
SELECT TOP 2 a.Invoice_Prelabel,a.Invoice_Date, b.Unit_Price,b.UOM,b.Quantity,b.Factor,a.Currency, b.Remark, b.Foc as Foc, 0 as CN_Total_Amount FROM MP_Invoice a LEFT OUTER JOIN MP_Invoice_Item b ON (a.Invoice_Prelabel=b.Invoice_Prelabel  AND b.Company_Code=a.Company_Code) WHERE a.Status<>'C' AND b.Status<>'C'  AND a.Customer='01/N01'  AND a.Company_Code=1 AND b.Sku_No=6ORDER BY Invoice_Date DESC
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=0 0.011000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=1 9.781000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='EA'
GO

-- [08/11/2026 11:33:36] spid=68 tran=16797929 db=RMS rows=1 0.953000ms  app=.Net SqlClient Data Provider
SELECT a2.Plu_No FROM (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, a1.Plu_No, a1.Added_Date FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No)))) a2 INNER JOIN (SELECT a1.Company_Code, a1.Sku_No, a1.Uom, MAX(a1.Added_Date) as MaxDate FROM In_Stock_Plu a1 WHERE a1.Company_Code=1 AND EXISTS (SELECT Sku_NO, Uom, MAX(LEN(Plu_No)) FROM In_Stock_Plu WHERE Company_Code=a1.Company_Code AND Sku_No=a1.Sku_No AND Uom=a1.Uom AND Status='A' GROUP BY Sku_No, Uom HAVING LEN(a1.Plu_No)=MAX(LEN(Plu_No))) GROUP BY a1.Company_Code, a1.Sku_No, a1.Uom) a3 on a2.Company_Code=a3.Company_Code and a2.sku_no=a3.sku_no and a2.Uom=a3.Uom and a2.added_date=a3.MaxDate WHERE a2.Company_Code=1 AND a2.Sku_No=6 AND a2.Uom='EA'
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=0 0.009000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=0 0.005000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=1 0.050000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=1 0.991000ms  app=.Net SqlClient Data Provider
SELECT Serial_No FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=1 0.821000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/11/2026 11:33:36] spid=68 tran=0 db=RMS rows=1 0.041000ms  app=.Net SqlClient Data Provider
SELECT Batch_Expiry FROM In_Stock Where Sku_No=6 AND Company_Code=1
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=0 0.033000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=1 0.524000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=000006 AND a.Uom='CTN'
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=1 2.956000ms  app=.Net SqlClient Data Provider
SELECT a.Plu_No, a.Description, a.Selling_Price, a.Item_Code, a.Remark, a.Cate_Id, a.Sub_Cate_Id FROM AR_Customer_Item a WHERE a.company_Code=1 AND a.Sku_No=000006 AND a.Uom='CTN'
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=0 0.014000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=1 2.080000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797958 db=RMS rows=1 0.075000ms  app=.Net SqlClient Data Provider
SELECT ISNULL(SI_No_Of_Item,0) FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=0 db=RMS rows=0 0.010000ms  app=.Net SqlClient Data Provider
exec sp_reset_connection
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.143000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 2.095000ms  app=.Net SqlClient Data Provider
SELECT SI_Prelabel, SI_Running_No FROM PI_Company_Location WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=0 1.321000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010077'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=0 0.078000ms  app=.Net SqlClient Data Provider
SELECT Invoice_Prelabel FROM MP_Invoice WHERE Company_Code = 1 AND Invoice_Prelabel = 'FST/SI/010077'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.071000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.975000ms  app=.Net SqlClient Data Provider
SELECT Status FROM MP_Invoice_Batch WHERE Company_Code=1 AND Batch_No = 46
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=2 5.808000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010077', CONVERT(DATETIME,'16-04-2026',103), CONVERT(DATETIME,'15-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,5151.000000,1,312.12,0.0000,0.00,0.0000,0.00,312.12,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'16-04-2026 19:32:38 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'15-06-2026',103), 'FST','','',0.0000,'N','Y','','N','','','','',0,312.12,'','','','','')
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.663000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice (Batch_No, Company_Code, Invoice_Prelabel, Invoice_Date, Due_Date, Customer, Ship_To, Representative_ID, Terms, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2, Currency, Rate, Total_Invoice_Quantity, Total_Invoice_Entry, Gross_Amount, Invoice_Discount_Rate, Invoice_Discount_Amount, Invoice_Tax_Rate, Invoice_Tax_Amount, Net_Amount, Rounding_Discount, Other_Charges, Added_By, Added_Date, Last_Modified_By, Last_Modified_Date, LastWriteTimeStamp, Link_Account, Way_Bill_No, Delivered_By, Delivered_Date, Alternate_Company, Alternate_Doc, PP_DiscountByRate, PP_Discount_Rate, PP_Discount_Amount, PP_Due_Date, Location_Code, Project_Code, SY_Location_code, Other_Charges_Rate, DueDate_By_Delivered, PP_DueDate_By_Delivered, Ref5, Allow_Discount_Note, Adjustment_Prelabel, Source_Location_Code, Internal_Reference, Web_Status, GST_Amount, Total_Amount_B4_GST, Web_Link_Prelabel, App_DL_Prelabel,ACC_Entry_Reference, Service_Code, Self_Scan_QR) VALUES (46,1,'FST/SI/010077', CONVERT(DATETIME,'16-04-2026',103), CONVERT(DATETIME,'15-06-2026',103), '01/N01',0,3,'060', 'A', '','','','','','','RM',1.00000000,5151.000000,1,312.12,0.0000,0.00,0.0000,0.00,312.12,0,0.00,1, GETDATE(), 1, GETDATE(), GETDATE(),'Y','',1, CONVERT(DATETIME,'16-04-2026 19:32:38 PM',103),'','','N',0.0000,0.00, CONVERT(DATETIME,'15-06-2026',103), 'FST','','',0.0000,'N','Y','','N','','','','',0,312.12,'','','','','')
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.078000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 1.598000ms  app=.Net SqlClient Data Provider
UPDATE PI_Counter SET Counter_No = Counter_No + 1 WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.856000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.065000ms  app=.Net SqlClient Data Provider
SELECT Counter_No FROM PI_Counter WHERE Counter_Name = 'MP_ITEM_NO' AND Company_Code=1
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.167000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010077',196807,'', CONVERT(DATETIME,'01-01-1900',103), 6,'EA',50.00,'A',100.0000,100.0000,1.0000,1.0000,3.4000,0.0680,10.0000,34.68,0.0000,0.00,10.0,34.68,0,0.00,0,312.12,'9557354360065','',3.4000,138.6000,155.0000,0.0000,138.6000,0.0000, CONVERT(DATETIME,'11-08-2026 19:33:36 PM',103),0.0000,'','','O',0.00,0.00,'N','','','EA',3.4000,0,'',1,'',3.4000,0,100.0000,0)
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 2.727000ms  app=.Net SqlClient Data Provider
INSERT INTO MP_Invoice_Item (Company_Code, Location_Code, Invoice_PreLabel, Sequence_No, DO_Prelabel, Due_Date, Sku_No, Uom, Factor, Status, Quantity, Quantity_Loose, Foc, Foc_Loose, Unit_Price, Unit_Price_Basic, Unit_Discount_Rate1, Unit_Discount_Amount1, Unit_Discount_Rate2, Unit_Discount_Amount2, Unit_Discount_Rate, Unit_Discount_Amount, Gross_Amount, Tax_Rate, Tax_Amount, Net_Amount, Plu_No, Remark, Instant_Normal_Selling_Price, Average_Cost, Standard_Cost, Fifo_Cost, Last_Cost, Misc_Cost, Added_Date, Return_Qty, PI_Invoice_No, Source, Stock_Type, Company_Comm_Rate, Promoter_Comm_Rate, Open_Price, Project_Code, SY_Location_Code, CTN_Uom, CTN_Unit_Price, Name_No, Alternate_Description,Item_Sequence,GST_Code, GST_Price,Quantity_Loss,Quantity_Original, Nos) VALUES (1,'FST','FST/SI/010077',196807,'', CONVERT(DATETIME,'01-01-1900',103), 6,'EA',50.00,'A',100.0000,100.0000,1.0000,1.0000,3.4000,0.0680,10.0000,34.68,0.0000,0.00,10.0,34.68,0,0.00,0,312.12,'9557354360065','',3.4000,138.6000,155.0000,0.0000,138.6000,0.0000, CONVERT(DATETIME,'11-08-2026 19:33:36 PM',103),0.0000,'','','O',0.00,0.00,'N','','','EA',3.4000,0,'',1,'',3.4000,0,100.0000,0)
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 1.614000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 5151.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 6
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.034000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock SET Qty_On_Trading = Qty_On_Trading + 5151.000000, Last_Modified_By = 1, LastWriteTimeStamp = GETDATE()  WHERE Company_Code = 1 AND Sku_No = 6
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.076000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 1.235000ms  app=.Net SqlClient Data Provider
Select Location_Code From In_Stock_Location  WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 2.250000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 5151.000000 WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.099000ms  app=.Net SqlClient Data Provider
UPDATE In_Stock_Location SET Qty_On_Trading = Qty_On_Trading + 5151.000000 WHERE Sku_No = 6 AND Company_Code=1 AND Location_Code='FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=0 0.100000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010077' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No)
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=0 0.042000ms  app=.Net SqlClient Data Provider
Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010077' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=0 5.750000ms  app=.Net SqlClient Data Provider
Update In_Stock set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock a1 Inner Join  (  Select a.Company_Code,b.Sku_No,sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010077' AND a.Company_Code=1 Group By a.Company_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No) 
 Update In_Stock_Location set  Nos=ISNULL(Nos,0)+ (a.TotalQty*-1)  From In_Stock_Location a1 Inner Join  (  Select a.Company_Code, b.Location_Code, b.Sku_No, sum(b.Nos) as TotalQty  From MP_Invoice a  Inner Join MP_Invoice_Item b  ON (a.Company_Code=b.Company_Code AND a.Invoice_Prelabel=b.Invoice_Prelabel)  Where b.Nos<>0 AND a.Invoice_Prelabel='FST/SI/010077' AND a.Company_Code=1 Group By a.Company_Code,b.Location_Code,b.Sku_No  ) as a ON (a1.Company_Code=a.Company_Code AND a1.sku_no=a.sku_No AND a1.Location_Code=a.Location_Code)
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 2.156000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

-- [08/11/2026 11:33:39] spid=68 tran=16797959 db=RMS rows=1 0.024000ms  app=.Net SqlClient Data Provider
UPDATE PI_Company_Location SET SI_Running_No = ISNULL(SI_Running_No,0) + 1 WHERE Company_Code=1 AND Location_Code = 'FST'
GO

