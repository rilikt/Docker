#!/bin/bash
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root

cd /
cp wp-config.php /var/www/html/
cd -

php-fpm7.4 -F
