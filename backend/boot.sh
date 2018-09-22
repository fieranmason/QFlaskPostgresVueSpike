#!/bin/sh

echo "Initializing..."



#start postgres and wait for it to boot
echo "Waiting for postgres..."

while ! nc -z persistence 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

# pwd + list
pwd
ls -al

# start virtual environment
cd QFlaskView
source ~/venv/bin/activate

# start gunicorn
exec gunicorn -b :5000 --reload --access-logfile - --error-logfile - hello:app
