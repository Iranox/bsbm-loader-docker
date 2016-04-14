#!/bin/bash
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT}  bsbm --eval 'db.product.find({"nr.product":20},{_id:0, publisher:0, publishDate:0, "nr.product":0, "nr._id":0, comment:0}).pretty()'
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT}  bsbm --eval 'db.product.find({"nr.product":20},{_id:0, publisher:0, publishDate:0, "nr.product":0, "nr._id":0, comment:0}).pretty().explain("executionStats")'


