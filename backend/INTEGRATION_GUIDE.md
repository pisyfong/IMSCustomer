# Invoice SignalR Integration Guide

## Overview
This guide explains how to add invoice functionality to your existing SignalR hub.

## Files Created
1. `SyncHub_Invoice_Methods.cs` - Contains the two invoice methods to add to your SyncHub

## Integration Steps

### Step 1: Locate Your Existing SyncHub.cs File
Your SignalR server is running on `http://plusintralinkapps.dyndns.org:1194/synchub`

Find your existing `SyncHub.cs` file (likely in your C# .NET project).

### Step 2: Add the Invoice Methods

Open `SyncHub_Invoice_Methods.cs` and copy the two methods:
- `GetInvoices(int companyCode, string customerCode, string searchQuery)`
- `GetInvoiceItems(int companyCode, string invoicePreLabel)`

Paste them into your existing `SyncHub` class, alongside your existing methods like `getQuotes`.

### Step 3: Verify Connection String

Make sure your `_connectionString` variable in the SyncHub class points to your RMS database.

Example:
```csharp
private readonly string _connectionString = "Server=your_server;Database=RMS;User Id=your_user;Password=your_password;";
```

### Step 4: Test the Methods

After adding the methods and restarting your SignalR server, test them:

1. **Test GetInvoices:**
   - Open your Flutter app
   - Navigate to Previous Order page
   - Click the "Invoice" tab
   - Check the console logs for successful data retrieval

2. **Test GetInvoiceItems:**
   - Tap on an invoice card
   - The invoice details should appear

## Method Signatures

### GetInvoices
```csharp
public async Task<List<object>> GetInvoices(int companyCode, string customerCode, string searchQuery)
```

**Parameters:**
- `companyCode` (int): Company code to filter by
- `customerCode` (string): Customer code to filter by (pass empty string "" for all customers)
- `searchQuery` (string): Optional search query for filtering invoices

**Returns:** List of invoice objects from `mp_invoice` table

**Example Call from Flutter:**
```dart
final response = await _signalRService.invoke('getInvoices', [1, 'CUST01', '']);
```

### GetInvoiceItems
```csharp
public async Task<List<object>> GetInvoiceItems(int companyCode, string invoicePreLabel)
```

**Parameters:**
- `companyCode` (int): Company code
- `invoicePreLabel` (string): Invoice pre-label to get items for

**Returns:** List of invoice item objects from `mp_invoice_item` table

**Example Call from Flutter:**
```dart
final response = await _signalRService.invoke('getInvoiceItems', [1, 'INV-2024-001']);
```

## Database Tables

### mp_invoice
Main invoice header table with fields like:
- Invoice_PreLabel
- Invoice_Date
- Customer
- Net_Amount
- Gross_Amount
- Status
- etc.

### mp_invoice_item
Invoice line items table with fields like:
- Sku_No
- Quantity
- Unit_Price
- Net_Amount
- Average_Cost
- Standard_Cost
- etc.

## Troubleshooting

### Issue: "Method not found" error
**Solution:** Make sure you've added the methods to your SyncHub class and restarted the SignalR server.

### Issue: "Connection timeout"
**Solution:** 
1. Check if your SignalR server is running on port 1194
2. Verify the connection string in app_config.dart points to the correct server
3. Check firewall settings

### Issue: No data returned
**Solution:**
1. Verify the database tables `mp_invoice` and `mp_invoice_item` exist
2. Check if there's data for the specified company and customer
3. Review SQL Server logs for any errors

## Console Output

When methods are called successfully, you should see:
```
🔍 SIGNALR HUB: GetInvoices called
   - companyCode: 1
   - customerCode: 'CUST01'
   - searchQuery: ''
✅ SIGNALR HUB: Retrieved 25 invoices
```

## Next Steps

After integration:
1. Test the Invoice tab in the Previous Order page
2. Verify invoice cards display correctly
3. Test the search functionality
4. Optionally add delivery order methods using the same pattern

## Support

If you encounter issues:
1. Check the SignalR server console logs
2. Check the Flutter app console logs
3. Verify database connectivity
4. Ensure table names match your database schema (case-sensitive)
