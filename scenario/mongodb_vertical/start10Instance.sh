#!/bin/bash


docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml build
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml scale mongodb=10


sleep 60
#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1


docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_hybrid_vertical_bsbmloader \
                   sh /bsbm/scripts/bsbmloader/parseToMongo10Instances.sh
