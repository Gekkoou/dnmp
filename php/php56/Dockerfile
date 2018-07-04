FROM alpine:3.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.3/main" > /etc/apk/repositories

ENV TIMEZONE Asia/Shanghai

RUN apk update && \
  apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
  echo "${TIMEZONE}" > /etc/timezone && \
  apk add php-intl \
    php-mcrypt \
    php-openssl \
    php-gmp \
    php-json \
    php-dom \
    php-pdo \
    php-zip \
    php-zlib \
    php-mysqli \
    php-bcmath \
    php-gd \
    php-xcache \
    php-pdo_mysql \
    php-gettext \
    php-xmlreader \
    php-xmlrpc \
    php-bz2 \
    php-memcache \
    php-iconv \
    php-curl \
    php-ctype \
    php-fpm \
    php-phar \
    php && \
  apk del tzdata && \
  rm -rf /var/cache/apk/*
RUN set -x \
  && addgroup -g 82 -S www-data \
  && adduser -u 82 -D -s /sbin/nologin -h /var/www -G www-data www-data
RUN mkdir /var/log/php \
  && chown -R www-data:www-data /var/log/php \
  && chmod -R 774 /var/log/php

EXPOSE 9000
CMD ["php-fpm", "-F"]
