#!/bin/bash

cd ..


#generate sql and ttl files
docker-compose run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1

# import data to mysql
docker-compose run base_mysql sh /bsbm/scripts/mysql/import_sql.sh
sleep 10

docker-compose run base_bsbmloader bash /bsbm/scripts/bsbmloader/parse_to_nosql.sh $2
