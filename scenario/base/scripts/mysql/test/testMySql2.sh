#!/bin/bash
ret=$(mysql -u root --password=$MYSQL2_1_ENV_MYSQL_ROOT_PASSWORD  -s -h $MYSQL2_1_PORT_3306_TCP_ADDR -P $MYSQL2_1_PORT_3306_TCP_PORT   -e "Select count(*) from person" benchmark 2>/dev/null)
echo $ret
