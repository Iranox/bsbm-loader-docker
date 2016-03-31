#!/bin/bash
cd
cd /bsbm/
chmod +x generate
./generate  -pc ${SCALING_FACTOR} -s sql &&  mv  dataset/* data/benchmark/sql &&  ./generate  -pc ${SCALING_FACTOR} -s ttl &&  mv dataset.ttl data/benchmark/ttl
