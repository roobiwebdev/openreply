#!/bin/sh
# Toonwright deployment: one image, two Railway services.
# PROCESS=worker runs the DM sender, PROCESS=cron the daily token refresh and other
# scheduled jobs; anything else runs the web app after applying migrations.
set -e
if [ "$PROCESS" = "worker" ]; then
  exec npm run worker
fi
if [ "$PROCESS" = "cron" ]; then
  exec sh scripts/cron.sh
fi
npx prisma migrate deploy
exec npm run start
