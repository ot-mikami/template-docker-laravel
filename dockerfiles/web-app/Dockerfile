ARG COMPOSER_VERSION="latest"



FROM composer:${COMPOSER_VERSION} AS my-composer
RUN echo "COMPOSER_VERSION:${COMPOSER_VERSION}"



FROM alpine:3.9

ARG TZ="UTC"
RUN set -x \
  && apk add --no-cache \
       tzdata \
  && cp /usr/share/zoneinfo/${TZ} /etc/localtime

RUN set -x \
  && apk add --no-cache \
       apache2 \
       curl \
       php7 \
       php7-apache2

# extensions for Composer
RUN set -x \
  && apk add --no-cache \
       php7-phar \
       php7-curl \
       php7-zip

# install Composer
COPY --from=my-composer /usr/bin/composer /usr/bin/composer
ARG COMPOSER_HOME="/.composer"
ENV COMPOSER_HOME=${COMPOSER_HOME} \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PATH="$PATH:${COMPOSER_HOME}/vendor/bin"

# extensions for PHPUnit
RUN set -x \
  && apk add --no-cache \
       php7-dom \
       php7-xmlwriter

# extensions for Laravel
RUN set -x \
  && apk add --no-cache \
       php7-bcmath \
       php7-ctype \
       php7-fileinfo \
       php7-json \
       php7-mbstring \
       php7-openssl \
       php7-pdo \
       php7-tokenizer \
       php7-session \
       php7-xml \
       php7-pdo_pgsql

EXPOSE 80 8000
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
