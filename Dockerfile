ARG PHP_VERSION
FROM ${PHP_VERSION}

ARG TZ
ARG PHP_EXTENSIONS
ARG CONTAINER_PACKAGE_URL

RUN sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories

COPY ./install.sh /tmp/install.sh
WORKDIR /tmp
RUN tr -d "\r" <install.sh >install-1.sh \
    && rm -rf /tmp/install.sh \
    && tr "\r" "\n" <install-1.sh >install.sh \
    && rm -rf /tmp/install-1.sh \
    && chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/install.sh \
    && rm -rf /tmp/pear

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

# Fix: https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv libstdc++ --no-cache --repository http://${CONTAINER_PACKAGE_URL}/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# Install composer and change it's cache home
RUN curl -o /usr/bin/composer https://${CONTAINER_PACKAGE_URL}/composer/composer.phar \
    && chmod +x /usr/bin/composer \
	&& composer config -g repo.packagist composer https://${CONTAINER_PACKAGE_URL}/composer
ENV COMPOSER_HOME=/tmp/composer

# php image's www-data user uid & gid are 82, change them to 1000 (primary user)
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

WORKDIR /var/www/html