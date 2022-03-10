#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.

echo "run db migration"
/app/migrate -path /app/migration -database "${DB_SOURCE}" -verbose up

echo "start the app"
exec "$@"