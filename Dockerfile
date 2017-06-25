FROM php:5.6-apache

RUN docker-php-ext-install mysqli \
    && apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get remove -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && rm -rf /var/lib/apt/lists/*
