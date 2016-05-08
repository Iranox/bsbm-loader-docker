#!/bin/bash
cd
cd /bsbm/
 ./generate  -pc ${SCALING_FACTOR} -s sql
mv  dataset/* data/benchmark/sql
mv -f td_data data/benchmark/sql
./generate  -pc ${SCALING_FACTOR} -s ttl
mv dataset.ttl data/benchmark/ttl
mv -f td_data data/benchmark/ttl
