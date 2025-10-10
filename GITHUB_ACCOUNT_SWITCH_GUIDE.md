# GitHub Account Switch Guide

## Current Repository Info
- **Current Remote**: https://github.com/syfong95/IMSCustomer.git
- **Current User**: User
- **Current Email**: user@example.com

---

## Option 1: Push to NEW Repository with Different Account (Recommended)

### Step 1: Create New Repository on GitHub
1. Log in to your **other GitHub account**
2. Click **"New repository"**
3. Name it: `IMSCustomer` (or any name you prefer)
4. **Do NOT** initialize with README
5. Click **"Create repository"**

### Step 2: Change Remote URL
```bash
cd c:\Users\J9G0014\Documents\IMScust\IMSCustomer

# Remove old remote
git remote remove origin

# Add new remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/IMSCustomer.git

# Verify
git remote -v
```

### Step 3: Configure Git User for This Repository
```bash
# Set your name for this repository only
git config user.name "Your Name"

# Set your email for this repository only
git config user.email "your.email@example.com"

# Verify
git config user.name
git config user.email
```

### Step 4: Push to New Repository
```bash
# Push to new repository
git push -u origin main

# If prompted for credentials:
# - Username: your GitHub username
# - Password: use Personal Access Token (NOT your password)
```

### Step 5: Create Personal Access Token (if needed)
1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click **"Generate new token"**
3. Select scopes: `repo` (full control of private repositories)
4. Click **"Generate token"**
5. **Copy the token** (you won't see it again!)
6. Use this token as your password when pushing

---

## Option 2: Use Git Credential Manager (Windows)

### Clear Cached Credentials
```bash
# Clear Windows Credential Manager
git credential-manager-core erase https://github.com

# Or manually:
# 1. Open "Credential Manager" in Windows
# 2. Go to "Windows Credentials"
# 3. Find "git:https://github.com"
# 4. Click "Remove"
```

### Push with New Credentials
```bash
git push origin main

# Windows will prompt for credentials
# Enter your other account's username and Personal Access Token
```

---

## Option 3: Add Second Remote (Keep Both)

### Add Second Remote
```bash
# Add second remote with different name
git remote add backup https://github.com/OTHER_USERNAME/IMSCustomer.git

# View all remotes
git remote -v

# Push to original
git push origin main

# Push to backup
git push backup main
```

---

## Option 4: Use SSH Keys (Most Secure)

### Step 1: Generate SSH Key for New Account
```bash
# Generate new SSH key
ssh-keygen -t ed25519 -C "your.email@example.com" -f ~/.ssh/id_ed25519_github_other

# Start SSH agent
eval "$(ssh-agent -s)"

# Add SSH key
ssh-add ~/.ssh/id_ed25519_github_other
```

### Step 2: Add SSH Key to GitHub
1. Copy public key:
```bash
cat ~/.ssh/id_ed25519_github_other.pub
```
2. Go to GitHub → Settings → SSH and GPG keys → New SSH key
3. Paste the key and save

### Step 3: Update Remote to Use SSH
```bash
# Change remote to SSH
git remote set-url origin git@github.com:YOUR_USERNAME/IMSCustomer.git

# Push
git push origin main
```

---

## Quick Commands Reference

### Check Current Configuration
```bash
# Check remote
git remote -v

# Check user config
git config user.name
git config user.email

# Check global config
git config --global user.name
git config --global user.email
```

### Change User for This Repository Only
```bash
git config user.name "New Name"
git config user.email "new.email@example.com"
```

### Change User Globally
```bash
git config --global user.name "New Name"
git config --global user.email "new.email@example.com"
```

### Force Push (if needed)
```bash
# Use with caution!
git push -f origin main
```

---

## Troubleshooting

### Error: "Permission denied"
**Solution**: You're using wrong credentials
- Clear cached credentials
- Use Personal Access Token instead of password

### Error: "Repository not found"
**Solution**: 
- Check repository exists on GitHub
- Check you have access to the repository
- Verify remote URL is correct

### Error: "Authentication failed"
**Solution**:
- Generate Personal Access Token
- Use token as password
- Or set up SSH keys

### Error: "Remote already exists"
**Solution**:
```bash
git remote remove origin
git remote add origin NEW_URL
```

---

## Recommended Workflow

1. **Create new repository** on your other GitHub account
2. **Update remote URL** to point to new repository
3. **Configure user** for this repository only
4. **Create Personal Access Token** on GitHub
5. **Push** using token as password

This keeps your repositories separate and credentials organized!

---

## Next Steps After Pushing

Once pushed to your other account:
1. ✅ Repository is now on your GitHub
2. ✅ Ready for Codemagic integration
3. ✅ Can set up CI/CD
4. ✅ Can collaborate with team
5. ✅ Can build iOS app via Codemagic

**Need help with any step? Let me know which option you'd like to use!**
