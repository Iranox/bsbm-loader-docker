#!/bin/bash
cd
cd /bsbm-loader/loader/target/
java -jar bsbmloader-jar-with-dependencies.jar -materializeCouch -databaseName ${MDatabaseName} -source ${MSource1} -fk ${MForginKey1} -join ${MJoin1} -secondSource ${MSecondSource1} -pkSecond ${MPkSecond1} -pk ${MPk1} -secondFkey ${MSecondFkey1} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password
java -jar bsbmloader-jar-with-dependencies.jar -materializeCouch -databaseName ${MDatabaseName} -source ${MSource2} -fk ${MForginKey2} -join ${MJoin2} -secondSource ${MSecondSource2} -pkSecond ${MPkSecond2} -pk ${MPk2} -secondFkey ${MSecondFkey2} -hostNosql ${COUCHDB_PORT_5984_TCP_ADDR} -portNosql ${COUCHDB_PORT_5984_TCP_PORT} -databaseName bsbm -userCouch admin -passwordCouch password
