#!/bin/sh
# Toonwright deployment: one image, two Railway services.
# PROCESS=worker runs the DM sender; anything else runs the web app after applying migrations.
set -e
if [ "$PROCESS" = "worker" ]; then
  exec npm run worker
fi
npx prisma migrate deploy
exec npm run start
