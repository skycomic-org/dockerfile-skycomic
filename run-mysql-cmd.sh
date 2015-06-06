#!/bin/bash

mysql_install_db
/usr/bin/mysqld_safe &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -u root -e "CREATE DATABASE comic;"
mysql -u root comic < /app/private/install.sql

mysqladmin -uroot shutdown