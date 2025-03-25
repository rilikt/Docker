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
# mariadbd &
service mariadb start

while ! mysqladmin ping -h localhost --silent; do
    sleep 3
done
echo "mariadb running, configuring next"

MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_pw)
MYSQL_DATABASE=${MYSQL_DATABASE}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=$(cat /run/secrets/db_pw)

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOSQL

service mariadb stop
echo "done"

# wait
exec mariadbd