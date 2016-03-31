#!/bin/bash

chmod +x bsbmloader/postgresParser/*.sh
chmod +x bsbmloader/mongoParser/*.sh
chmod +x bsbmloader/couchParser/*.sh
chmod +x mysql/*.sh
chmod +x bsbm_generator/*.sh

cd ..

#start docker compose
#docker-compose up

#generate sql and ttl files
docker-compose run bsbm_generator /bsbm/scripts/bsbm_generator/generateData.sh


# import data to mysql
 docker-compose run mysql /bsbm/scripts/mysql/import_sql.sh

# import data to couchdb
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/parse_to_couch.sh
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/materilize_n_to_1.sh
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/materilize_n_to_m.sh

# import data to postgres
# docker-compose run bsbmloader /bsbm/scripts/bsbmloader/postgresParser/parse_to_postgres.sh

# loade data to mongo and materilize
#docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/parse_to_mongo.sh
#docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_1.sh
#docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_m.sh
