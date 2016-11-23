#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_6_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE}  < 01ProductFeature.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_9_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE}  < 02ProductType.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_2_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE} < 03Producer.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_8_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE} < 04Product.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_10_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE}  < 05ProductTypeProduct.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_5_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE} < 07Vendor.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_7_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE}  < 06ProductFeatureProduct.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_4_PORT_3306_TCP_ADDR} \
       ${MYSQL_DATABASE} < 08Offer.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_1_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE} < 09Person.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h ${MYSQL_VERTICAL_MYSQL2_3_PORT_3306_TCP_ADDR} \
      ${MYSQL_DATABASE} < 10Review.sql
