#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target ${Target1} -source ${Source1} -fk ${ForgeinKey1} -pk ${PrimaryKey1} -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target ${Target2} -source ${Source2} -fk ${ForgeinKey2} -pk ${PrimaryKey2} -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
