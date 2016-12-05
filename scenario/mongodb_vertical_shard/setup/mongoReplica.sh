MONGODB1=`ping -c 1 mongo-rs1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB2=`ping -c 1 mongo-rs2 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB3=`ping -c 1 mongo-rs3 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`


mongo --host mongo-rs3:27017 <<EOF
   var cfg = {
        "_id": "mongors1",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "${MONGODB3}:27017",
                "priority": 1
            },
            {
                "_id": 1,
                "host": "${MONGODB1}:27017",
                "priority": 0.5
            },
            {
                "_id": 2,
                "host": "${MONGODB2}:27017",
                "priority": 0.5
            }
        ]
    };
rs.initiate(cfg);
rs.reconfig(cfg,{force: true})
EOF

#ping 127.0.0.1 > /dev/null
