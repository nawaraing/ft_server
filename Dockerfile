FROM		debian:buster

RUN		apt-get update
RUN		apt-get -y upgrade
RUN		apt-get -y install nginx openssl php-fpm mariadb-server php-mysql wget

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=junkang/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt
RUN		mv localhost.dev.crt etc/ssl/certs/
RUN		mv localhost.dev.key etc/ssl/private/
RUN		chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN		mv phpmyadmin /var/www/html/

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		mv wordpress/ var/www/html/

COPY		./srcs/default etc/nginx/site-available/
COPY		./srcs/config.inc.php var/www/html/phpmyadmin/
COPY		./srcs/wp-config.php var/www/html/wordpress/
RUN		chown -R www-data:www-data /var/www/html/wordpress

RUN		service mysql start
RUN		mysql < var/www/html/phpmyadmin/sql/create_tables.sql -u root --skip-password

RUN		service nginx start
RUN		service php7.3-fpm start

EXPOSE		80 443 8080
