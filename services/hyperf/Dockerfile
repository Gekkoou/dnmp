ARG HYPERF_VERSION
FROM ${HYPERF_VERSION}

ARG TZ
ARG CONTAINER_PACKAGE_URL

RUN sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

WORKDIR /var/www/html