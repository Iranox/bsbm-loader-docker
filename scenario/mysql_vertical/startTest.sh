#!/bin/bash
cd ../../scenario/mysql_vertical/
#import data
sh start.sh 100

# set environments
mysql1Host=$(docker-compose run mysql_vertical_mysql1 printenv MYSQL_VERTICAL_MYSQL1_PORT_3306_TCP_ADDR)
mysql2Host=$(docker-compose run mysql_vertical_mysql2 printenv MYSQL_VERTICAL_MYSQL2_PORT_3306_TCP_ADDR)

#test First database
ret=$(docker-compose run mysql_vertical_mysql1 mysql -u root --password=password  -s -h  $(echo $mysql1Host) -P  3306   -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose run mysql_vertical_mysql2 mysql -u root --password=password  -s -h  $(echo $mysql2Host) -P  3306   -e "Select count(*) from person" benchmark 2>/dev/null)

# remove unneeded literal
ret=$(echo $ret | tr -d -c 0-9)
ret2=$(echo $ret2 | tr -d -c 0-9)

# Check if database product contains 100 rows
if [ $ret -eq 100 ]
  then
     echo "All 100 products were inserted"
  else
     exit 1
fi

# Check if person product contains 50 rows
if [ $ret2 -eq 50 ]
  then
     echo "All 50 persons were inserted"
  else
     exit 1
fi

#stop databases
docker-compose stop
