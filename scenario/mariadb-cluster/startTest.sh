#!/bin/bash

#import data
sh start.sh 100


#test  database
ret=$(docker-compose  -f ../base/docker-compose.yml -f docker-compose.yml  run base_mysql mysql -u root --password=password  -s -h base_mysql  -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose  -f ../base/docker-compose.yml -f docker-compose.yml run mariadb-master mysql -u root --password=root_password  -s -h  mariadb-master -e "Select count(*) from person" benchmark 2>/dev/null)

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
if [ $ret2 -eq 25 ]
  then
     echo "All 50 persons were inserted"
  else
     exit 1
fi

#stop databases
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml stop
