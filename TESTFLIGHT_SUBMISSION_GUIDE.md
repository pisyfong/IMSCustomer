# TestFlight Submission Guide for IMS Customer App

## ✅ Pre-Submission Checklist

### 1. **App Configuration Fixed**
- ✅ App name updated to "IMS Customer"
- ✅ Bundle identifier configured
- ✅ Camera permission added (for barcode scanning)
- ✅ Photo library permission added (for PDF sharing)
- ✅ Network security configured

### 2. **Required Apple Developer Account Setup**
Before you can submit to TestFlight, ensure you have:
- [ ] Active Apple Developer Program membership ($99/year)
- [ ] App ID registered in Apple Developer Portal
- [ ] Distribution certificate created
- [ ] Provisioning profile configured

---

## 🌐 Building iOS App from Windows (Using Codemagic)

Since you're on Windows, the easiest way is to use **Codemagic** (free for open source):

### Quick Setup:

1. **Create Codemagic Account**
   - Go to https://codemagic.io
   - Sign up with GitHub/GitLab/Bitbucket

2. **Push Your Code to Git**
   ```bash
   cd c:\Users\J9G0014\Documents\IMScust\IMSCustomer
   git init
   git add .
   git commit -m "Initial commit for iOS build"
   # Push to GitHub/GitLab/Bitbucket
   ```

3. **Connect Repository to Codemagic**
   - In Codemagic dashboard, click "Add application"
   - Select your repository
   - Choose Flutter as framework

4. **Configure iOS Build**
   - Select iOS as platform
   - Add your Apple Developer credentials
   - Upload signing certificates and provisioning profiles
   - Or use Codemagic's automatic code signing

5. **Start Build**
   - Click "Start new build"
   - Wait for build to complete (10-20 minutes)
   - Download IPA or publish directly to TestFlight

### Alternative: Use GitHub Actions

Create `.github/workflows/ios-build.yml`:
```yaml
name: iOS Build
on: [push]
jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter build ios --release --no-codesign
```

---

## 📱 Step-by-Step Submission Process (On Mac)

### Step 1: Configure Xcode Project

**⚠️ IMPORTANT: iOS app building requires macOS with Xcode installed**

Since you're on Windows, you have these options:

**Option 1: Use a Mac (Recommended)**
1. Transfer project to a Mac
2. Open Terminal and navigate to project
3. Run: `open ios/Runner.xcworkspace`

**Option 2: Use Cloud Build Service**
- Codemagic: https://codemagic.io
- Bitrise: https://www.bitrise.io
- GitHub Actions with macOS runner

**Option 3: Remote Mac Access**
- MacStadium: https://www.macstadium.com
- MacinCloud: https://www.macincloud.com

If you have access to a Mac, open the iOS project in Xcode:
```bash
cd /path/to/IMSCustomer
open ios/Runner.xcworkspace
```

2. In Xcode, select **Runner** target and go to **Signing & Capabilities**:
   - **Team**: Select your Apple Developer team
   - **Bundle Identifier**: Use a unique identifier (e.g., `com.yourcompany.imscustomer`)
   - **Signing Certificate**: Automatic signing (recommended) or manual

3. Set deployment target:
   - **Minimum iOS Version**: iOS 12.0 or higher
   - Go to **General** tab → **Deployment Info**

### Step 2: Update Version Number

Current version: `1.0.0+1`

To increment for new builds:
```bash
# Update version in pubspec.yaml
# Format: version: MAJOR.MINOR.PATCH+BUILD_NUMBER
# Example: 1.0.0+2 (increment build number for each submission)
```

### Step 3: Build for Release

1. Clean previous builds:
```bash
flutter clean
flutter pub get
```

2. Build iOS release:
```bash
flutter build ios --release
```

3. If you get errors about missing packages:
```bash
cd ios
pod install
cd ..
flutter build ios --release
```

### Step 4: Archive in Xcode

1. Open Xcode workspace:
```bash
open ios/Runner.xcworkspace
```

2. Select **Any iOS Device (arm64)** as the build destination

3. Go to **Product** → **Archive**

4. Wait for archive to complete (may take 5-10 minutes)

### Step 5: Upload to App Store Connect

1. Once archive completes, the **Organizer** window opens automatically

2. Select your archive and click **Distribute App**

3. Choose **App Store Connect** → **Upload**

4. Select distribution options:
   - ✅ Upload your app's symbols
   - ✅ Manage Version and Build Number (Xcode will handle)

5. Review and click **Upload**

6. Wait for upload to complete (may take 10-30 minutes)

### Step 6: Configure TestFlight in App Store Connect

1. Go to [App Store Connect](https://appstoreconnect.apple.com)

2. Select your app (or create new app if first time)

3. Go to **TestFlight** tab

4. Wait for build to finish processing (Apple's review, 10-60 minutes)

5. Once build shows "Ready to Submit":
   - Add **Test Information**
   - Add **What to Test** notes for testers
   - Add **Beta App Description**

6. Add internal testers:
   - Go to **Internal Testing**
   - Add testers by email
   - They'll receive TestFlight invitation

7. (Optional) Add external testers:
   - Go to **External Testing**
   - Create a test group
   - Add testers
   - Submit for Beta App Review (takes 24-48 hours)

---

## 🔧 Common Issues & Solutions

### Issue 1: "No valid signing identity"
**Solution**: 
- Open Xcode → Preferences → Accounts
- Add your Apple ID
- Download certificates

### Issue 2: "Provisioning profile doesn't match"
**Solution**:
- Use **Automatic Signing** in Xcode
- Or manually create provisioning profile in Apple Developer Portal

### Issue 3: "Build failed - missing pods"
**Solution**:
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter build ios --release
```

### Issue 4: "App uses non-public API"
**Solution**:
- Check for any restricted APIs
- Update dependencies to latest versions
- Review rejection email for specific APIs

### Issue 5: "Missing compliance information"
**Solution**:
- In App Store Connect → App Information
- Set **Export Compliance** to "No" if app doesn't use encryption
- Or provide encryption registration number

---

## 📋 Required App Information

When creating app in App Store Connect, you'll need:

### Basic Information
- **App Name**: IMS Customer
- **Primary Language**: English
- **Bundle ID**: (your bundle identifier)
- **SKU**: (unique identifier, e.g., IMSCUST001)

### App Description
```
IMS Customer is a comprehensive customer management and quotation system designed for sales teams. 

Features:
• Customer database management
• Product inventory browsing with barcode scanning
• Real-time quotation generation
• PDF quotation export and sharing
• Offline-first architecture
• Role-based customer access
• Customer-specific pricing and PLU codes

Perfect for field sales representatives who need quick access to customer information and the ability to generate professional quotations on the go.
```

### Keywords
```
customer management, quotation, sales, inventory, barcode, PDF, CRM
```

### Support URL
- Provide your company website or support page

### Privacy Policy URL
- **Required**: You must provide a privacy policy URL
- Create a simple privacy policy page on your website

---

## 🎯 Quick Command Reference

```bash
# Clean and rebuild
flutter clean && flutter pub get && flutter build ios --release

# Update version (in pubspec.yaml)
version: 1.0.0+2  # Increment build number

# Check for issues
flutter doctor -v

# Run on iOS simulator for testing
flutter run -d ios

# Build for specific iOS version
flutter build ios --release --target-platform ios-arm64
```

---

## 📞 Support Resources

- **Flutter iOS Deployment**: https://docs.flutter.dev/deployment/ios
- **App Store Connect Help**: https://developer.apple.com/help/app-store-connect/
- **TestFlight Help**: https://developer.apple.com/testflight/

---

## ✨ Post-Submission Checklist

After successful upload:
- [ ] Build appears in App Store Connect
- [ ] Build status changes to "Ready to Submit"
- [ ] Test information added
- [ ] Internal testers added
- [ ] TestFlight invitation sent
- [ ] App tested on real device via TestFlight
- [ ] Feedback collected from testers

---

## 🚀 Next Steps After TestFlight

Once testing is complete and app is stable:
1. Submit for App Store Review
2. Provide app screenshots (required sizes)
3. Add app preview video (optional but recommended)
4. Fill in App Store listing information
5. Set pricing and availability
6. Submit for review (7-14 days review time)

---

**Good luck with your TestFlight submission! 🎉**
