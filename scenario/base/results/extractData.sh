#!/bin/bash
#sh startOntop.sh 2848



benchmark1Millionen=($(grep '<aqet>'  benchmark_1millionen_singleServer.xml | cut -f2 -d">"|cut -f1 -d"<"))
benchmark10Millionen=($(grep '<aqet>'  benchmark_10millionen_singleServer.xml | cut -f2 -d">"|cut -f1 -d"<"))
benchmark100Millionen=($(grep '<aqet>' benchmark_100millionen_singleServer.xml | cut -f2 -d">"|cut -f1 -d"<"))

#rm output.txt

cat <<EOT >> output.txt
Q1 ${benchmark1Millionen[0]}  ${benchmark10Millionen[0]}    ${benchmark100Millionen[0]}
Q2 ${benchmark1Millionen[1]}  ${benchmark10Millionen[1]}    ${benchmark100Millionen[1]}
Q3 ${benchmark1Millionen[2]}  ${benchmark10Millionen[2]}    ${benchmark100Millionen[2]}
Q4 ${benchmark1Millionen[3]}  ${benchmark10Millionen[3]}    ${benchmark100Millionen[3]}
Q5 ${benchmark1Millionen[4]}  ${benchmark10Millionen[4]}    ${benchmark100Millionen[4]}
Q6 ${benchmark1Millionen[5]}  ${benchmark10Millionen[5]}    ${benchmark100Millionen[5]}
Q7 ${benchmark1Millionen[6]}  ${benchmark10Millionen[6]}    ${benchmark100Millionen[6]}
Q8 ${benchmark1Millionen[7]}  ${benchmark10Millionen[7]}    ${benchmark100Millionen[7]}
Q9 ${benchmark1Millionen[8]}  ${benchmark10Millionen[8]}    ${benchmark100Millionen[8]}
Q10 ${benchmark1Millionen[9]}  ${benchmark10Millionen[9]}    ${benchmark100Millionen[9]}
Q11 ${benchmark1Millionen[10]}  ${benchmark10Millionen[10]}    ${benchmark100Millionen[10]}
Q12 ${benchmark1Millionen[11]}  ${benchmark10Millionen[11]}    ${benchmark100Millionen[11]}
EOT
