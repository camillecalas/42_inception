# MariaDB Tools:
# Create a tool file: The tool_file.sql file should contain SQL commands that will be executed when the container is initialized. You can use this file to create databases, tables, users, and other objects in the database. 

# !/bin/bash

# set -x

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]
then
    echo "create database and users"

    service mysql start;

    # -e : Execute statement and quit.
    mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    # '%' (wildcard) : autorise l'accès pour n'importe quel host.
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$DB_ROOT_PASSWORD');"

    sleep 3
    mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
fi
exec mysqld_safe 