FROM php:7-apache
MAINTAINER Ludwig Prager <ludwig.prager@celp.de>

RUN apt-get update

RUN apt-get install -q -y libpng-dev imagemagick poppler-utils catdoc sqlite3 libsqlite3-dev

RUN docker-php-ext-install  -j5 gd mbstring mysqli pdo pdo_mysql shmop pdo_sqlite

RUN apt-get upgrade -y && apt-get clean && rm -rf /var/cache/apt/

ADD misc/seeddms-quickstart-5.1.9.tar.gz /var/www/

RUN a2enmod rewrite

COPY misc/php.ini /usr/local/etc/php/
COPY misc/000-default.conf /etc/apache2/sites-available/

COPY misc/settings.xml /var/www/seeddms51x/conf/settings.xml
RUN chown -R www-data:www-data /var/www/seeddms51x/

RUN touch /var/www/seeddms51x/conf/ENABLE_INSTALL_TOOL
