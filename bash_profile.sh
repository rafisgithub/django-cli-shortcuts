run() {
    if [ -n "$1" ]; then
        python manage.py runserver 0.0.0.0:"$1"
    else
        python manage.py runserver
    fi
}

seed() {
    python manage.py seed
}

flush() {
    python manage.py flush --no-input
}

superuser() {
    python manage.py createsuperuser
}

makemigrations() {
    python manage.py makemigrations "$@"
}

collectstatic() {
    python manage.py collectstatic "$@"
}

migrate() {
    python manage.py migrate "$@"
}

shell() {
    python manage.py shell
}

activate() {
    if [ -n "$1" ]; then
        source "./$1/bin/activate"
    else
        source ./venv/bin/activate
    fi
}

freeze() {
    if [ -n "$1" ]; then
        pip freeze > "$1"
    else
        pip freeze > requirements.txt
    fi
}

requirements() {
    if [ -n "$1" ]; then
        pip install -r "$1"
    else
        pip install -r requirements.txt
    fi
}

venv() {
    if [ -n "$1" ]; then
        python -m venv "$1"
    else
        python -m venv venv
    fi
}

worker() {
    local app="${1:-stoweb}"
    celery -A "$app" worker \
        --loglevel=info \
        --pool=threads \
        --concurrency=100 \
        --max-tasks-per-child=500 \
        -Ofair \
        --hostname=worker@%h \
        --without-gossip \
        --without-mingle
}

beat() {
    local app="${1:-stoweb}"
    celery -A "$app" beat --loglevel=info --scheduler django_celery_beat.schedulers:DatabaseScheduler
}
