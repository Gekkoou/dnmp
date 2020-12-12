ARG HYPERF_VERSION
FROM ${HYPERF_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL

RUN sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

# Fix: https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv libstdc++ --no-cache --repository http://${CONTAINER_PACKAGE_URL}/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN wget -O /usr/local/bin/composer https://github.com/composer/composer/releases/download/1.8.6/composer.phar \
    && chmod u+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://${CONTAINER_PACKAGE_URL}/composer

# ---------- clear works ----------
RUN rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"

WORKDIR /var/www/html