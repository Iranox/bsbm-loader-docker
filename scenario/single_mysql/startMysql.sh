docker-compose up -d
docker-compose run base_bsbm_generator sh /bsbm/scripts/bsbm_generator/generateData.sh $1
docker-compose run base_mysql sh /bsbm/scripts/mysql/importSqlWithoutPassword.sh
