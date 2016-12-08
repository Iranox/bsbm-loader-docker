#!/bin/bash

#generate sql and ttl files
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up  -d
#docker-compose -f ../base/docker-compose.yml -f docker-compose.yml stop

#docker-compose -f ../base/docker-compose.yml -f docker-compose.yml up  -d
#docker-compose -f ../base/docker-compose.yml -f docker-compose.yml ps

sleep 60
docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
               run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
                         run base_mysql sh /bsbm/scripts/mysql/importSqlMongoDB.sh

docker-compose -f ../base/docker-compose.yml -f docker-compose.yml start mongo-master
docker-compose -f ../base/docker-compose.yml -f docker-compose.yml ps

docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
     run mongo-rs1 sh /bsbm/scripts/mongodb/mongoReplica2.sh

#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
  #  run mongo-rs2 sh /bsbm/scripts/mongodb/mongoReplica2.sh

  #  docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
  #       run mongo-rs3 sh /bsbm/scripts/mongodb/mongoReplica3.sh




docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml \
          run mongo-master sh /bsbm/scripts/mongodb/addShards.sh



# copy tables to mongodb
docker-compose  -f ../base/docker-compose.yml  -f docker-compose.yml run mongodb_vertical_bsbmloader sh /bsbm/scripts/bsbmloader/pasreToMonogoShard.sh

# sh.shardCollection("benchmark.offer", {"nr":1})



#remove unneeded tables
#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS person" benchmark
#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS review" benchmark
#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS offer" benchmark
#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql -e "DROP TABLE IF EXISTS productfeature" benchmark
#docker-compose -f ../base/docker-compose.yml  -f docker-compose.yml run base_mysql mysql -u root --password=password  -s -h  base_mysql  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
