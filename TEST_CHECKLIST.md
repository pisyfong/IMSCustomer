# 🧪 Price Edit Permission - Quick Test Checklist

## Pre-Testing Setup

### 1. Database Setup
Run this SQL to create test users with different permissions:

```sql
-- Test User 1: HAS permission to edit prices
INSERT INTO [RMS].[dbo].[PI_User_App] (
    User_ID, 
    Company_Code, 
    SI_Allow_Change_Price,
    SI_Allow_Below_Cost,
    SI_Show_Cost,
    SI_Show_Qty
) VALUES (1, 1, 'Y', 'Y', 'Y', 'Y');

-- Test User 2: NO permission to edit prices
INSERT INTO [RMS].[dbo].[PI_User_App] (
    User_ID, 
    Company_Code, 
    SI_Allow_Change_Price,
    SI_Allow_Below_Cost,
    SI_Show_Cost,
    SI_Show_Qty
) VALUES (2, 1, 'N', 'N', 'N', 'Y');

-- Verify data inserted
SELECT User_ID, Company_Code, SI_Allow_Change_Price, SI_Allow_Below_Cost
FROM [RMS].[dbo].[PI_User_App]
WHERE Company_Code = 1;
```

### 2. Start SignalR Server
```bash
cd c:\Users\J9G0014\CascadeProjects\ims_customer_api_realtime
node server.js
```

**Look for this log:**
```
✅ SignalR Hub registered successfully
Server is running on http://localhost:3000
```

### 3. Run Flutter App
```bash
cd c:\Users\J9G0014\Documents\IMScust\IMSCustomer
flutter run
```

---

## 🧪 Test Scenarios

### ✅ Test 1: User WITH Permission (User ID 1)

#### Step 1: Login & Sync
- [ ] Login as user with `SI_Allow_Change_Price = 'Y'`
- [ ] Trigger app sync (pull to refresh on company page)
- [ ] **Check logs for:**
  ```
  ⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=1...
  ✅ USER APP SETTINGS SYNC: Synced 1 settings
  ⚙️ Permissions - SI_Allow_Change_Price: Y
  ```

#### Step 2: Add Item from Inventory
- [ ] Go to Inventory page
- [ ] Tap any item to open add-to-cart sheet
- [ ] **Verify:** Editable price field appears (small text field with "RM" prefix)
- [ ] **Verify:** Price field is pre-filled with item's price
- [ ] Change the price (e.g., from 10.00 to 15.00)
- [ ] Tap "Add" button
- [ ] **Expected:** Item added with custom price

#### Step 3: Edit Price in Cart
- [ ] Go to Cart page
- [ ] **Verify:** Small edit icon (📝) appears next to each price
- [ ] Tap the edit icon
- [ ] **Expected:** Edit dialog appears
- [ ] Change price (e.g., from 15.00 to 20.00)
- [ ] Tap "Update"
- [ ] **Expected:** Success message: "✅ Price updated successfully"
- [ ] **Verify:** Price updated in cart
- [ ] **Verify:** Subtotal recalculated

#### Step 4: Check Logs
```
🔒 Permission Check: SI_Allow_Change_Price = Y (canChangePrice=true)
📦 CART: Updated price for item ID 123 to RM20.00
```

---

### ❌ Test 2: User WITHOUT Permission (User ID 2)

#### Step 1: Login & Sync
- [ ] Logout and login as user with `SI_Allow_Change_Price = 'N'`
- [ ] Trigger app sync
- [ ] **Check logs for:**
  ```
  ⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=2...
  ⚙️ Permissions - SI_Allow_Change_Price: N
  ```

#### Step 2: Add Item from Inventory
- [ ] Go to Inventory page
- [ ] Tap any item to open add-to-cart sheet
- [ ] **Verify:** NO editable price field appears
- [ ] **Verify:** Only readonly price tag shows
- [ ] Tap "Add" button
- [ ] **Expected:** Item added with default price (no custom price option)

#### Step 3: Try to Edit Price in Cart
- [ ] Go to Cart page
- [ ] **Verify:** Edit icon still appears (for discoverability)
- [ ] Tap the edit icon
- [ ] **Expected:** Error snackbar appears:
  ```
  ❌ You do not have permission to edit prices
  ```
- [ ] **Expected:** Edit dialog does NOT open
- [ ] **Verify:** Price remains unchanged

#### Step 4: Check Logs
```
🔒 Permission Check: SI_Allow_Change_Price = N (canChangePrice=false)
❌ User attempted to edit price without permission
```

---

## 🔍 Debugging Tips

### If permission check always returns false:
1. Check `PI_User_App` table has data for the user
2. Verify `User_ID` matches logged-in user
3. Check sync completed (look for sync success logs)
4. Verify `SI_Allow_Change_Price` column value is exactly 'Y' (uppercase)

### If price field not showing in inventory:
1. Wait for permission check to complete (async)
2. Check for log: `🔒 Permission Check: SI_Allow_Change_Price = ...`
3. Verify user has synced after inserting permission data

### If price not updating in cart:
1. Check Isar transaction logs
2. Verify `CartService.updatePrice()` is being called
3. Look for: `📦 CART: Updated price for item ID...`

---

## 📊 Expected Log Flow

### For Permitted User:
```
=== Login Successful ===
📋 AuthService: User roleId from server = 1
⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=1...
✅ USER APP SETTINGS SYNC: Synced 1 settings
⚙️ Permissions - SI_Allow_Change_Price: Y
🔒 Permission Check: SI_Allow_Change_Price = Y (canChangePrice=true)
📦 CART: Updated price for item ID 123 to RM20.00
✅ Price updated successfully
```

### For Restricted User:
```
=== Login Successful ===
📋 AuthService: User roleId from server = 2
⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=2...
✅ USER APP SETTINGS SYNC: Synced 1 settings
⚙️ Permissions - SI_Allow_Change_Price: N
🔒 Permission Check: SI_Allow_Change_Price = N (canChangePrice=false)
❌ You do not have permission to edit prices
```

---

## ✅ Success Criteria

All checkboxes should pass:
- [ ] Permissions sync during app sync
- [ ] Permitted users see editable price field in add-to-cart sheet
- [ ] Permitted users can edit prices in cart
- [ ] Restricted users see readonly prices in add-to-cart sheet
- [ ] Restricted users get error when trying to edit in cart
- [ ] Price updates persist in cart
- [ ] Subtotals recalculate correctly
- [ ] Works offline after initial sync

---

## 🎯 Quick Verification Command

Check database permissions:
```sql
SELECT 
    u.User_ID,
    u.Login_Name,
    ua.Company_Code,
    ua.SI_Allow_Change_Price,
    CASE 
        WHEN ua.SI_Allow_Change_Price = 'Y' THEN '✅ CAN EDIT'
        ELSE '❌ CANNOT EDIT'
    END as Permission_Status
FROM [RMS].[dbo].[PI_Users] u
LEFT JOIN [RMS].[dbo].[PI_User_App] ua ON u.User_ID = ua.User_ID
WHERE ua.Company_Code = 1;
```

---

## 📞 Need Help?

Refer to:
- `PRICE_EDIT_PERMISSION_GUIDE.md` - Detailed architecture
- `IMPLEMENTATION_COMPLETE.md` - Quick reference

**Happy Testing! 🚀**
