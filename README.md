```powershell
# --------------------------
# Django CLI Shortcuts
# --------------------------

<#
Examples:
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

function run {
    param([string]$Port)

    if ($Port) {
        python manage.py runserver 0.0.0.0:$Port
    }
    else {
        python manage.py runserver
    }
}

function seed {
    python manage.py seed
}

function flushdb {
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
    param([string]$EnvName)

    if ($EnvName) {
        & ".\$EnvName\Scripts\Activate.ps1"
    }
    else {
        & ".\venv\Scripts\Activate.ps1"
    }
}

function freeze {
    param([string]$OutputFile)

    if ($OutputFile) {
        pip freeze > $OutputFile
    }
    else {
        pip freeze > requirements.txt
    }
}

function requirements {
    param([string]$RequirementsFile)

    if ($RequirementsFile) {
        pip install -r $RequirementsFile
    }
    else {
        pip install -r requirements.txt
    }
}

function venv {
    param([string]$EnvName)

    if ($EnvName) {
        python -m venv $EnvName
    }
    else {
        python -m venv venv
    }
}

# --------------------------
# Celery Shortcuts
# --------------------------

function work {
    param([string]$ProjectName = "stoweb")

    celery -A $ProjectName worker --loglevel=info --pool=threads --concurrency=10
}

function beat {
    param([string]$ProjectName = "stoweb")

    celery -A $ProjectName beat `
        --loglevel=info `
        --scheduler django_celery_beat.schedulers:DatabaseScheduler
}
```
