// Add these methods to your existing SyncHub.cs file
// This file contains the invoice-related SignalR hub methods

using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

// Add these methods to your SyncHub class:

/// <summary>
/// Get invoices from mp_invoice table
/// </summary>
/// <param name="companyCode">Company code to filter by</param>
/// <param name="customerCode">Customer code to filter by (empty string for all customers)</param>
/// <param name="searchQuery">Optional search query for filtering</param>
/// <returns>List of invoices</returns>
public async Task<List<object>> GetInvoices(int companyCode, string customerCode, string searchQuery)
{
    try
    {
        Console.WriteLine($"🔍 SIGNALR HUB: GetInvoices called");
        Console.WriteLine($"   - companyCode: {companyCode}");
        Console.WriteLine($"   - customerCode: '{customerCode}'");
        Console.WriteLine($"   - searchQuery: '{searchQuery}'");

        var invoices = new List<object>();

        using (var connection = new SqlConnection(_connectionString))
        {
            await connection.OpenAsync();

            var query = @"
                SELECT TOP 100
                    Batch_No,
                    Company_Code,
                    Invoice_PreLabel,
                    Invoice_Date,
                    Due_Date,
                    Customer,
                    Ship_To,
                    Representative_ID,
                    Recur_Invoice,
                    Recur_Deposit,
                    Terms,
                    Status,
                    Alternate_Company,
                    Alternate_Doc,
                    Ref1,
                    Ref2,
                    Ref3,
                    Ref4,
                    Currency,
                    Rate,
                    Remark1,
                    Remark2,
                    Total_Invoice_Entry,
                    Total_Invoice_Quantity,
                    Gross_Amount,
                    Invoice_Discount_Rate,
                    Invoice_Discount_Amount,
                    Invoice_Tax_Rate,
                    Invoice_Tax_Amount,
                    Other_Charges,
                    Net_Amount,
                    Added_By,
                    Added_Date,
                    Voided_By,
                    Voided_Date,
                    Last_Modified_By,
                    LastWriteTimeStamp,
                    Transfer,
                    Link_Account,
                    Way_Bill_No,
                    Delivered_By,
                    Delivered_Date,
                    PP_DiscountByRate,
                    PP_Discount_Rate,
                    PP_Discount_Amount,
                    PP_Due_Date,
                    Location_Code,
                    Project_Code,
                    SY_Location_Code,
                    Other_Charges_Rate,
                    Cancel_Posted,
                    DueDate_By_Delivered,
                    PP_DueDate_By_Delivered,
                    Ref5,
                    Adjustment_Prelabel,
                    Allow_Discount_Note,
                    SR_Prelabel,
                    Source_Location_Code,
                    Web_SI,
                    Internal_Reference,
                    GST_Amount,
                    Total_Amount_B4_GST,
                    ROUNDING_DISCOUNT,
                    Web_Link_Prelabel,
                    Last_Modified_Date,
                    Total_Edit,
                    Total_Print,
                    App_DL_Prelabel,
                    Web_Status,
                    Verify_By,
                    Verify_Date,
                    Pack_By,
                    Pack_Date,
                    Attachment_Path1,
                    Attachment_Path2,
                    Attachment_Date1,
                    Attachment_Date2,
                    latitude,
                    longitude,
                    Pick_No,
                    ACC_Entry_Reference,
                    IMS_Posted_By,
                    IMS_Posted_Date,
                    ACC_Posted_By,
                    ACC_Posted_Date
                FROM [RMS].[dbo].[mp_invoice]
                WHERE Company_Code = @companyCode";

            // Add customer filter if provided
            if (!string.IsNullOrEmpty(customerCode))
            {
                query += " AND Customer = @customerCode";
            }

            // Add search filter if provided
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query += @" AND (
                    Invoice_PreLabel LIKE @searchQuery 
                    OR Customer LIKE @searchQuery 
                    OR Ref1 LIKE @searchQuery 
                    OR Remark1 LIKE @searchQuery
                )";
            }

            query += " ORDER BY Invoice_Date DESC";

            using (var command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@companyCode", companyCode);

                if (!string.IsNullOrEmpty(customerCode))
                {
                    command.Parameters.AddWithValue("@customerCode", customerCode);
                }

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    command.Parameters.AddWithValue("@searchQuery", $"%{searchQuery}%");
                }

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var invoice = new Dictionary<string, object>();

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            var fieldName = reader.GetName(i);
                            var value = reader.IsDBNull(i) ? null : reader.GetValue(i);
                            invoice[fieldName] = value;
                        }

                        invoices.Add(invoice);
                    }
                }
            }
        }

        Console.WriteLine($"✅ SIGNALR HUB: Retrieved {invoices.Count} invoices");
        return invoices;
    }
    catch (Exception ex)
    {
        Console.WriteLine($"❌ SIGNALR HUB: Error in GetInvoices: {ex.Message}");
        Console.WriteLine($"   Stack trace: {ex.StackTrace}");
        throw;
    }
}

/// <summary>
/// Get invoice items from mp_invoice_item table
/// </summary>
/// <param name="companyCode">Company code</param>
/// <param name="invoicePreLabel">Invoice pre-label to get items for</param>
/// <returns>List of invoice items</returns>
public async Task<List<object>> GetInvoiceItems(int companyCode, string invoicePreLabel)
{
    try
    {
        Console.WriteLine($"🔍 SIGNALR HUB: GetInvoiceItems called");
        Console.WriteLine($"   - companyCode: {companyCode}");
        Console.WriteLine($"   - invoicePreLabel: '{invoicePreLabel}'");

        var items = new List<object>();

        using (var connection = new SqlConnection(_connectionString))
        {
            await connection.OpenAsync();

            var query = @"
                SELECT 
                    Company_Code,
                    Invoice_PreLabel,
                    Sequence_No,
                    Due_Date,
                    DO_PreLabel,
                    Sku_No,
                    Uom,
                    Factor,
                    Status,
                    Quantity,
                    Quantity_Loose,
                    Foc,
                    Foc_Loose,
                    Unit_Price,
                    Unit_Price_Basic,
                    Unit_Discount_Rate,
                    Unit_Discount_Amount,
                    Gross_Amount,
                    Tax_Rate,
                    Tax_Amount,
                    Net_Amount,
                    Plu_No,
                    Remark,
                    Instant_Normal_Selling_Price,
                    Average_Cost,
                    Standard_Cost,
                    Fifo_Cost,
                    Last_Cost,
                    Cancelled_By,
                    Cancelled_Date,
                    Location_Code,
                    Batch_No,
                    Added_Date,
                    Return_Qty,
                    PI_Invoice_No,
                    Unit_Discount_Rate2,
                    Unit_Discount_Amount2,
                    Source,
                    Unit_Discount_Rate1,
                    Unit_Discount_Amount1,
                    Stock_Type,
                    Company_Comm_Rate,
                    Promoter_Comm_Rate,
                    Open_Price,
                    Project_Code,
                    SY_Location_Code,
                    Misc_Cost,
                    Default_Plu,
                    CTN_Uom,
                    CTN_Unit_Price,
                    PTS3_B4_Average_Cost,
                    PTS3_B4_Standard_Cost,
                    PTS3_B4_Last_Cost,
                    PTS3_B4_Fifo_Cost,
                    PTS3_AF_Average_Cost,
                    PTS3_AF_Standard_Cost,
                    PTS3_AF_Last_Cost,
                    PTS3_AF_Fifo_Cost,
                    Name_No,
                    Alternate_Description,
                    Item_Sequence,
                    GST_Code,
                    GST_Price,
                    Old_Standard_Cost,
                    Old_Last_Cost,
                    Old_Average_Cost,
                    Old_Fifo_Cost,
                    Change_Price_Remark,
                    Quantity_Loss,
                    Quantity_Original,
                    Nos
                FROM [RMS].[dbo].[mp_invoice_item]
                WHERE Company_Code = @companyCode 
                AND Invoice_PreLabel = @invoicePreLabel
                ORDER BY Sequence_No";

            using (var command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@companyCode", companyCode);
                command.Parameters.AddWithValue("@invoicePreLabel", invoicePreLabel);

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var item = new Dictionary<string, object>();

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            var fieldName = reader.GetName(i);
                            var value = reader.IsDBNull(i) ? null : reader.GetValue(i);
                            item[fieldName] = value;
                        }

                        items.Add(item);
                    }
                }
            }
        }

        Console.WriteLine($"✅ SIGNALR HUB: Retrieved {items.Count} invoice items");
        return items;
    }
    catch (Exception ex)
    {
        Console.WriteLine($"❌ SIGNALR HUB: Error in GetInvoiceItems: {ex.Message}");
        Console.WriteLine($"   Stack trace: {ex.StackTrace}");
        throw;
    }
}
