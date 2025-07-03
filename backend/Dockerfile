FROM httpd:latest

# Installer SQLite et Python pour le backend (ajuster selon vos besoins)
RUN apk add --no-cache sqlite python3 py3-pip

# Créer le dossier pour la BDD
RUN mkdir -p /app/db

# Copier le script backend
COPY . /usr/local/apache2/htdocs/

# Installer les dépendances Python si nécessaire
RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi

# Point d'entrée personnalisé
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]