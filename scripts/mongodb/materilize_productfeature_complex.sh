#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo  -source product -fk product  -join producttypproduct -secondSource producttyp -pkSecond nr -pk nr -secondFkey productType -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName ${db}
