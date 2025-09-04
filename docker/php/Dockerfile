#FROM php:8.2.29-fpm-alpine3.21
FROM php:8.4.11-fpm-alpine3.21
ARG UID

# Configuración del usuario y directorios necesarios
RUN adduser -S -u ${UID} -G www-data -D appuser && \
    mkdir -p /home/appuser && \
    chown -R ${UID}:www-data /home/appuser

# Instalación de dependencias y extensiones PHP en una sola capa
RUN apk add --no-cache \
    git \
    acl \
    openssl \
    openssh-client \
    openldap-dev \
    wget \
    zip \
    vim \
    libpng \
    libjpeg-turbo \
    libpng-dev \
    libzip-dev \
    icu-dev \
    linux-headers \
    autoconf \
    g++ \
#    nodejs \
#    npm \
    make && \
    pecl install -f xdebug opcache && \
    docker-php-ext-install intl zip mysqli pdo pdo_mysql gd bcmath ldap && \
    docker-php-ext-enable opcache xdebug pdo_mysql gd bcmath && \
    apk del --no-cache autoconf g++ make linux-headers && \
    rm -rf /var/lib/apk/* /tmp/* /var/tmp/*

# Instalación de Composer optimizada
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer #&& \
#    PATH="$HOME/.composer/vendor/bin:$PATH" && \
#    composer self-update && \
#    composer global require laravel/installer && \
#    composer clear-cache
USER appuser
#ENV appuser

ENV HOME=/home/appuser
RUN composer global require laravel/installer
ENV PATH="/home/appuser/.composer/vendor/bin/:$PATH"
# Config XDEBUG
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html
