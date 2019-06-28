#!/bin/bash
set -x

USERNAME=${USERNAME:-admin}
PASSWORD=${PASSWORD:-test}

if [ ! -e "/app/.htpasswd" ]; then
    touch "/app/.htpasswd"
    htpasswd -B -b -c "/app/.htpasswd" $USERNAME $PASSWORD
fi

mkdir -p /app/data
chown -R www-data:www-data /app/data

apachectl -D FOREGROUND