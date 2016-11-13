#!/bin/bash

#generate sql and ttl files

docker-compose up -d

sleep 60

docker-compose run mongodb_vertical_bsbm sh /bsbm/scripts/bsbm_generator/generateData.sh $1

#sleep 60

docker-compose run mongodb_vertical_mysql1 sh /bsbm/scripts/mysql/importSqlMongoDb.sh

# copy tables to mongodb
docker-compose run mongodb_vertical_bsbmloader sh /bsbm/scripts/bsbmloader/pasreToMonogo.sh



#remove unneeded tables
docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h  mongodb_vertical_mysql1 -e "DROP TABLE IF EXISTS person" benchmark
docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h  mongodb_vertical_mysql1 -e "DROP TABLE IF EXISTS review" benchmark
docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h  mongodb_vertical_mysql1 -e "DROP TABLE IF EXISTS offer" benchmark
docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h  mongodb_vertical_mysql1 -e "DROP TABLE IF EXISTS productfeature" benchmark
docker-compose run mongodb_vertical_mysql1 mysql -u root --password=password  -s -h mongodb_vertical_mysql1  -e "DROP TABLE IF EXISTS productfeatureproduct" benchmark
