FROM httpd:alpine

RUN apk add --no-cache python3 py3-pip sqlite

COPY . /usr/local/apache2/htdocs/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
