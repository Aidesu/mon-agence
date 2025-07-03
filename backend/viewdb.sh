#!/bin/sh
echo "Content-type: text/html"
echo ""
echo "<pre>"
sqlite3 /app/BDD/db.sqlite "SELECT * FROM elements LIMIT 200;"
echo "</pre>"