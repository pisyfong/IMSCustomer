# Server Update Required: Invoice Date Filter

## Overview
The client now sends a date filter when requesting invoices to limit data size. The server needs to be updated to accept and use this parameter.

## Changes Required in Server (Node.js SignalR Hub)

### Update `getInvoices` Method

**Current signature:**
```javascript
async getInvoices(companyCode, customerCode, searchQuery)
```

**New signature:**
```javascript
async getInvoices(companyCode, customerCode, searchQuery, startDate)
```

### Implementation Example

```javascript
// In your SignalR hub (e.g., synchub.js or similar)
hub.on('getInvoices', async (companyCode, customerCode, searchQuery, startDate) => {
  try {
    console.log('📋 getInvoices called:', { 
      companyCode, 
      customerCode, 
      searchQuery,
      startDate 
    });

    // Parse the startDate (ISO 8601 string from client)
    const filterDate = startDate ? new Date(startDate) : null;
    
    // Build SQL query with date filter
    let query = `
      SELECT * FROM mp_invoice 
      WHERE Company_Code = @companyCode
    `;
    
    const params = [
      { name: 'companyCode', type: sql.Int, value: companyCode }
    ];

    // Add customer filter
    if (customerCode && customerCode.trim() !== '') {
      query += ` AND Customer = @customerCode`;
      params.push({ name: 'customerCode', type: sql.VarChar, value: customerCode });
    }

    // Add date filter (last 365 days by default)
    if (filterDate) {
      query += ` AND Invoice_Date >= @startDate`;
      params.push({ name: 'startDate', type: sql.DateTime, value: filterDate });
    }

    // Add search filter
    if (searchQuery && searchQuery.trim() !== '') {
      query += ` AND (
        Invoice_PreLabel LIKE @search 
        OR Customer LIKE @search 
        OR Ref1 LIKE @search
        OR Remark1 LIKE @search
      )`;
      params.push({ name: 'search', type: sql.VarChar, value: `%${searchQuery}%` });
    }

    // Order by date descending
    query += ` ORDER BY Invoice_Date DESC`;

    // Execute query
    const request = pool.request();
    params.forEach(p => request.input(p.name, p.type, p.value));
    
    const result = await request.query(query);
    
    console.log(`✅ Found ${result.recordset.length} invoices`);
    return result.recordset;
    
  } catch (error) {
    console.error('❌ Error in getInvoices:', error);
    throw error;
  }
});
```

## Benefits

1. **Reduced Data Transfer**: Only fetches invoices from last 365 days (configurable)
2. **Faster Queries**: SQL date filter is more efficient than fetching all data
3. **Better Performance**: Less data to parse and cache on client
4. **Scalability**: Works well even with years of invoice data

## Testing

After updating the server:

1. Restart the Node.js server
2. Run the Flutter app
3. Check logs for: `daysBack: 365 (from 2024-XX-XX...)`
4. Verify only recent invoices are returned
5. Check that invoice items load correctly

## Default Behavior

- **Client default**: 365 days back from current date
- **Server should**: Accept `startDate` parameter and filter `Invoice_Date >= startDate`
- **Backward compatibility**: If `startDate` is null/undefined, fetch all invoices (old behavior)

## Database Table

**Table**: `mp_invoice`
**Date Column**: `Invoice_Date` (DateTime)
**Filter**: `WHERE Invoice_Date >= @startDate`
