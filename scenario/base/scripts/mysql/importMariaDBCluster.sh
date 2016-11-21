#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=root_password \
      -h ${MARIADB_MASTER_PORT_3306_TCP_ADDR} \
       < 05ProductTypeProduct.sql
mysql -u root --password=root_password \
      -h ${MARIADB_MASTER_PORT_3306_TCP_ADDR} \
        < 06ProductFeatureProduct.sql
mysql -u root --password=root_password \
      -h ${MARIADB_MASTER_PORT_3306_TCP_ADDR} \
      < 08Offer.sql
mysql -u root --password=root_password \
      -h ${MARIADB_MASTER_PORT_3306_TCP_ADDR} \
       < 09Person.sql
mysql -u root --password=root_password \
      -h ${MARIADB_MASTER_PORT_3306_TCP_ADDR} \
        < 10Review.sql
