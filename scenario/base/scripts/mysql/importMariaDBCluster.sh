#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=root_password \
      -h mariadb-master \
       < 05ProductTypeProduct.sql
mysql -u root --password=root_password \
      -h mariadb-master \
        < 06ProductFeatureProduct.sql
mysql -u root --password=root_password \
      -h mariadb-master \
      < 08Offer.sql
mysql -u root --password=root_password \
      -h mariadb-master \
       < 09Person.sql
mysql -u root --password=root_password \
      -h mariadb-master \
        < 10Review.sql
