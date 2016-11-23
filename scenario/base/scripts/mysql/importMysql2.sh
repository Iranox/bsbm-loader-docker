#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h mysql_vertical_mysql2 \
       ${MYSQL_DATABASE} < 07Vendor.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h mysql_vertical_mysql2 \
      ${MYSQL_DATABASE}  < 06ProductFeatureProduct.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h mysql_vertical_mysql2 \
     ${MYSQL_DATABASE} < 08Offer.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h mysql_vertical_mysql2 \
      ${MYSQL_DATABASE} < 09Person.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h mysql_vertical_mysql2 \
       ${MYSQL_DATABASE} < 10Review.sql
