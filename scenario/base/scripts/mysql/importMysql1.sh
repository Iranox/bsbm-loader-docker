#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h base_mysql \
      ${MYSQL_DATABASE}  < 01ProductFeature.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h base_mysql \
      ${MYSQL_DATABASE}  < 02ProductType.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h base_mysql \
      ${MYSQL_DATABASE} < 03Producer.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h base_mysql \
      ${MYSQL_DATABASE} < 04Product.sql
mysql -u root --password=${MYSQL_ROOT_PASSWORD} \
      -h base_mysql \
      ${MYSQL_DATABASE}  < 05ProductTypeProduct.sql
