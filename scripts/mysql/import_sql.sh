#!/bin/bash

cd

for i in /bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL_1_PORT_3306_TCP_ADDR} --port ${MYSQL_1_PORT_3306_TCP_PORT}  ${MYSQL_1_ENV_MYSQL_DATABASE} < $i
done
