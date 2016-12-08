#!/bin/bash

#!/bin/bash

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml up -d


sleep 60
#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 250

sleep 60

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                      run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh

docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mysql_horizontal_bsbmloader sh /bsbm/scripts/bsbmloader/parseToMongoDBHorizintal.sh

#test  database
ret=$(docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml  run  mysql_horizontal_mysql2 mysql -u root --password=password  -s -h  mysql_horizontal_mysql2  -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml  run  mysql_horizontal_mongodb mongo benchmark --quiet --host mysql_horizontal_mongodb --eval "db.product.count()")

# remove unneeded literal
ret=$(echo $ret | tr -d -c 0-9)
#ret2=$(echo $ret2 | tr -d -c 0-9)

# Check if database product contains 100 rows
if [ $ret -eq 125 ]
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
