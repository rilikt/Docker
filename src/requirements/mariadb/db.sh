#!/bin/bash

# set -e
# set -x

cp /50-server.cnf /etc/mysql/mariadb.conf.d/

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Installing mariadb"
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
    chown -R mysql:mysql /var/lib/mysql
    chmod -R 755 /var/lib/mysql
fi

echo "starting mariadb"
mariadbd &

while ! mysqladmin ping -h localhost --silent; do
    sleep 3
done
echo "mariadb running, configuring next"

#this is redundant and can be removed
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
MYSQL_DATABASE=${MYSQL_DATABASE}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=${MYSQL_PASSWORD}

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOSQL

echo "done"

wait
