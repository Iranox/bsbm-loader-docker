FROM java

RUN apt-get update
RUN apt-get install -y maven 

RUN git clone -b develop https://github.com/Iranox/bsbm-loader.git
RUN cd bsbm-loader/loader && mvn package -DskipTests

WORKDIR bsbm-loader/loader


