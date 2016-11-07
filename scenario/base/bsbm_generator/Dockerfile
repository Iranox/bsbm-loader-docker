FROM java



RUN wget http://downloads.sourceforge.net/project/bsbmtools/bsbmtools/bsbmtools-0.2/bsbmtools-v0.2.zip && unzip bsbmtools-v0.2.zip
RUN rm  bsbmtools-v0.2.zip
RUN mv bsbmtools-0.2 bsbm
WORKDIR bsbm
RUN mkdir -p data/benchmark/ttl &&  mkdir -p data/benchmark/sql
RUN ls
