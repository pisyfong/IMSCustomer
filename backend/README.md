# User Roles API Server

HTTP API endpoints for fetching PI_User_Role and PI_User_Customer data from RMS database.

## Setup

1. **Install dependencies:**
```bash
cd backend
npm install
```

2. **Configure database connection:**
Edit `user-roles-api.js` and update the `dbConfig` object with your SQL Server details:
```javascript
const dbConfig = {
    user: 'your_username',
    password: 'your_password', 
    server: 'your_server',
    database: 'RMS',
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
};
```

3. **Start the server:**
```bash
npm start
```

## Endpoints

### GET /api/user-roles
Fetches all user roles from `[RMS].[dbo].[PI_User_Role]`

**Response:**
```json
[
  {
    "Role_ID": 1,
    "Description": "Admin",
    "Created_Date": "2024-01-01T00:00:00.000Z",
    "Modified_Date": "2024-01-01T00:00:00.000Z"
  }
]
```

### GET /api/user-customers
Fetches all user-customer mappings from `[RMS].[dbo].[PI_User_Customer]`

**Response:**
```json
[
  {
    "User_Id": 1,
    "Company_Code": 1,
    "Customer": "CUST001",
    "Is_Default": true,
    "Created_Date": "2024-01-01T00:00:00.000Z",
    "Modified_Date": "2024-01-01T00:00:00.000Z"
  }
]
```

### GET /api/user-customers/:roleId
Fetches user-customer mappings for a specific role

**Response:** Same as above, filtered by roleId

### GET /health
Health check endpoint

## Integration with Flutter App

The Flutter app will call these endpoints as HTTP fallback when SignalR methods are not available. The URLs should match:

- `http://192.168.16.12:3001/api/user-roles`
- `http://192.168.16.12:3001/api/user-customers`

Update the Flutter app's SignalR service to use port 3001 for the HTTP fallback, or run this API server on the same port as your existing server.
