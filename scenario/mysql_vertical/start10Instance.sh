#!/bin/bash


docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml build
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml scale mysql_vertical_mysql2=10


#sleep 60
#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
    run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run mysql_vertical_mysql2 sh /bsbm/scripts/mysql/10Instance.sh
