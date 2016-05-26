#!/bin/bash

cd ..


#generate sql and ttl files
docker-compose run bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh

# import data to mysql
docker-compose run mysql sh /bsbm/scripts/mysql/import_sql.sh
sleep 10

# load data to nosql
docker-compose run bsbmloader bash /bsbm/scripts/bsbmloader/parse_to_nosql.sh
