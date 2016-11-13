#!/bin/bash

#sh start.sh $1

sh start.sh 250

ret=$(docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h mongodb_vertical_mysql1  -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose run mongodb_vertical_mongodb mongo benchmark --quiet --host mongodb_vertical_mongodb --eval "db.person.count()")

# remove unneeded literal
ret=$(echo $ret | tr -d -c 0-9)
ret2=$(echo $ret2 | tr -d -c 0-9)

# Check if database product contains 100 rows
if [ $ret -eq 250 ]
  then
     echo "All 250 products were inserted"
  else
     exit 1
fi

# Check if person product contains 50 rows
if [ $ret2 -eq 100 ]
  then
     echo "All 100 persons were inserted"
  else
     exit 1
fi

docker-compose stop
