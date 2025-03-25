FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod -R 755 /var/run/mysqld

COPY 50-server.cnf .
COPY db.sh .

# EXPOSE 3306

RUN chmod +x db.sh
CMD ["./db.sh"]
