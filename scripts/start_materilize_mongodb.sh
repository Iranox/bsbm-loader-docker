#!/bin/bash
cd ..
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_product.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_offerProduct.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_offerVendor.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_review.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_productfeature_complex.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_query2.sh
docker-compose run bsbmloader sh /bsbm/scripts/bsbmloader/mongoParser/materilize_productfeatureproduct.sh
