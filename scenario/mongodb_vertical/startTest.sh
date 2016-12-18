#!/bin/bash

sh start.sh 250

ret=$(docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml  run base_mysql mysql -u root --password=password  -s -h base_mysql  -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml  run mongodb_hybrid_vertical_mongodb mongo benchmark --quiet --host mongodb_hybrid_vertical_mongodb --eval "db.person.count()")

# remove unneeded literal
ret=$(echo $ret | tr -d -c 0-9)
#ret2=$(echo $ret2 | tr -d -c 0-9)

# Check if database product contains 100 rows
if [ $ret -eq 250 ]
  then
     echo "All 250 products were inserted"
  else
     exit 1
fi

# Check if person product contains 50 rows
if [ $ret2 -eq 125 ]
  then
     echo "All 125 persons were inserted"
  else
     exit 1
fi

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml  stop
