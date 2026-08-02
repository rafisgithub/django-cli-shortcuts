# Django CLI Shortcuts

Shell functions that wrap common `manage.py` / `pip` / `celery` commands so you can type `run`, `migrate`, `worker`, etc. instead of the full command.

## Windows (PowerShell)

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

Paste the contents of [`PowerShell_profile.ps1`](PowerShell_profile.ps1) into the file, then save it (`Ctrl + S`).

### 4. Verify profile location (optional)
```powershell
Write-Output "Profile location: $PROFILE"
```

### 5. Reload PowerShell

Restart PowerShell, or reload the profile manually:
```powershell
. $PROFILE.CurrentUserAllHosts
```

**Done!** Your Django CLI shortcuts are now ready to use.

---

## Ubuntu / Linux (Bash / Zsh)

### 1. Locate your shell's rc file

- Bash: `~/.bashrc`
- Zsh: `~/.zshrc`

### 2. Add your Django shortcuts

Append the contents of [`bash_profile.sh`](bash_profile.sh) to your rc file:
```bash
cat bash_profile.sh >> ~/.bashrc   # or ~/.zshrc
```

Or open the rc file in an editor and paste the functions in manually:
```bash
nano ~/.bashrc      # or: code ~/.bashrc
```

### 3. Reload your shell

```bash
source ~/.bashrc    # or: source ~/.zshrc
```

### 4. Verify it worked
```bash
type run
```

**Done!** Your Django CLI shortcuts are now ready to use.
