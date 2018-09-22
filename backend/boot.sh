#!/bin/sh

# start virtual environment
source venv/bin/activate

#start postgres and wait for it to boot
echo "Waiting for postgres..."

while ! nc -z persistence 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

# run migrations
flask db upgrade

# for use with babel and i18n/l10n
flask translate compile

# start gunicorn
exec gunicorn -b :5000 --reload --access-logfile - --error-logfile - backend:app
