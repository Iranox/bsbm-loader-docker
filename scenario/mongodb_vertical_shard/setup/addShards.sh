MONGODB3=`ping -c 1 mongo-rs3 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

mongo --host base_mongo-master:27017 <<EOF
sh.addShard("mongors1/${MONGODB3}:27017")
EOF
