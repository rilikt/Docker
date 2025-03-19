FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php-fpm php-mysqli curl

COPY ./wp-config.php /var/www/html/wp-config.php
COPY ./www.conf etc/php/7.4/fpm/pool.d/.
COPY ./wp.sh /.

RUN chmod +x wp.sh
RUN mkdir -p /run/php/

EXPOSE 9000

CMD ["./wp.sh"]
