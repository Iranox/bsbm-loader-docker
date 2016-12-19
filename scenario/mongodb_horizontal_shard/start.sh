#!/bin/bash

#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up  -d


sleep 60
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                         run base_mysql sh /bsbm/scripts/mysql/importSqlMongoDB.sh

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml start mongo-master-horizontal

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml ps

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run mongo-rs1-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
    run mongo-rs2-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica2.sh

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
      run mongo-rs3-horizontal sh /bsbm/scripts/mongodb/horizontal/mongoReplica3.sh


docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
          run mongo-master-horizontal sh /bsbm/scripts/mongodb/addShardsHorizontal.sh

# copy tables to mongodb
docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_vertical_mapbench-datadistributor sh /bsbm/scripts/mapbench-datadistributor/parseToMonodbHorizontalShard.sh
