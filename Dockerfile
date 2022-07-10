FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
        curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libxslt-dev \
        libicu-dev \
        libmcrypt-dev \
        libxml2-dev \
        libzip-dev

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install opcache

ADD 99-php.ini /usr/local/etc/php/conf.d/99-custom.ini

WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]

