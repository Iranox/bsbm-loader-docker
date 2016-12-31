#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=password \
      -h mysql_vertical_mysql2 \
       benchmark < 07Vendor.sql
mysql -u root --password=password \
      -h mysql_vertical_mysql2 \
      benchmark  < 06ProductFeatureProduct.sql
mysql -u root --password=password \
      -h mysql_vertical_mysql2 \
     benchmark < 08Offer.sql
mysql -u root --password=password \
      -h mysql_vertical_mysql2 \
      benchmark < 09Person.sql
mysql -u root --password=password \
      -h mysql_vertical_mysql2 \
       benchmark < 10Review.sql
