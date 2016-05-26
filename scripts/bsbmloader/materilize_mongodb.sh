#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target product -source producer -fk producer -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target offer -source product -fk product -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target offer -source vendor -fk vendor -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target productfeatureproduct -source product -fk product -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target productfeatureproduct -source product -fk product -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -target review -source person  -fk person -pk nr -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
sleep 5
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo  -source product -fk productfeature  -join productfeatureproduct -secondSource productfeature -pkSecond nr -pk nr -secondFkey product -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
