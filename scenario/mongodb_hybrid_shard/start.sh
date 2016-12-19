#!/bin/bash

#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up  -d


sleep 60
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                         run base_mysql sh /bsbm/scripts/mysql/importSqlMongoDB.sh

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml start mongo-master-hybrid
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run mongo-rs1-hybrid sh /bsbm/scripts/mongodb/hybrid/mongoReplica.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
    run mongo-rs2-hybrid sh /bsbm/scripts/mongodb/hybrid/mongoReplica2.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
      run mongo-rs3-hybrid sh /bsbm/scripts/mongodb/hybrid/mongoReplica3.sh



docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
          run mongo-master-hybrid sh /bsbm/scripts/mongodb/hybrid/addShardHybrid.sh

# copy tables to mongodb
docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_hybrid_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/mongodb_hybrid_shard/parseToMongoHybridShards.sh
