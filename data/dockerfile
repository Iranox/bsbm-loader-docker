FROM java



RUN wget http://downloads.sourceforge.net/project/bsbmtools/bsbmtools/bsbmtools-0.2/bsbmtools-v0.2.zip && unzip bsbmtools-v0.2.zip
RUN rm  bsbmtools-v0.2.zip
WORKDIR bsbmtools-0.2

RUN mkdir -p data/benchmark/ttl &&  mkdir -p data/benchmark/sql 
VOLUME data


CMD ./generate  -pc $SCALING_FACTOR -s sql &&  mv  dataset/* data/benchmark/sql &&  ./generate  -pc $SCALING_FACTOR -s ttl &&  mv dataset.ttl data/benchmark/ttl





