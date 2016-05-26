#!/bin/bash
cd ..
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_mongodb.sh
docker-compose run mongodb sh /bsbm/scripts/mongodb/createProductFeatureTyp.sh
docker-compose run mongodb sh /bsbm/scripts/mongodb/createIndex.sh
