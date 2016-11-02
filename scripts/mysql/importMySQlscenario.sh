#!/bin/bash
cd /bsbm/data/benchmark/sql
mysql -u root --password=${MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL1_1_PORT_3306_TCP_ADDR} --port=${MYSQL1_1_PORT_3306_TCP_PORT}  ${MYSQL1_1_ENV_MYSQL_DATABASE} < 01ProductFeature.sql
mysql -u root --password=${MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL1_1_PORT_3306_TCP_ADDR} --port=${MYSQL1_1_PORT_3306_TCP_PORT}  ${MYSQL1_1_ENV_MYSQL_DATABASE} < 02ProductType.sql
mysql -u root --password=${MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL1_1_PORT_3306_TCP_ADDR} --port=${MYSQL1_1_PORT_3306_TCP_PORT}  ${MYSQL1_1_ENV_MYSQL_DATABASE} < 03Producer.sql
mysql -u root --password=${MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL1_1_PORT_3306_TCP_ADDR} --port=${MYSQL1_1_PORT_3306_TCP_PORT}  ${MYSQL1_1_ENV_MYSQL_DATABASE} < 04Product.sql
mysql -u root --password=${MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD}  -h ${MYSQL1_1_PORT_3306_TCP_ADDR} --port=${MYSQL1_1_PORT_3306_TCP_PORT}  ${MYSQL1_1_ENV_MYSQL_DATABASE} < 05ProductTypeProduct.sql


#ret=$(mysql -u root --password=$MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD  -s -h $MYSQL1_1_PORT_3306_TCP_ADDR -P $MYSQL1_1_PORT_3306_TCP_PORT   -e "Select count(*) from product" benchmark 2>/dev/null)
#echo $ret
