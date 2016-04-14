#!/bin/bash
cd 
cd /bsbm/scripts/mongodb/
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT} bsbm  < query1_notmat.js
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT} bsbm  < query2_notmat.js
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT} bsbm  < query3_notmat.js


