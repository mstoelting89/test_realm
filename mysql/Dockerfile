FROM php:7.2-fpm

RUN apt-get update -y && apt-get install -y libpng-dev zlib1g-dev libjpeg-dev libfreetype6-dev locales gettext libicu-dev libmemcached-dev

RUN docker-php-ext-configure intl && docker-php-ext-configure gettext && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd

RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring zip intl gettext && docker-php-ext-enable mysqli intl gettext

RUN pecl install xdebug
