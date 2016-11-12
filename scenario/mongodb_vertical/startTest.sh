#!/bin/bash

#sh start.sh $1

docker-compose up -d

mysql1Host=$(docker-compose run mongodb_vertical_mysql1 printenv MYSQL_VERTICAL_MYSQL1_PORT_3306_TCP_ADDR)
mongodbHost=$(docker-compose run mongodb_vertical_mongodb printenv MONGODB_VERTICAL_MONGODB_PORT_27017_TCP_ADDR)
ret=$(docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h  $(echo $mysql1Host) -P  3306   -e "Select count(*) from product" benchmark 2>/dev/null)
ret2="mongodb_vertical_mongodb  mongo $(echo $mongodbHost)/27017/benchmark --eval 'db.person.count()' 2>/dev/null)"
echo $ret
echo $ret2

#docker-compose stop
