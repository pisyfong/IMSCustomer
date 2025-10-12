# Update Android app name
$androidManifest = "android\app\src\main\AndroidManifest.xml"
$content = Get-Content $androidManifest -Raw
$content = $content.Replace('android:label="my_test_app"', 'android:label="IMScustomer"')
Set-Content $androidManifest -Value $content -NoNewline

Write-Host "✅ Android app name updated to 'IMScustomer'"

# Update iOS app name
$iosInfoPlist = "ios\Runner\Info.plist"
if (Test-Path $iosInfoPlist) {
    $content = Get-Content $iosInfoPlist -Raw
    # Update CFBundleDisplayName if it exists, otherwise it uses CFBundleName
    if ($content -match '<key>CFBundleDisplayName</key>') {
        $content = $content -replace '(<key>CFBundleDisplayName</key>\s*<string>)[^<]*(</string>)', '${1}IMScustomer${2}'
    } else {
        # Add CFBundleDisplayName after CFBundleName
        $content = $content -replace '(<key>CFBundleName</key>\s*<string>[^<]*</string>)', "`$1`n`t<key>CFBundleDisplayName</key>`n`t<string>IMScustomer</string>"
    }
    Set-Content $iosInfoPlist -Value $content -NoNewline
    Write-Host "✅ iOS app name updated to 'IMScustomer'"
} else {
    Write-Host "⚠️ iOS Info.plist not found"
}

Write-Host "`n✅ App name update complete!"
