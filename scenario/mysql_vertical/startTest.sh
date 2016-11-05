#!/bin/bash

#import data
sh start.sh 100

#test First database
ret=$(docker-compose run mysql1 sh /bsbm/scripts/mysql/test/testMySql1.sh)
ret2=$(docker-compose run mysql2 sh /bsbm/scripts/mysql/test/testMySql2.sh)


if [ $ret -eq 100 ]
  then
     echo "All 100 products were inserted"
  else
     exit 1
fi

if [ $ret2 -eq 50 ]
  then
     echo "All 50 persons were inserted"
  else
     exit 1
fi

docker-compose stop
