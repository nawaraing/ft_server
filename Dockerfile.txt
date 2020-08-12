FROM		debian:buster

RUN		apt-get update
RUN		apt-get -y upgrade
RUN		apt-get -y install nginx openssl php-fpm mariadb-server php-mysql

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=junkang/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt
RUN		mv localhost.dev.crt etc/ssl/certs/
RUN		mv localhost.dev.key etc/ssl/private/
RUN		chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

COPY		./srcs/default etc/nginx/site-available/
COPY		./srcs/phpmyadmin var/www/html/
COPY		./srcs/wordpress var/www/html/