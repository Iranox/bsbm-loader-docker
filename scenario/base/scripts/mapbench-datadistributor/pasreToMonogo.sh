#!/bin/bash
cd
cd /bsbm-loader/target/
MONGODB=`ping -c 1 mongodb_hybrid_vertical_mongodb | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

 java -jar bsbmloader-jar-with-dependencies.jar -importMongo -user root -password password -sourceUrl jdbc:mysql://base_mysql:3306/benchmark -targetUrl mongodb_hybrid_vertical_mongodb:27017 -database benchmark -tables person  -tables offer  -tables productfeature -tables productfeatureproduct -tables review -threads 5
