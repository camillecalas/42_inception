# MariaDB Tools:
# MariaDB Tools are a set of command-line utilities that are designed to help you manage and administer MariaDB databases. These tools include backup and restore utilities, monitoring and analysis tools, and query optimization tools. Examples of MariaDB tools include mysqladmin, mysqldump, mysqlcheck, and mysqlslap.

#!/bin/bash

service mysql start

mysql -u root -e "CREATE DATABASE ${DB_NAME};"
mysql -u root -e "CREATE USER '${DB_USERNAME}'@%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"