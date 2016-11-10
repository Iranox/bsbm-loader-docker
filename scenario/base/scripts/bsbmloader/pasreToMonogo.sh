#!/bin/bash
cd
cd /bsbm-loader/target/

 java -jar bsbmloader-jar-with-dependencies.jar -importMongo -user root -password ${MONGODB_VERTICAL_MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD} -sourceUrl ${MONGODB_VERTICAL_MYSQL1_1_PORT_3306_TCP_ADDR}:${MONGODB_VERTICAL_MYSQL1_1_PORT_3306_TCP_PORT} -targetUrl ${MONGODB_VERTICAL_MONGODB_PORT_27017_TCP_ADDR}:${MONGODB_VERTICAL_MONGODB_PORT_27017_TCP_PORT} -database benchmark -tables person -tables review -tables offer  -tables productfeature -tables productfeatureproduct
