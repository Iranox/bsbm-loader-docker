#!/bin/bash
mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT}  bsbm --eval 'db.offer.aggregate([{$match: {nr:50}},{ $project: {_id:0,product:1, producer:1,vendor:1, price:1, validFrom:1, validTo:1, deliveryDays:1, offerWebpage:1, publisher:1, publishDate:1}}]).pretty()'

mongo -host ${MONGODB_PORT_27017_TCP_ADDR} -port ${MONGODB_PORT_27017_TCP_PORT}  bsbm --eval 'db.offer.aggregate([{$match: {nr:50}},{ $project: {_id:0,product:1, producer:1,vendor:1, price:1, validFrom:1, validTo:1, deliveryDays:1, offerWebpage:1, publisher:1, publishDate:1}}]).pretty().explain("executionStats")'
