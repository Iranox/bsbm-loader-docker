#!/bin/bash

cd

for i in /bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=password -h base_mysql  benchmark < $i
done
