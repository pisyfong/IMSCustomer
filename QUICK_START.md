# ⚡ Quick Start Guide - Price Edit Permissions

## 🚀 Get Started in 3 Steps

### Step 1: Setup Database (2 minutes)
```bash
# Run the SQL script in SQL Server Management Studio
# File: setup_permissions.sql
```

Or manually:
```sql
-- Give User 1 permission to edit prices
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price)
VALUES (1, 1, 'Y');

-- Deny User 2 permission
INSERT INTO PI_User_App (User_ID, Company_Code, SI_Allow_Change_Price)
VALUES (2, 1, 'N');
```

### Step 2: Start Server (30 seconds)
```bash
# Terminal 1: Start SignalR server
cd c:\Users\J9G0014\CascadeProjects\ims_customer_api_realtime
node server.js

# Look for: ✅ SignalR Hub registered successfully
```

### Step 3: Run App (1 minute)
```bash
# Terminal 2: Run Flutter app
cd c:\Users\J9G0014\Documents\IMScust\IMSCustomer
flutter run

# App will auto-sync permissions on login
```

---

## 🎯 Quick Test

1. **Login** as User 1 (has permission)
2. **Sync** app (pull to refresh)
3. **Add item** from inventory
   - ✅ You'll see editable price field
4. **Go to cart** and tap edit icon 📝
   - ✅ Dialog opens, you can edit price

---

## 📁 Key Files Created

| File | Purpose |
|------|---------|
| `lib/models/user_app_settings.dart` | Permission model |
| `lib/services/user_app_settings_service.dart` | Permission checks |
| `setup_permissions.sql` | Database setup |
| `TEST_CHECKLIST.md` | Detailed testing guide |
| `SYSTEM_ARCHITECTURE.md` | Architecture diagrams |

---

## 🔍 Check Logs

**Permission synced successfully:**
```
⚙️ USER APP SETTINGS SYNC: Synced 1 settings
⚙️ Permissions - SI_Allow_Change_Price: Y
```

**Permission check passed:**
```
🔒 Permission Check: SI_Allow_Change_Price = Y (canChangePrice=true)
```

**Price updated:**
```
📦 CART: Updated price for item ID 123 to RM20.00
✅ Price updated successfully
```

---

## ❓ Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Price field not showing | Wait for sync, check logs for permission sync |
| Always getting "no permission" error | Check `PI_User_App` table has data for user |
| Server not connecting | Verify SignalR server is running on port 3000 |

---

## 📞 Need Help?

- Detailed Guide: `PRICE_EDIT_PERMISSION_GUIDE.md`
- Test Checklist: `TEST_CHECKLIST.md`
- Architecture: `SYSTEM_ARCHITECTURE.md`

---

## ✅ You're Ready!

The system is **fully implemented and tested**. Just run the 3 steps above and you're good to go! 🎉

**Key Feature:** Users with `SI_Allow_Change_Price = 'Y'` can edit prices both:
1. ✅ When adding items (in add-to-cart sheet)
2. ✅ In the cart (via edit icon)

**Happy Coding! 🚀**
