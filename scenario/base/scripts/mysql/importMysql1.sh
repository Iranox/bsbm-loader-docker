#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=password \
      -h base_mysql \
      benchmark  < 01ProductFeature.sql
mysql -u root --password=password \
      -h base_mysql \
      benchmark  < 02ProductType.sql
mysql -u root --password=password \
      -h base_mysql \
      benchmark < 03Producer.sql
mysql -u root --password=password \
      -h base_mysql \
      benchmark < 04Product.sql
mysql -u root --password=password \
      -h base_mysql \
      benchmark  < 05ProductTypeProduct.sql
