FROM java



RUN wget -q http://downloads.sourceforge.net/project/bsbmtools/bsbmtools/bsbmtools-0.2/bsbmtools-v0.2.zip && unzip -q bsbmtools-v0.2.zip
RUN rm  bsbmtools-v0.2.zip
RUN mv bsbmtools-0.2 bsbm
WORKDIR bsbm
RUN mkdir -p data/benchmark/ttl &&  mkdir -p data/benchmark/sql
RUN  wget -q https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.zip && unzip -q mysql-connector-java-5.1.40.zip && rm mysql-connector-java-5.1.40.zip && mv mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /bsbm/lib

RUN ls
