# PowerShell Profile Setup

### 1. Check if your PowerShell profile exists
```powershell
Test-Path $PROFILE.CurrentUserAllHosts
```

If this returns `False`, create the profile file:
```powershell
New-Item -Path $PROFILE.CurrentUserAllHosts -ItemType File -Force
```

### 2. Open the profile file

You can open it using one of the following editors:

- **Notepad**
  ```powershell
  notepad $PROFILE.CurrentUserAllHosts
  ```

- **VS Code**
  ```powershell
  code $PROFILE.CurrentUserAllHosts
  ```

- **Antigravity**
  ```powershell
  antigravity $PROFILE.CurrentUserAllHosts
  ```

### 3. Add your Django shortcuts

Paste your custom PowerShell functions into the file, then save it (`Ctrl + S`).

### 4. Verify profile location (optional)
```powershell
Write-Output "Profile location: $PROFILE"
```

### 5. Reload PowerShell

Restart PowerShell, or reload the profile manually:
```powershell
. $PROFILE.CurrentUserAllHosts
```

 **Done!**

Your Django CLI shortcuts are now ready to use.
