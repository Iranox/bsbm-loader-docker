#!/bin/bash

chmod +x bsbmloader/mongoParser/*.sh
chmod +x mysql/*.sh
chmod +x bsbm_generator/*.sh

cd ..

#start docker compose
docker-compose up

#generate sql and ttl files
if [ $1 == "true"]
  then
    docker-compose run bsbm_generator /bsbm/scripts/bsbm_generator/generateData.sh
fi

# import data to mysql
 docker-compose run mysql /bsbm/scripts/mysql/import_sql.sh

# loade data to mongo and materilize
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/parse_to_mongo.sh
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_1.sh
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_m.sh
