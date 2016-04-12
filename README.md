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
``./start.sh``

This generate new sql and ttl files and overwrite existing files.  
If you do not want this, you shall use this command :  
``cd scripts``    
``./start_without_import.sh``


## Start benchmark mongodb

``cd scripts``    
``./start_benchmark_mongodb.sh``

## Postgres

 At the moment postgres is disable because there is an error in the bsbmloader .

## Error
#### permission diened
If you have this kind of error you must run   
`chmod +x /path/file.sh`

#### Couldn't connect to Docker daemon ...

you must add `sudo` or `sudo -i`
