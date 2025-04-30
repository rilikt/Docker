#!/bin/bash

# set -e
# set -x

cd /var/www/html

echo "Waiting for mariadb to be ready..."
until nc -z mariadb 3306; do
	sleep 3
done
echo "Database ready."

export WORDPRESS_DB_PASSWORD=$(cat /run/secrets/db_pw)
export WORDPRESS_ADMIN_PASS=$(cat /run/secrets/wp_ad_pw)
export WORDPRESS_USER_PASS=$(cat /run/secrets/wp_usr_pw)


if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Installing and configuring wordpress."
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
	./wp-cli.phar core install --url=https://${DOMAIN_NAME} --title=Wordpress --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASS} --admin_email=${WORDPRESS_ADMIN_MAIL} --allow-root
	./wp-cli.phar user create ${WORDPRESS_USER} ${WORDPRESS_USER_MAIL} --role=author --user_pass=${WORDPRESS_USER_PASS} --allow-root
	echo "Done"
fi

./wp-cli.phar user list --allow-root

echo "Starting wordpress"
php-fpm7.4 -F
