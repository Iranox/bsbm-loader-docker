MONGODB1=`ping -c 1 mongo-rs1-horizontal | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB2=`ping -c 1 mongo-rs2-horizontal | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB3=`ping -c 1 mongo-rs3-horizontal | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

mongo --host mongo-master-horizontal:27017 <<EOF
sh.addShard("mongors1/${MONGODB1}:27017")
sh.addShard("mongors2/${MONGODB2}:27017")
sh.addShard("mongors3/${MONGODB3}:27017")
EOF

mongo --host mongo-master-horizontal:27017 <<EOF
use benchmark;
db.offer.ensureIndex({"product":"hashed"})
db.product.ensureIndex({"nr":"hashed"})
db.producttype.ensureIndex({"nr":"hashed"})
db.producttypeproduct.ensureIndex({"productType":"hashed"})
db.producer.ensureIndex({"nr":"hashed"})
db.productfeatureproduct.ensureIndex({"productFeature":"hashed"})
db.productfeature.ensureIndex({"nr":"hashed"})
db.vendor.ensureIndex({"country":1})
db.review.ensureIndex({"product":"hashed"})
db.person.ensureIndex({"nr":"hashed"})
use admin
sh.enableSharding("benchmark")
sh.shardCollection("benchmark.offer",{"product":"hashed"})
sh.shardCollection("benchmark.review",{"product":"hashed"})
sh.shardCollection("benchmark.productfeature",{"nr":"hashed"})
sh.shardCollection("benchmark.productfeatureproduct",{"productFeature":"hashed"})
sh.shardCollection("benchmark.vendor",{"country":"hashed"})
sh.shardCollection("benchmark.product",{"nr":"hashed"})
sh.shardCollection("benchmark.producttype",{"nr":"hashed"})
sh.shardCollection("benchmark.producttypeproduct",{"productType":"hashed"})
sh.shardCollection("benchmark.producer",{"nr":"hashed"})
sh.shardCollection("benchmark.person",{"nr":"hashed"})
EOF
