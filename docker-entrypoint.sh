#!/bin/bash

set -e

until [ "$(php artisan isDBUp)" == "true" ]; do
  >&2 echo "DB is unavailable - sleeping"
  sleep 1
done

>&2 echo "DB is up - migrating and serving app"
php artisan key:generate
php artisan migrate
php artisan passport:install
exec php artisan serve --host=pivot --port=8000