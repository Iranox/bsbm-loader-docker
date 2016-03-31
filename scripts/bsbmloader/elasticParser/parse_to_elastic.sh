#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -parseToElastic -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -hostNosql ${ELASTICSEARCH_PORT_9200_TCP_ADDR} -portNosql ${ELASTICSEARCH_PORT_9200_TCP_PORT} -databaseName bsbm
