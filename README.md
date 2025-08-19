<#
🐍 Django CLI Shortcuts (PowerShell)

This script provides handy PowerShell functions to speed up Django development.  
Instead of typing long `python manage.py` commands, you can use simple shortcuts like `run`, `migrate`, `superuser`, etc.

-------------------------------------------------------------------
📌 Setup Instructions

1. Check if your PowerShell profile exists:
   test-path $PROFILE

   If it returns False, create one:
   New-Item -Path $PROFILE -ItemType File -Force

2. Open your profile in Notepad:
   notepad $PROFILE

3. Paste this entire script into the profile file and save it.

4. Restart PowerShell. Done ✅

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
