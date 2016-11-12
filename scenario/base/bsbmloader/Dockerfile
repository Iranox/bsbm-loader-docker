FROM maven

RUN git clone -b  feature/same_table  https://github.com/Iranox/bsbm-loader.git
RUN cd bsbm-loader && mvn package -DskipTests

WORKDIR bsbm-loader
