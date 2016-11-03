#!/bin/bash
cd
cd /bsbm-loader/loader/target/

if [[ $1 == "mongodb" ]]
  then
      java -jar bsbmloader-jar-with-dependencies.jar -parseToMongo -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
fi

if [ $1 == "elasticsearch" ]
  then
      curl -XPUT 'http://'${ELASTICSEARCH_PORT_9200_TCP_ADDR}':'${ELASTICSEARCH_PORT_9200_TCP_PORT}'/bsbm/'
java -jar bsbmloader-jar-with-dependencies.jar -parseToElastic -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -hostNosql ${ELASTICSEARCH_PORT_9200_TCP_ADDR} -portNosql ${ELASTICSEARCH_PORT_9200_TCP_PORT} -databaseName ${db}
fi

if [ $1 == "couchdb" ]
  then
      java -jar bsbmloader-jar-with-dependencies.jar -parseToCouch -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password
fi
