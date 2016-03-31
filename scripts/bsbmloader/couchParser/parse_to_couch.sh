#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -parseToCouch -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password -d
