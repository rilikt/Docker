FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php7.4-fpm php7.4-mysqli php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-imagick php7.4-dom php7.4-zip netcat-traditional curl

COPY www.conf etc/php/7.4/fpm/pool.d/.
COPY wp.sh .

RUN chmod +x wp.sh
RUN mkdir -p /run/php/

# EXPOSE 9000

CMD ["./wp.sh"]
