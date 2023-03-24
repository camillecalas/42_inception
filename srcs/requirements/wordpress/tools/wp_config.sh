#!bin/bash

cat /etc/hosts

echo "---------- wait for MariaDB container script to be executed -----------"
sleep 15

# Checks the status of the MariaDB database server with the specified username, password, and host.
mysqladmin -u ${DB_USER} -p${DB_USER_PASSWORD} -h ${DB_HOST} status
# Test the connectivity between the WordPress container and the MariaDB container, by checking whether the MariaDB container is up and running and responding to requests
mysqladmin -u ${DB_USER} -p${DB_USER_PASSWORD} -h ${DB_HOST} ping

# Downloads the latest version of WordPress in the French language to the specified path with root privileges.
wp core download --locale=fr_FR --path="/var/www/html" --allow-root

wp config create    --path="/var/www/html" \
                    --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_USER_PASSWORD \
                    --allow-root #specifies that the command is run with root privileges


wp core install     --path="/var/www/html" \
                    --title=$WP_TITLE \
                    --url=$WP_URL \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_MAIL \
                    --locale=fr_FR \
                    --allow-root
                    
wp user create $WP_USER $WP_USER_MAIL \
                                --user_pass=$WP_USER_PASSWORD \
                                --role=editor \
                                --path="/var/www/html" \
                                --allow-root


wp theme install twentytwentyone --allow-root --activate 

exec /usr/sbin/php-fpm7.3 -F -R 