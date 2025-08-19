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

> 💡 Note: The `. $PROFILE` command reloads your profile without restarting the terminal.

-------------------------------------------------------------------
📦 Available Commands

 run [port]        → python manage.py runserver 0.0.0.0:[port]
 seed              → python manage.py seed
 flush             → python manage.py flush
 superuser         → python manage.py createsuperuser
 migrations [...]  → python manage.py makemigrations
 migrate [...]     → python manage.py migrate
 collectstatic     → python manage.py collectstatic
 shell             → python manage.py shell
 activate [env]    → .\venv\Scripts\activate (default: venv)
 freeze [file]     → pip freeze > requirements.txt
 requirements [f]  → pip install -r requirements.txt
 venv [name]       → python -m venv venv

-------------------------------------------------------------------
💡 Examples

 run               # starts server on default (127.0.0.1:8000)
 run 9000          # starts server on port 9000
 migrate           # applies migrations
 superuser         # creates a Django superuser
 activate          # activates default "venv"
 activate myenv    # activates a custom env "myenv"
 freeze            # saves dependencies to requirements.txt
 requirements      # installs from requirements.txt
 venv myenv        # creates a virtualenv named myenv
#>

# --------------------------
# Django CLI Shortcuts
# --------------------------

function run {
    param([string]$port)
    if ($port) {
        python manage.py runserver 0.0.0.0:$port
    }
    else {
        python manage.py runserver
    }
}

function seed {
    python manage.py seed
}

function flush {
    python manage.py flush
}

function superuser {
    python manage.py createsuperuser
}

function migrations {
    python manage.py makemigrations @args
}

function migrate {
    python manage.py migrate @args
}

function collectstatic {
    python manage.py collectstatic @args
}

function shell {
    python manage.py shell
}

function activate {
    if ($args) {
        & ".\$args\Scripts\activate"
    } else {
        .\venv\Scripts\activate
    }
}

function freeze {
    if ($args) {
        pip freeze > $args
    } else {
        pip freeze > requirements.txt
    }
}

function requirements {
    if ($args) {
        pip install -r $args
    } else {
        pip install -r requirements.txt
    }
}

function venv {
    if ($args) {
        python -m venv $args
    } else {
        python -m venv venv
    }
}
