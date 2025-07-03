FROM httpd:alpine

# Installer SQLite et outil de visualisation
RUN apk add --no-cache sqlite sqlite-utils

# Copier le script de visualisation
COPY viewdb.sh /usr/local/apache2/cgi-bin/
RUN chmod +x /usr/local/apache2/cgi-bin/viewdb.sh

# Activer CGI
RUN echo "LoadModule cgid_module modules/mod_cgid.so" >> conf/httpd.conf && \
    echo "<Directory \"/usr/local/apache2/cgi-bin\">" >> conf/httpd.conf && \
    echo "    AllowOverride None" >> conf/httpd.conf && \
    echo "    Options +ExecCGI" >> conf/httpd.conf && \
    echo "    Require all granted" >> conf/httpd.conf && \
    echo "</Directory>" >> conf/httpd.conf && \
    echo "ScriptAlias /cgi-bin/ \"/usr/local/apache2/cgi-bin/\"" >> conf/httpd.conf