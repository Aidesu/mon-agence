#!/bin/sh
echo "Content-type: text/html"
echo ""
echo "<pre>"
sqlite3 /app/BDD/db.sqlite "SELECT * FROM votre_table LIMIT 50;"
echo "</pre>"