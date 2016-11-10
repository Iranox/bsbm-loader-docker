#!/bin/bash

cd

for i in /bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=${MONGODB_VERTICAL_MYSQL1_ENV_MYSQL_ROOT_PASSWORD} -h ${MONGODB_VERTICAL_MYSQL1_PORT_3306_TCP_ADDR}  --port ${MONGODB_VERTICAL_MYSQL1_PORT_3306_TCP_PORT}  ${MONGODB_VERTICAL_MYSQL1_ENV_MYSQL_DATABASE} < $i
done
