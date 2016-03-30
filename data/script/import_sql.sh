#!/bin/bash 

cd 
ls

for i in bsbm/data/benchmark/sql/*.sql
do
  echo "file=$i"
  mysql -u root --password=password  test< $i
done
