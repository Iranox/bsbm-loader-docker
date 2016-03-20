# bsbmloader-docker

## bsbm

This bsbm dockerfile download the bsbmtool from SourceForge and create ttl and
sql files.

### Run
 You can build  and run a simple data-container with:      
 `docker build -t bsbm .`       
 `docker run -e SCALING_FACTOR=100 bsbm`

### Run and get data
If you want to get all sql and ttl files, you should use this:   
`cd data`   
`chmod +x generate_data.sh`   
`sudo ./generate_data.sh`       
This generate a dataset with 100 products   

For a large dataset you this:

`sudo ./generate_data 1000`   
This generate a dataset with 1000 products.
