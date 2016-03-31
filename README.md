# bsbmloader-docker

This bsbm dockerfile download the bsbmtool from SourceForge and create ttl and
sql files.

### Run
 You can build  and run  with:             
 `docker-compose up`

 This build different database:  

* MySQl:   Port 3307  password password benchmark  
* Postgres Port 3308   password password database bsbm
* Elastic  Ports 9200/9300
* Mongo Port 27018
* CouchDB Port 5984

### Import Data in MySQl

You can import the bsbm files with   
``docker-compose run mysl /bsbm/scripts/import_sql.sh``
