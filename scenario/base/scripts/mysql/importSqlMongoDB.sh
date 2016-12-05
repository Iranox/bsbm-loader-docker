#!/bin/bash

cd

for i in /bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=${MYSQL_ROOT_PASSWORD} -h base_mysql  ${MYSQL_DATABASE} < $i
done
