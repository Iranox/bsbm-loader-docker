#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -parseToJdbc -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -user root -password ${POSTGRES_ENV_POSTGRES_PASSWORD} -user root -targetUrl jdbc:postgresql://${POSTGRES_PORT_3307_TCP_ADDR}:${POSTGRES_PORT_3307_TCP_PORT}/${POSTGRES_ENV_POSTGRES_DB}

 -parseToJdbc -u root -p password -urlMysql jdbc:mysql://localhost:3307/benchmark -user root -password password -user root -targetUrl jdbc:postgresql:/localhost:3308/bsbm
