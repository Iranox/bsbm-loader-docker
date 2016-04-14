#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target product -source producer -fk producer -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target product -source productfeatureproduct -fk nr -pk product -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
