FROM php:7.0-apache
MAINTAINER lp <lp@ggw.immo>


RUN apt-get update

RUN apt-get install -q -y libpng12-dev
RUN docker-php-ext-install gd

#RUN apt-get install -q -y vim less

RUN apt-get install -q -y php-pear  php5-gd php5-sqlite poppler-utils catdoc

ADD misc/seeddms-quickstart-5.0.5.tar.gz /var/www/

RUN a2enmod rewrite

COPY misc/000-default.conf /etc/apache2/sites-available/

COPY misc/settings.xml /var/www/seeddms50x/seeddms-5.0.5/conf/settings.xml
chown -R www-data:www-data /var/www/seeddms50x/seeddms-5.0.5/

RUN touch /var/www/seeddms50x/seeddms-5.0.5/conf/ENABLE_INSTALL_TOOL
