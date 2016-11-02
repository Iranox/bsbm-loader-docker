#!/bin/bash

#generate sql and ttl files

docker-compose up -d
docker-compose run bsbm sh /bsbm/scripts/bsbm_generator/generateData.sh $1

docker-compose run mysql1 sh /bsbm/scripts/mysql/importMySQlscenario.sh
docker-compose run mysql2 sh /bsbm/scripts/mysql/importMysql2.sh
