#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -databaseName ${MDatabaseName} -source ${MSource1} -fk ${MForginKey1} -join ${MJoin1} -secondSource ${MSecondSource1} -pkSecond ${MPkSecond1} -pk ${MPk1} -secondFkey ${MSecondFkey1} -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
java -jar bsbmloader-jar-with-dependencies.jar -materializeMongo -databaseName ${MDatabaseName} -source ${MSource2} -fk ${MForginKey2} -join ${MJoin2} -secondSource ${MSecondSource2} -pkSecond ${MPkSecond2} -pk ${MPk2} -secondFkey ${MSecondFkey2} -hostNosql ${MONGODB_PORT_27017_TCP_ADDR} -portNosql ${MONGODB_PORT_27017_TCP_PORT} -databaseName bsbm
