# Price Edit Permission System - Implementation Guide

## 📋 Overview

This system integrates the `PI_User_App` database table to control user permissions, with a focus on price editing capabilities controlled by the `SI_Allow_Change_Price` field.

---

## 🗄️ Database Table: PI_User_App

### Table Structure
| Column | Type | Description |
|--------|------|-------------|
| `User_ID` | int | User identifier |
| `Company_Code` | tinyint | Company code |
| `SI_Allow_Change_Price` | char(1) | **'Y' = Allow price editing, 'N' or NULL = Deny** |
| `SI_Allow_Below_Cost` | char(1) | Allow selling below cost |
| `SI_Allow_Exceed_Qty` | char(1) | Allow exceeding quantity limits |
| `SI_Allow_Foc` | char(1) | Allow FOC (Free of Charge) items |
| `SI_Show_Qty` | char(1) | Show quantity in UI |
| `SI_Show_Cost` | char(1) | Show cost in UI |
| `SI_All_Order_View` | char(1) | View all orders permission |
| `SI_All_Order_Edit` | char(1) | Edit all orders permission |

### Example Data Setup
```sql
-- Grant full permissions to User ID 1 for Company 1
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price, SI_Allow_Below_Cost, SI_Show_Cost)
VALUES (1, 1, 'Y', 'Y', 'Y');

-- Restrict User ID 2 from editing prices
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price)
VALUES (2, 1, 'N');
```

---

## 🏗️ Architecture

### 1. **Isar Model** (`lib/models/user_app_settings.dart`)
- Stores all `PI_User_App` fields locally
- Provides helper getters:
  ```dart
  bool get canChangePrice => siAllowChangePrice == 'Y';
  bool get canSellBelowCost => siAllowBelowCost == 'Y';
  bool get canAddFoc => siAllowFoc == 'Y';
  // ... etc
  ```

### 2. **SignalR Server Method** (`server.js`)
```javascript
async getUserAppSettings(context, params = {}) {
  // Queries PI_User_App by User_ID and Company_Code
  // Returns permission settings for current user
}
```

### 3. **Sync Service** (`lib/services/enhanced_sync_service.dart`)
- `_syncUserAppSettings()` automatically syncs permissions during app sync
- Logs permissions for debugging:
  ```
  ⚙️ Permissions - SI_Allow_Change_Price: Y
  ⚙️ Permissions - SI_Allow_Below_Cost: N
  ```

### 4. **Permission Service** (`lib/services/user_app_settings_service.dart`)
Centralized permission checking:
```dart
// Check if user can edit prices
final canEdit = await UserAppSettingsService().canChangePrice(companyCode: 1);

// Get all permissions at once
final permissions = await UserAppSettingsService().getAllPermissions(companyCode: 1);
```

### 5. **UI Integration**

#### **Cart Page** (`lib/pages/cart_page.dart`)
- **Clickable edit icon** next to each price
- Checks permission before showing edit dialog
- Blocks with error message if permission denied:
  ```
  ❌ You do not have permission to edit prices
  ```

#### **Inventory Add-to-Cart Sheet** (`lib/inventory_page.dart`)
- **Editable price field** appears only if `SI_Allow_Change_Price = 'Y'`
- Price field is hidden for users without permission
- Custom price is passed to cart when adding items

---

## 🎯 How It Works

### Step-by-Step Flow

1. **User Logs In**
   - App syncs user data from `PI_Users` table
   - Fetches `Role_ID` and stores it locally

2. **App Performs Sync**
   - `EnhancedSyncService._syncUserAppSettings()` called
   - Queries `PI_User_App` for logged-in user
   - Stores permissions in local Isar database
   - Permissions now work **offline**

3. **User Adds Item to Cart from Inventory**
   - Bottom sheet checks permission
   - **If `SI_Allow_Change_Price = 'Y'`:** Shows editable price field
   - **If `SI_Allow_Change_Price = 'N'`:** Only shows readonly price tag
   - User can modify price before adding

4. **User Views Cart**
   - Each item shows price with small edit icon 📝
   - User taps edit icon
   - System checks permission:
     - **Permitted:** Shows edit dialog with price input
     - **Denied:** Shows error snackbar

5. **Price Update**
   - If permitted, user enters new price
   - `CartService.updatePrice()` updates both `gstPrice` and `unitPrice`
   - Changes persist in Isar database

---

## 🔧 Testing Guide

### 1. **Setup Test Users**
```sql
-- User 1: Full permissions
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price)
VALUES (1, 1, 'Y');

-- User 2: No price edit permission
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price)
VALUES (2, 1, 'N');
```

### 2. **Test Scenarios**

#### ✅ **Test 1: User WITH Permission**
1. Login as User 1
2. Perform sync (permissions downloaded)
3. Add item to cart from inventory
   - **Expected:** Price field is editable in add sheet
4. Go to cart page
5. Tap edit icon next to price
   - **Expected:** Edit dialog appears
6. Change price and save
   - **Expected:** Price updates successfully

#### ❌ **Test 2: User WITHOUT Permission**
1. Login as User 2
2. Perform sync
3. Add item to cart from inventory
   - **Expected:** Only readonly price tag shown (no edit field)
4. Go to cart page
5. Tap edit icon next to price
   - **Expected:** Error message: "You do not have permission to edit prices"

### 3. **Debug Logs to Check**
```
⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=1...
✅ USER APP SETTINGS SYNC: Synced 1 settings
⚙️ Permissions - SI_Allow_Change_Price: Y
🔒 Permission Check: SI_Allow_Change_Price = Y (canChangePrice=true)
📦 CART: Updated price for item ID 123 to RM45.50
```

---

## 📝 Code Examples

### Check Permission in Your Code
```dart
import '../services/user_app_settings_service.dart';

final settingsService = UserAppSettingsService();

// Check price edit permission
if (await settingsService.canChangePrice(companyCode: companyCode)) {
  // Show price editing UI
} else {
  // Show readonly price
}

// Check multiple permissions
final permissions = await settingsService.getAllPermissions(companyCode: companyCode);
print('Can edit prices: ${permissions['canChangePrice']}');
print('Can sell below cost: ${permissions['canSellBelowCost']}');
```

### Update Price in Cart
```dart
import '../services/cart_service.dart';

final cartService = CartService();
await cartService.updatePrice(cartItemId, newGstPrice);
```

---

## 🚀 Deployment Checklist

- [x] 1. `PI_User_App` table exists with correct schema
- [x] 2. SignalR server has `getUserAppSettings()` method
- [x] 3. Isar schema generated (`user_app_settings.g.dart`)
- [x] 4. Permission service implemented
- [x] 5. Cart page has price editing with permission check
- [x] 6. Inventory page respects permissions
- [ ] 7. Test with real users
- [ ] 8. Populate `PI_User_App` table with user permissions
- [ ] 9. Restart SignalR server
- [ ] 10. Deploy Flutter app

---

## 🐛 Troubleshooting

### Issue: "Permission check always returns false"
**Solution:** 
- Check if `PI_User_App` table has data for the user
- Verify `User_ID` matches the logged-in user
- Ensure sync completed successfully (check logs)

### Issue: "Price field not showing in inventory sheet"
**Solution:**
- Permission check is async - wait for `isCheckingPermission = false`
- Check logs for: `🔒 Permission Check: SI_Allow_Change_Price = ...`

### Issue: "Price not updating in cart"
**Solution:**
- Verify `CartService.updatePrice()` is being called
- Check Isar transaction logs: `📦 CART: Updated price...`

---

## 📚 Related Files

| File | Purpose |
|------|---------|
| `lib/models/user_app_settings.dart` | Isar model for permissions |
| `lib/services/user_app_settings_service.dart` | Permission checking service |
| `lib/services/enhanced_sync_service.dart` | Syncs permissions from server |
| `lib/services/cart_service.dart` | Cart operations including price update |
| `lib/pages/cart_page.dart` | Cart UI with price editing |
| `lib/inventory_page.dart` | Inventory with add-to-cart price editing |
| `server.js` | SignalR method `getUserAppSettings()` |

---

## 🎉 Summary

The system provides **role-based price editing control** with:
- ✅ Database-driven permissions
- ✅ Offline-first architecture
- ✅ Permission checks in UI
- ✅ Clean separation of concerns
- ✅ Easy to extend for other permissions

Any changes to `PI_User_App` table automatically reflect after next sync!
