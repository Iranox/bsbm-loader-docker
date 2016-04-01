#!/bin/bash
cd
cd /bsbm-loader/loader/target/
echo ${COUCHDB_PORT_5984_TCP_ADDR}
echo ${COUCHDB_PORT_5984_TCP_PORT}
java -jar bsbmloader-jar-with-dependencies.jar -materializeCouch -target ${Target1} -source ${Source1} -fk ${ForgeinKey1} -pk ${PrimaryKey1} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password
java -jar bsbmloader-jar-with-dependencies.jar -materializeCouch -target ${Target2} -source ${Source2} -fk ${ForgeinKey2} -pk ${PrimaryKey2} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password
