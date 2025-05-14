# docker office image
FROM php:8.0-apache

# install docker image
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && a2enmod rewrite
	
#copy file to /var/www/html/
COPY ./src/ /var/www/html/

# set work directory
WORKDIR /var/www/html

# open 80 port
EXPOSE 80

# run apache2 server
CMD ["apache2-foreground"]