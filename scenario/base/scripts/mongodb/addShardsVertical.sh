mongo --host mongo-master:27017 <<EOF
use benchmark;
db.offer.ensureIndex({"product":"hashed"})
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
EOF
