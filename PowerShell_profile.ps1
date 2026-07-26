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
  python manage.py flush --no-input
}

function superuser {
    python manage.py createsuperuser
}

function makemigrations {
    python manage.py makemigrations @args
}

function collectstatic {
    python manage.py collectstatic @args
}


function migrate {
    python manage.py migrate @args
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


function worker {
    param([string]$app = "stoweb")

    celery -A $app worker `
        --loglevel=info `
        --pool=threads `
        --concurrency=100 `
        --max-tasks-per-child=500 `
        -Ofair `
        --hostname=worker@%h `
        --without-gossip `
        --without-mingle
}

function beat {
    param([string]$app="stoweb")

    celery -A $app beat --loglevel=info --scheduler django_celery_beat.schedulers:DatabaseScheduler
}
