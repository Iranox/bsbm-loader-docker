MONGODB1=`ping -c 1 mongo-rs1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB2=`ping -c 1 mongo-rs2 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB3=`ping -c 1 mongo-rs3 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

mongo --host mongo-master:27017 <<EOF
sh.addShard("mongors1/${MONGODB1}:27017")
sh.addShard("mongors2/${MONGODB2}:27017")
sh.addShard("mongors3/${MONGODB3}:27017")
EOF
