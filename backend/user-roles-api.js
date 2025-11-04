const express = require('express');
const sql = require('mssql');
const cors = require('cors');

const app = express();
const port = 1194;

// Middleware
app.use(cors());
app.use(express.json());

// Database configuration - update with your actual connection details
const dbConfig = {
    user: 'your_username',
    password: 'your_password',
    server: 'your_server', 
    database: 'RMS',
    options: {
        encrypt: false, // Use true if you're on Azure
        trustServerCertificate: true
    }
};

// Initialize database connection
let pool;

async function initializeDatabase() {
    try {
        pool = await sql.connect(dbConfig);
        console.log('Connected to SQL Server database');
    } catch (err) {
        console.error('Database connection failed:', err);
        process.exit(1);
    }
}

// GET /api/user-roles - Fetch all user roles from PI_User_Role
app.get('/api/user-roles', async (req, res) => {
    try {
        console.log('📡 API: GET /api/user-roles called');
        
        const request = pool.request();
        const query = `
            SELECT 
                Role_ID,
                Description,
                Created_Date,
                Modified_Date
            FROM [RMS].[dbo].[PI_User_Role]
            ORDER BY Role_ID
        `;
        
        const result = await request.query(query);
        
        console.log(`✅ API: Retrieved ${result.recordset.length} user roles`);
        
        // Transform to match expected format
        const roles = result.recordset.map(row => ({
            Role_ID: row.Role_ID,
            Description: row.Description,
            Created_Date: row.Created_Date,
            Modified_Date: row.Modified_Date
        }));
        
        res.json(roles);
        
    } catch (err) {
        console.error('❌ API: Error fetching user roles:', err);
        res.status(500).json({ 
            error: 'Failed to fetch user roles',
            details: err.message 
        });
    }
});

// GET /api/user-customers - Fetch all user-customer mappings from PI_User_Customer
app.get('/api/user-customers', async (req, res) => {
    try {
        console.log('📡 API: GET /api/user-customers called');
        
        const request = pool.request();
        const query = `
            SELECT 
                User_Id,
                Company_Code,
                Customer,
                Is_Default,
                Created_Date,
                Modified_Date
            FROM [RMS].[dbo].[PI_User_Customer]
            ORDER BY User_Id, Company_Code, Customer
        `;
        
        const result = await request.query(query);
        
        console.log(`✅ API: Retrieved ${result.recordset.length} user-customer mappings`);
        
        // Transform to match expected format
        const mappings = result.recordset.map(row => ({
            User_Id: row.User_Id,
            Company_Code: row.Company_Code,
            Customer: row.Customer,
            Is_Default: row.Is_Default,
            Created_Date: row.Created_Date,
            Modified_Date: row.Modified_Date
        }));
        
        res.json(mappings);
        
    } catch (err) {
        console.error('❌ API: Error fetching user-customer mappings:', err);
        res.status(500).json({ 
            error: 'Failed to fetch user-customer mappings',
            details: err.message 
        });
    }
});

// GET /api/user-customers/:roleId - Fetch user-customer mappings for specific role
app.get('/api/user-customers/:roleId', async (req, res) => {
    try {
        const roleId = parseInt(req.params.roleId);
        console.log(`📡 API: GET /api/user-customers/${roleId} called`);
        
        const request = pool.request();
        request.input('roleId', sql.Int, roleId);
        
        const query = `
            SELECT 
                User_Id,
                Company_Code,
                Customer,
                Is_Default,
                Created_Date,
                Modified_Date
            FROM [RMS].[dbo].[PI_User_Customer]
            WHERE User_Id = @roleId
            ORDER BY Company_Code, Customer
        `;
        
        const result = await request.query(query);
        
        console.log(`✅ API: Retrieved ${result.recordset.length} user-customer mappings for role ${roleId}`);
        
        const mappings = result.recordset.map(row => ({
            User_Id: row.User_Id,
            Company_Code: row.Company_Code,
            Customer: row.Customer,
            Is_Default: row.Is_Default,
            Created_Date: row.Created_Date,
            Modified_Date: row.Modified_Date
        }));
        
        res.json(mappings);
        
    } catch (err) {
        console.error('❌ API: Error fetching user-customer mappings for role:', err);
        res.status(500).json({ 
            error: 'Failed to fetch user-customer mappings for role',
            details: err.message 
        });
    }
});

// POST /api/quotations - Save a new quotation to MP_Quote
app.post('/api/quotations', async (req, res) => {
    try {
        console.log('📡 API: POST /api/quotations called');
        const quotation = req.body;
        
        const request = pool.request();
        
        // Add all parameters
        request.input('Company_Code', sql.TinyInt, quotation.Company_Code);
        request.input('Quote_PreLabel', sql.NVarChar(15), quotation.Quote_PreLabel);
        request.input('Master_PreLabel', sql.NVarChar(15), quotation.Master_PreLabel);
        request.input('Quote_Date', sql.DateTime, quotation.Quote_Date);
        request.input('Customer', sql.NVarChar(6), quotation.Customer);
        request.input('Term', sql.NVarChar(4), quotation.Term);
        request.input('Quote_Expiry', sql.DateTime, quotation.Quote_Expiry);
        request.input('Status', sql.Char(1), quotation.Status);
        request.input('Ref1', sql.NVarChar(100), quotation.Ref1);
        request.input('Ref2', sql.NVarChar(100), quotation.Ref2);
        request.input('Ref3', sql.NVarChar(100), quotation.Ref3);
        request.input('Ref4', sql.NVarChar(100), quotation.Ref4);
        request.input('Remark1', sql.NVarChar(300), quotation.Remark1);
        request.input('Remark2', sql.NVarChar(300), quotation.Remark2);
        request.input('Currency', sql.NVarChar(6), quotation.Currency);
        request.input('Rate', sql.Decimal(12, 4), quotation.Rate);
        request.input('Total_Quote_Quantity', sql.Decimal(12, 4), quotation.Total_Quote_Quantity);
        request.input('Total_Quote_Item', sql.SmallInt, quotation.Total_Quote_Item);
        request.input('Gross_Amount', sql.Money, quotation.Gross_Amount);
        request.input('Total_Discount_Rate', sql.Decimal(12, 4), quotation.Total_Discount_Rate);
        request.input('Total_Discount_Amount', sql.Money, quotation.Total_Discount_Amount);
        request.input('Total_Tax_Rate', sql.Decimal(12, 4), quotation.Total_Tax_Rate);
        request.input('Total_Tax_Amount', sql.Money, quotation.Total_Tax_Amount);
        request.input('Net_Amount', sql.Money, quotation.Net_Amount);
        request.input('Other_Charges', sql.Money, quotation.Other_Charges);
        request.input('Location_Code', sql.Char(3), quotation.Location_Code);
        request.input('Project_Code', sql.NVarChar(15), quotation.Project_Code);
        request.input('SY_Location_Code', sql.NVarChar(15), quotation.SY_Location_Code);
        request.input('GST_Amount', sql.Money, quotation.GST_Amount);
        request.input('Total_Amount_B4_GST', sql.Money, quotation.Total_Amount_B4_GST);
        request.input('Quoted_By', sql.Int, quotation.Quoted_By);
        request.input('Attention_Remark', sql.NVarChar(50), quotation.Attention_Remark);
        request.input('latitude', sql.NVarChar(30), quotation.latitude);
        request.input('longitude', sql.NVarChar(30), quotation.longitude);
        
        const query = `
            INSERT INTO [RMS].[dbo].[MP_Quote] (
                Company_Code, Quote_PreLabel, Master_PreLabel, Quote_Date, Customer, Term,
                Quote_Expiry, Status, Ref1, Ref2, Ref3, Ref4, Remark1, Remark2,
                Currency, Rate, Total_Quote_Quantity, Total_Quote_Item, Gross_Amount,
                Total_Discount_Rate, Total_Discount_Amount, Total_Tax_Rate, Total_Tax_Amount,
                Net_Amount, Other_Charges, Location_Code, Project_Code, SY_Location_Code,
                GST_Amount, Total_Amount_B4_GST, Quoted_By, Attention_Remark,
                latitude, longitude, Added_Date
            ) VALUES (
                @Company_Code, @Quote_PreLabel, @Master_PreLabel, @Quote_Date, @Customer, @Term,
                @Quote_Expiry, @Status, @Ref1, @Ref2, @Ref3, @Ref4, @Remark1, @Remark2,
                @Currency, @Rate, @Total_Quote_Quantity, @Total_Quote_Item, @Gross_Amount,
                @Total_Discount_Rate, @Total_Discount_Amount, @Total_Tax_Rate, @Total_Tax_Amount,
                @Net_Amount, @Other_Charges, @Location_Code, @Project_Code, @SY_Location_Code,
                @GST_Amount, @Total_Amount_B4_GST, @Quoted_By, @Attention_Remark,
                @latitude, @longitude, GETDATE()
            )
        `;
        
        await request.query(query);
        
        console.log(`✅ API: Saved quotation ${quotation.Quote_PreLabel}`);
        res.json({ success: true, message: 'Quotation saved successfully' });
        
    } catch (err) {
        console.error('❌ API: Error saving quotation:', err);
        res.status(500).json({ 
            error: 'Failed to save quotation',
            details: err.message 
        });
    }
});

// GET /api/quotations - Fetch quotations from MP_Quote
app.get('/api/quotations', async (req, res) => {
    try {
        const { companyCode, customer, fromDate, toDate } = req.query;
        console.log(`📡 API: GET /api/quotations called with filters:`, { companyCode, customer, fromDate, toDate });
        
        const request = pool.request();
        let query = `SELECT * FROM [RMS].[dbo].[MP_Quote] WHERE 1=1`;
        
        if (companyCode) {
            request.input('companyCode', sql.TinyInt, parseInt(companyCode));
            query += ` AND Company_Code = @companyCode`;
        }
        
        if (customer) {
            request.input('customer', sql.NVarChar(6), customer);
            query += ` AND Customer = @customer`;
        }
        
        if (fromDate) {
            request.input('fromDate', sql.DateTime, new Date(fromDate));
            query += ` AND Quote_Date >= @fromDate`;
        }
        
        if (toDate) {
            request.input('toDate', sql.DateTime, new Date(toDate));
            query += ` AND Quote_Date <= @toDate`;
        }
        
        query += ` ORDER BY Quote_Date DESC`;
        
        const result = await request.query(query);
        
        console.log(`✅ API: Retrieved ${result.recordset.length} quotations`);
        res.json(result.recordset);
        
    } catch (err) {
        console.error('❌ API: Error fetching quotations:', err);
        res.status(500).json({ 
            error: 'Failed to fetch quotations',
            details: err.message 
        });
    }
});

// Health check endpoint
app.get('/health', (req, res) => {
    res.json({ 
        status: 'OK', 
        timestamp: new Date().toISOString(),
        database: pool ? 'Connected' : 'Disconnected'
    });
});

// Start server
async function startServer() {
    await initializeDatabase();
    
    app.listen(port, () => {
        console.log(`🚀 User Roles API server running on port ${port}`);
        console.log(`📡 Endpoints available:`);
        console.log(`   GET http://localhost:${port}/api/user-roles`);
        console.log(`   GET http://localhost:${port}/api/user-customers`);
        console.log(`   GET http://localhost:${port}/api/user-customers/:roleId`);
        console.log(`   GET http://localhost:${port}/health`);
    });
}

// Handle graceful shutdown
process.on('SIGINT', async () => {
    console.log('🛑 Shutting down server...');
    if (pool) {
        await pool.close();
    }
    process.exit(0);
});

startServer().catch(err => {
    console.error('Failed to start server:', err);
    process.exit(1);
});
