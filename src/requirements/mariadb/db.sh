#!/bin/bash

set -e
set -x

service mariadb start

# mkdir -p var/run/mysql
# chown -R mysql:mysql var/run/mysql
# chmod -R 755 var/run/mysql

# mysql_install_db

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
MYSQL_DATABASE=${MYSQL_DATABASE}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=${MYSQL_PASSWORD}

# @ % means from any host, might not be needed
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOSQL

service mariadb stop

exec mysqld #--socket=/var/run/mysqld/mysqld.sock
