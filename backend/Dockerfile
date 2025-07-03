FROM httpd:latest

RUN apk add --no-cache sqlite python3 py3-pip

RUN mkdir -p /app/db

COPY . /usr/local/apache2/htdocs/

RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]