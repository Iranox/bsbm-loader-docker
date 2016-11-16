#!/bin/bash

#generate sql and ttl files

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up -d
sleep 60

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml \
      run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

#sleep 60

docker-compose  -f ../base/docker-compose.yml -f docker-compose.yml run \
              base_mysql sh /bsbm/scripts/mysql/importMysql1.sh


docker-compose -f ../base/docker-compose.yml -f docker-compose.yml \
               run mysql_vertical_mysql2 sh /bsbm/scripts/mysql/importMysql2.sh
