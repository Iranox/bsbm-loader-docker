#!/bin/bash
cd
cd /bsbm-loader/target/

 java -jar bsbmloader-jar-with-dependencies.jar -importMongo -user root -password password -sourceUrl jdbc:mysql://base_mysql:3306/benchmark -targetUrl  mongo-master:27017 -database benchmark -tables person -tables review -tables offer  -tables productfeature -tables productfeatureproduct
