#!/bin/bash

cd

for i in /bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=${MYSQL_ROOT_PASSWORD} -h mongodb_vertical_mysql1   ${MYSQL_DATABASE} < $i
done
