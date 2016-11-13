#!/bin/bash
cd
cd /bsbm-loader/target/
echo -importMongo -user root -password ${MONGODBVERTICAL_MONGODB_VERTICAL_MYSQL1_1_ENV_MYSQL_DATABASE} -sourceUrl jdbc:mysql://${MONGODB_VERTICAL_MYSQL1_1_PORT_3306_TCP_ADDR}:3306/benchmark -targetUrl ${MONGODBVERTICAL_MONGODB_VERTICAL_MONGODB_1_PORT_27017_TCP_ADDR}:27017 -database benchmark -tables person -tables review -tables offer  -tables productfeature -tables productfeatureproduct

 java -jar bsbmloader-jar-with-dependencies.jar -importMongo -user root -password ${MONGODBVERTICAL_MONGODB_VERTICAL_MYSQL1_1_ENV_MYSQL_ROOT_PASSWORD} -sourceUrl jdbc:mysql://${MONGODB_VERTICAL_MYSQL1_1_PORT_3306_TCP_ADDR}:3306/benchmark -targetUrl ${MONGODBVERTICAL_MONGODB_VERTICAL_MONGODB_1_PORT_27017_TCP_ADDR}:27017 -database benchmark -tables person -tables review -tables offer  -tables productfeature -tables productfeatureproduct
