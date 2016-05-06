#!/bin/bash
cd 
cd /bsbm/scripts/mongodb/
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT} ${MONGO_DB}  < index_mat.js
