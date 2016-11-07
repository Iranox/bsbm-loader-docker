#!/bin/bash

#generate sql and ttl files

docker-compose up -d
docker-compose run mysql_vertical_bsbm sh /bsbm/scripts/bsbm_generator/generateData.sh $1

sleep 60

docker-compose run mysql_vertical_mysql1 sh /bsbm/scripts/mysql/importMySQlscenario.sh
docker-compose run mysql_vertical_mysql2 sh /bsbm/scripts/mysql/importMysql2.sh
