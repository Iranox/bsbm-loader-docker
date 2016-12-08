#!/bin/bash

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml up -d


sleep 60
generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh 250

sleep 60

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                      run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                    run mysql_horizontal_mysql3  sh /bsbm/scripts/mysql/createOfferMySQL3.sh

docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mysql_horizontal_bsbmloader sh /bsbm/scripts/bsbmloader/parseToMySQlHorizintal.sh

#test  database
ret=$(docker-compose  -f ../base/docker-compose.yml -f docker-compose.yml  run mysql_horizontal_mysql3  mysql -u root --password=password  -s -h mysql_horizontal_mysql3  -e "Select count(*) from product" benchmark 2>/dev/null)
ret2=$(docker-compose  -f ../base/docker-compose.yml -f docker-compose.yml run mysql_horizontal_mysql2 mysql -u root --password=root_password  -s -h  mysql_horizontal_mysql2 -e "Select count(*) from product" benchmark 2>/dev/null)

# remove unneeded literal
ret=$(echo $ret | tr -d -c 0-9)
ret2=$(echo $ret2 | tr -d -c 0-9)

# Check if database product contains 100 rows
if [ $ret -eq 125 ]
  then
     echo "All 125 products were inserted"
  else
     exit 1
fi


# Check if person product contains 50 rows
if [ $ret2 -eq 125 ]
  then
     echo "All 125 products were inserted"
  else
     exit 1
fi

#stop databases
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml stop
