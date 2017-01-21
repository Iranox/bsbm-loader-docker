#!/bin/bash

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml up -d


sleep 60
#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1



docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_mysql sh /bsbm/scripts/mysql/import_sql.sh

# copy tables to mongodb
docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_hybrid_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogo.sh



#remove unneeded tables
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
