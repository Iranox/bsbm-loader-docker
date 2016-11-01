
[![Build Status](https://travis-ci.org/Iranox/mapbench-data.svg?branch=feature%2Fteiid)](https://travis-ci.org/Iranox/mapbench-data)

# bsbmloader-docker

This bsbm dockerfile download the bsbmtool from SourceForge and create ttl and
sql files.

## Run
 You can build  and run  with:             
 `docker-compose up`

 This build different database:  

* MySQl:   Port 3307  password password benchmark  
* Postgres Port 3308   password password database bsbm
* Elastic  Ports 9200/9300
* Mongo Port 27018
* CouchDB Port 5984

This create only the databases and some other container.

## Start bsbmloader and generate Data


You can start with   
``cd scripts``    
``sh start.sh 250``

This creates two datasets (MySQL and ttl) with 250 products. If you need a larger 
dataset you must change the number 250 to another number.  

## Errors


#### permission diened
If you have this kind of error you must run   
`chmod +x /path/file.sh`

#### Couldn't connect to Docker daemon ...

you must add `sudo` or `sudo -i`
