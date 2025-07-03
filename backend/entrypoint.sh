#!bin/sh

if [ ! -f /app/BDD/db.sqlite]; then
    echo "Base de donnees manquante"
    exit 1
fi

exec httpd-foreground