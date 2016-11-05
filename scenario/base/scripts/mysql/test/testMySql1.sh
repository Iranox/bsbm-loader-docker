#!/bin/bash

ret=$(mysql -u root --password=$MYSQL_VERTICAL_MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD  -s -h $MYSQL_VERTICAL_MYSQL1_1_PORT_3306_TCP_ADDR -P $MYSQL_VERTICAL_MYSQL1_1_PORT_3306_TCP_PORT   -e "Select count(*) from product" benchmark 2>/dev/null)
echo $ret
