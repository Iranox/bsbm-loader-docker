#!/bin/bash

#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up  -d


sleep 60
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                         run base_mysql sh /bsbm/scripts/mysql/importSqlMongoDB.sh

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml start mongo-master


docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run mongo-rs1 sh /bsbm/scripts/mongodb/mongoReplica.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
    run mongo-rs2 sh /bsbm/scripts/mongodb/mongoReplica2.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
      run mongo-rs3 sh /bsbm/scripts/mongodb/mongoReplica3.sh



docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
          run mongo-master sh /bsbm/scripts/mongodb/addShards.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
          run mongo-master sh /bsbm/scripts/mongodb/addShardsVertical.sh

# copy tables to mongodb
docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/pasreToMonogoShard.sh

#remove unneeded tables
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
