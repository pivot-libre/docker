FROM composer:1.5

## Add unpermissioned user to run our app
RUN \
  addgroup -S php \
  && adduser -g "" -s /bin/false -G php -S -D -H php

## Install required php extensions
RUN docker-php-ext-install pdo_mysql

RUN \
  mkdir pivot \
  && chown php:php pivot

#run as non-root when possible
USER php
RUN git clone https://github.com/pivot-libre/pivot.git

WORKDIR pivot
RUN composer install

#switch to root to copy and change permisssions on copied files
USER root
COPY ./pivot/.env .env
COPY ./docker-entrypoint.sh docker-entrypoint.sh
RUN \
  chown php:php docker-entrypoint.sh \
  && chmod 0500 ./docker-entrypoint.sh \
  && chown php:php .env \
  && chmod 0600 .env
USER php

ENTRYPOINT ["./docker-entrypoint.sh"]