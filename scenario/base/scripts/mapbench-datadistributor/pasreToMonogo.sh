#!/bin/bash
cd
cd /bsbm-loader/target/
MONGODB=`ping -c 1 mongodb_hybrid_vertical_mongodb | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

 java -jar bsbmloader-jar-with-dependencies.jar -importMongo -user root -password ${BASE_MYSQL_ENV_MYSQL_ROOT_PASSWORD} -sourceUrl jdbc:mysql://${BASE_MYSQL_PORT_3306_TCP_ADDR}:3306/benchmark -targetUrl ${MONGODB}:27017 -database benchmark -tables person -tables review -tables offer  -tables productfeature -tables productfeatureproduct
