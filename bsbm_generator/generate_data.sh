#!/bin/bash 

# the user should be a root
if [ $(id -u) -ne 0 ]; then
    echo "the user should be a root"
    exit
fi

# create folder
mkdir -p benchmark/sql
mkdir -p benchmark/ttl

# create docker container and data 
docker build -t bsbm .
if [ $1 == ""]
  then
    docker run -e SCALING_FACTOR=100 bsbm 
  else
   docker run -e SCALING_FACTOR=$1 bsbm 
fi

# get sql files
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/01ProductFeature.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/02ProductType.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/03Producer.sql benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/04Product.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/05ProductTypeProduct.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/06ProductFeatureProduct.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/07Vendor.sql  benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/08Offer.sql benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/09Person.sql benchmark/sql  
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/sql/10Review.sql  benchmark/sql  

# get ttl file
docker cp $(docker ps -l -q):/bsbmtools-0.2/data/benchmark/ttl/dataset.ttl  benchmark/ttl 
