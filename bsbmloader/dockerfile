FROM java 

RUN apt-get install maven2
RUN git clone -b develop https://github.com/Iranox/bsbm-loader.git
RUN cd bsbm-loader/loader && mvn package -DskipTests

WORKDIR bsbm-loader/loader

CMD java -jar bsbmloader-jar-with-dependencies.jar -parseToMongo -u $ADMIN -p $PASSWORD -urlMysql $URL -hostNosql $HOST_NOSQL -portNosql $PORT_NOSQL -databaseName $DATABASE
