# 🏗️ Complete Permission System Architecture

## 🔄 Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                        SQL Server Database                          │
├─────────────────────────────────────────────────────────────────────┤
│  PI_Users                 PI_User_App              PI_User_Customer │
│  ┌──────────┐           ┌──────────────┐          ┌──────────────┐ │
│  │ User_ID  │◄──────────┤ User_ID      │          │ User_Id      │ │
│  │ Role_ID  │           │ Company_Code │          │ Customer     │ │
│  └──────────┘           │ SI_Allow_... │          │ Company_Code │ │
│                         └──────────────┘          └──────────────┘ │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
                    ┌───────────────────────────┐
                    │   SignalR Server (Node)   │
                    ├───────────────────────────┤
                    │ • getUserAppSettings()    │
                    │ • getUserRoles()          │
                    │ • getUserCustomers()      │
                    └───────────────────────────┘
                                    │
                                    ▼
                    ┌───────────────────────────┐
                    │   Flutter App (Dart)      │
                    └───────────────────────────┘
                                    │
            ┌───────────────────────┼───────────────────────┐
            │                       │                       │
            ▼                       ▼                       ▼
    ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
    │ Sync Service │      │ Auth Service │      │ Local Isar   │
    │              │      │              │      │   Database   │
    │ Downloads    │◄─────┤ Current User │      │              │
    │ Permissions  │      │ Role ID      │      │ UserAppSet.. │
    └──────────────┘      └──────────────┘      │ UserRole     │
            │                                    │ UserCustomer │
            │                                    └──────────────┘
            ▼
    ┌──────────────────────────────────────────┐
    │   UserAppSettingsService                 │
    │   (Permission Checking Layer)            │
    ├──────────────────────────────────────────┤
    │ • canChangePrice()                       │
    │ • canSellBelowCost()                     │
    │ • canAddFoc()                            │
    │ • getAllPermissions()                    │
    └──────────────────────────────────────────┘
                      │
        ┌─────────────┴─────────────┐
        │                           │
        ▼                           ▼
┌──────────────┐            ┌──────────────┐
│  Cart Page   │            │ Inventory    │
│              │            │  Add Sheet   │
│ Edit Icon 📝 │            │              │
│ Edit Dialog  │            │ Price Field  │
└──────────────┘            └──────────────┘
```

---

## 🎯 Complete User Journey

### Journey 1: User WITH Permission (SI_Allow_Change_Price = 'Y')

```
1. 👤 User Login
   └─> AuthService.login()
       └─> Server returns User_ID, Role_ID
           └─> Stored in CurrentLogin (Isar)

2. 🔄 App Sync
   └─> EnhancedSyncService.performSync()
       ├─> _syncUserRolesAndCustomers()
       │   └─> Syncs role mappings
       └─> _syncUserAppSettings()
           └─> Fetches PI_User_App for User_ID
               └─> Stores in local Isar
               
   📋 Logs:
   ✅ USER APP SETTINGS SYNC: Synced 1 settings
   ⚙️ Permissions - SI_Allow_Change_Price: Y

3. 📦 Add Item from Inventory
   └─> User taps item
       └─> Bottom sheet opens
           └─> UserAppSettingsService.canChangePrice()
               ├─> Checks local Isar database
               └─> Returns: true
           └─> ✅ Editable price field appears
               └─> Pre-filled with item price
               └─> User changes price: 10.00 → 15.00
                   └─> Taps "Add"
                       └─> _addToCart(customGstPrice: 15.00)
                           └─> Item added with custom price

4. 🛒 Edit Price in Cart
   └─> User goes to cart
       └─> Sees edit icon 📝 next to price
           └─> Taps icon
               └─> UserAppSettingsService.canChangePrice()
                   └─> Returns: true
                       └─> ✅ Edit dialog opens
                           └─> User changes: 15.00 → 20.00
                               └─> CartService.updatePrice(20.00)
                                   └─> Updates gstPrice & unitPrice
                                       └─> Saves to Isar
                                       
   📋 Logs:
   🔒 Permission Check: SI_Allow_Change_Price = Y (canChangePrice=true)
   📦 CART: Updated price for item ID 123 to RM20.00
   
   💚 Success: "✅ Price updated successfully"
```

---

### Journey 2: User WITHOUT Permission (SI_Allow_Change_Price = 'N')

```
1. 👤 User Login
   └─> Same as above

2. 🔄 App Sync
   └─> EnhancedSyncService.performSync()
       └─> _syncUserAppSettings()
           └─> Fetches PI_User_App for User_ID
               
   📋 Logs:
   ✅ USER APP SETTINGS SYNC: Synced 1 settings
   ⚙️ Permissions - SI_Allow_Change_Price: N  ⚠️

3. 📦 Add Item from Inventory
   └─> User taps item
       └─> Bottom sheet opens
           └─> UserAppSettingsService.canChangePrice()
               └─> Returns: false
           └─> ❌ NO editable price field
               └─> Only readonly price tag shows
                   └─> User taps "Add"
                       └─> _addToCart(customGstPrice: null)
                           └─> Item added with default price

4. 🛒 Try to Edit Price in Cart
   └─> User goes to cart
       └─> Sees edit icon 📝 next to price
           └─> Taps icon
               └─> UserAppSettingsService.canChangePrice()
                   └─> Returns: false
                       └─> ❌ Error snackbar appears
                       
   📋 Logs:
   🔒 Permission Check: SI_Allow_Change_Price = N (canChangePrice=false)
   
   ❌ Error: "You do not have permission to edit prices"
   └─> Edit dialog does NOT open
   └─> Price remains unchanged
```

---

## 🔐 Permission Matrix

| User Type | SI_Allow_Change_Price | Can Edit in Add Sheet | Can Edit in Cart |
|-----------|----------------------|---------------------|-----------------|
| Admin     | Y                    | ✅ YES              | ✅ YES          |
| Manager   | Y                    | ✅ YES              | ✅ YES          |
| Sales     | N                    | ❌ NO               | ❌ NO (Error)   |
| Guest     | null                 | ❌ NO               | ❌ NO (Error)   |

---

## 🧩 Component Interaction

```
┌──────────────────────────────────────────────────────────┐
│                    Cart Page UI                          │
│  ┌────────────────────────────────────────────────┐      │
│  │  Item: ABC Widget          RM 15.00 📝 [Edit]  │      │
│  │  ────────────────────────────────────────────  │      │
│  │  Tap Edit Icon ────────┐                       │      │
│  └────────────────────────│───────────────────────┘      │
└─────────────────────────────┼────────────────────────────┘
                              │
                              ▼
            ┌─────────────────────────────────┐
            │  _showEditPriceDialog()         │
            │  ┌───────────────────────────┐  │
            │  │ Check Permission          │  │
            │  │ ▼                         │  │
            │  │ UserAppSettingsService    │  │
            │  │   .canChangePrice()       │  │
            │  │ ▼                         │  │
            │  │ Query Isar Database       │  │
            │  │ ▼                         │  │
            │  │ Return: true/false        │  │
            │  └───────────────────────────┘  │
            └─────────────────────────────────┘
                      │            │
            ┌─────────┘            └─────────┐
            │ true                            │ false
            ▼                                 ▼
    ┌───────────────┐              ┌─────────────────┐
    │ Show Dialog   │              │ Show Error      │
    │ ┌───────────┐ │              │ "You do not     │
    │ │ Price:    │ │              │  have           │
    │ │ [____]    │ │              │  permission"    │
    │ │           │ │              └─────────────────┘
    │ │ [Update]  │ │
    │ └───────────┘ │
    └───────────────┘
            │
            ▼
    ┌───────────────┐
    │ CartService   │
    │ .updatePrice()│
    └───────────────┘
            │
            ▼
    ┌───────────────┐
    │ Isar Database │
    │ (CartItem)    │
    └───────────────┘
```

---

## 📊 Database Schema Relationship

```sql
-- User has role and permissions
PI_Users
├─ User_ID (PK)
├─ Login_Name
├─ Role_ID ─────────┐
└─ ...              │
                    │
                    ▼
         PI_User_Role (Role definitions)
         ├─ Role_ID (PK)
         ├─ Role_Name
         └─ Description
         
PI_Users.User_ID ───────┐
                        │
                        ▼
              PI_User_App (Permissions per user/company)
              ├─ User_ID (FK)
              ├─ Company_Code
              ├─ SI_Allow_Change_Price ⭐⭐ KEY FIELD
              ├─ SI_Allow_Below_Cost
              ├─ SI_Show_Cost
              └─ ... (15+ permission fields)

PI_Users.Role_ID ───────┐
                        │
                        ▼
              PI_User_Customer (Role→Customer mapping)
              ├─ User_Id (Actually Role_ID!)
              ├─ Company_Code
              ├─ Customer
              └─ Is_Default
```

---

## 🎯 Key Design Decisions

### 1. **Offline-First Architecture**
- Permissions cached in Isar after sync
- No network required after initial download
- Instant permission checks

### 2. **Service-Based Separation**
- `UserAppSettingsService` - Pure permission logic
- `CartService` - Data manipulation
- `UI Components` - Presentation only

### 3. **Permission Check Location**
```dart
// Check happens at ACTION time, not render time
onTap: () async {
  final canEdit = await settingsService.canChangePrice();
  if (canEdit) {
    showEditDialog();
  } else {
    showError();
  }
}
```

### 4. **Defensive Defaults**
- Permission missing? → Default to NO
- Database error? → Default to NO
- Null values? → Treat as NO

### 5. **Clear User Feedback**
- Edit icon visible = feature exists (discoverability)
- Permission denied = clear error message
- Success = confirmation snackbar

---

## 🔮 Future Extensions

This architecture makes it easy to add:

```dart
// Add new permission check
if (await settingsService.canSellBelowCost()) {
  // Allow discount below cost
}

if (await settingsService.canAddFoc()) {
  // Show FOC button
}

if (await settingsService.shouldShowCost()) {
  // Display cost column
}
```

All permissions are already synced and stored!

---

## ✅ Summary

The system provides:
- ✅ **Dynamic** - Controlled by database
- ✅ **Secure** - Permission checked before action
- ✅ **Offline** - Works without network
- ✅ **Extensible** - Easy to add new permissions
- ✅ **User-Friendly** - Clear feedback
- ✅ **Maintainable** - Clean architecture

**The entire flow is production-ready!** 🚀
