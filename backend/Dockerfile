FROM httpd:alpine

RUN apk add --no-cache python3 py3-pip sqlite

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir sqlite-utils

ENV PATH="/opt/venv/bin:$PATH"

COPY viewdb.sh /usr/local/apache2/cgi-bin/
RUN chmod +x /usr/local/apache2/cgi-bin/viewdb.sh

COPY BDD/db.sqlite /app/BDD/db.sqlite

RUN echo "LoadModule cgid_module modules/mod_cgid.so" >> /usr/local/apache2/conf/httpd.conf && \
    echo "<Directory \"/usr/local/apache2/cgi-bin\">" >> /usr/local/apache2/conf/httpd.conf && \
    echo "    AllowOverride None" >> /usr/local/apache2/conf/httpd.conf && \
    echo "    Options +ExecCGI" >> /usr/local/apache2/conf/httpd.conf && \
    echo "    Require all granted" >> /usr/local/apache2/conf/httpd.conf && \
    echo "</Directory>" >> /usr/local/apache2/conf/httpd.conf && \
    echo "ScriptAlias /cgi-bin/ \"/usr/local/apache2/cgi-bin/\"" >> /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]
