#!bin/bash
cd /var/www/wordpress
# Then it uses the "wp core config" command to create a new WordPress configuration file with the database connection details provided as environment variables ($DB_HOST, $DB_NAME, $DB_USER, and $DB_PASSWORD). This step is necessary to set up the connection between WordPress and the MySQL/MariaDB database.
wp core config	--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \
				--allow-root

wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
				--allow-root

# script then creates a new user account with the "wp user create" command. This user account has the username, email, and password provided as environment variables ($WP_USER, $WP_USER_MAIL, and $WP_USER_PASSWORD), and is assigned the "author" role.
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
cd -

# After the WordPress installation is completed, the script changes the directory back to the original directory. Finally, the script starts the PHP FastCGI Process Manager (php-fpm7.3) to listen for CGI requests.
php-fpm7.3 -F