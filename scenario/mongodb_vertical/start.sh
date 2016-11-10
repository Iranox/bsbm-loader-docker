#!/bin/bash

#generate sql and ttl files

docker-compose up -d
sleep 60
docker-compose run mongodb_vertical_bsbm sh /bsbm/scripts/bsbm_generator/generateData.sh $1

sleep 60

docker-compose run mongodb_vertical_mysql1 sh /bsbm/scripts/mysql/importSqlMongoDb.sh

docker-compose run mongodb_vertical_bsbmloader sh /bsbm/scripts/bsbmloader/parse_to_nosql.sh "mongodb"
#host=$(docker-compose run mongodb_vertical_mongodb printenv MONGODB_VERTICAL_MONGODB_1_PORT_27017_TCP_ADDR)
#port=$(docker-compose run mongodb_vertical_mongodb printenv MONGODB_VERTICAL_MONGODB_1_PORT_27017_TCP_PORT)
#host="$host"
#echo ${host}'welt'
docker-compose run mongodb_vertical_mongodb mongo 172.17.0.2:27017/benchmark --eval '"db.productfeature.drop()"'
docker-compose run mongodb_vertical_mongodb mongo 172.17.0.2:27017/benchmark --eval '"db.producttype.drop()"'
docker-compose run mongodb_vertical_mongodb mongo 172.17.0.2:27017/benchmark --eval '"db.producer.drop()"'
docker-compose run mongodb_vertical_mongodb mongo 172.17.0.2:27017/benchmark --eval '"db.product.drop()"'
docker-compose run mongodb_vertical_mongodb mongo 172.17.0.2:27017/benchmark --eval '"db.producttypeproduct.drop()"'
