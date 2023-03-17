# MariaDB Tools:

# Create a tool file: The tool_file.sql file should contain SQL commands that will be executed when the container is initialized. You can use this file to create databases, tables, users, and other objects in the database. 

#!/bin/bash

if [ ! -d /var/lib/mysql/$DB_NAME ]
then
    service mysql start;

    mysql -e "CREATE DATABASE $DB_NAME;"
    mysql -e "CREATE USER '$DB_USERNAME'@%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'IDENTIFIED BY '$DB_PASSWORD';"
    # flushes privileges to ensure that the changes take effect
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$DB_ROOT_PASSWORD');"

    sleep 1
    mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
fi
exec mysqld_safe