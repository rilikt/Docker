FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld /var/lib/mysql && chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

COPY my.cnf /etc/mysql/my.cnf
COPY db.sh .

RUN chmod +x db.sh

EXPOSE 3306

CMD ["./db.sh"]
