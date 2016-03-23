#!/bin/bash 

cd ..

for i in benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=password  test< $i
done
