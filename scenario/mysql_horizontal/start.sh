#!/bin/bash

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml up -d


sleep 60
generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

#sleep 60

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                      run mysql_horizontal_mysql2  sh /bsbm/scripts/mysql/createOfferMySQL2.sh
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                    run mysql_horizontal_mysql3  sh /bsbm/scripts/mysql/createOfferMySQL3.sh

docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mysql_horizontal_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMySQlHorizintal.sh
