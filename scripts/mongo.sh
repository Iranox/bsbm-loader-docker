#!/bin/bash
cd bsbm-loader/loader
java -jar bsbmloader-jar-with-dependencies.jar -parseToMongo -u root -p password -urlMysql jdbc:mysql://localhost/benchmark -hostNosql localhost -portNosql 27018 -databaseName bsbm
