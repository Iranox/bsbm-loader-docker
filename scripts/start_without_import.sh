#!/bin/bash

chmod +x bsbmloader/postgresParser/*.sh
chmod +x bsbmloader/mongoParser/*.sh
chmod +x bsbmloader/elasticParser/*.sh
chmod +x bsbmloader/couchParser/*.sh
chmod +x mysql/*.sh
chmod +x bsbm_generator/*.sh

cd ..

# loade data to mongo and materilize
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/parse_to_mongo.sh
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_1.sh
docker-compose run bsbmloader /bsbm/scripts/bsbmloader/mongoParser/materilize_n_to_m.sh



#import data to elasticsearch
docker-compose run bsbmloader  sh /bsbm/scripts/bsbmloader/elasticParser/parse_to_elastic.sh

# import data to couchdb
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/parse_to_couch.sh
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/materilize_n_to_1.sh
 docker-compose run bsbmloader /bsbm/scripts/bsbmloader/couchParser/materilize_n_to_m.sh
 #sleep 3

# import data to postgres
# docker-compose run bsbmloader /bsbm/scripts/bsbmloader/postgresParser/parse_to_postgres.sh
