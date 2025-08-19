<#
🐍 Django CLI Shortcuts (PowerShell)

This script provides handy PowerShell functions to speed up Django development.  
Instead of typing long `python manage.py` commands, you can use simple shortcuts like `run`, `migrate`, `superuser`, etc.

-------------------------------------------------------------------
## PowerShell Profile Setup

1. **Check if your profile exists** (run in PowerShell):
   ```powershell
   Test-Path $PROFILE
   ```
   If this returns `False`, create one:
   ```powershell
   New-Item -Path $PROFILE -ItemType File -Force
   ```

2. **Open the profile** (use either option):
   - With Notepad:
     ```powershell
     notepad $PROFILE
     ```
   - With VS Code:
     ```powershell
     code $PROFILE
     ```

3. **Paste your script** into the opened file and save (`Ctrl+S`).

4. **Verify the profile path** (optional):
   ```powershell
   Write-Output "Profile location: $PROFILE"
   ```

5. **Restart PowerShell** or reload with:
   ```powershell
   . $PROFILE
   ```
