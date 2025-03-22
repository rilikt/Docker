#!/bin/bash

# rm -f /usr/local/bin/wp
cd /var/www/html

# set -e
# set -x

# sleep 10

# until nc -z mariadb 3306; do
# 	sleep 3
# done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
# ./wp-cli.phar config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
# ./wp-cli.phar core install --url=localhost:8080 --title=Wordpress --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASS} --admin_email=${WORDPRESS_ADMIN_MAIL} --allow-root
# ./wp-cli.phar user create ${WORDPRESS_USER} ${WORDPRESS_USER_MAIL} --role=author --user_password=${WORDPRESS_USER_PASS}

cp /wp-config.php .

php-fpm7.4 -F
