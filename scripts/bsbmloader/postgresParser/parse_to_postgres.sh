#!/bin/bash
cd
cd /bsbm-loader/loader/target/
options.addOption("targetUrl",true,"Url of target jdbc");
		options.addOption("user", true, "username");
		options.addOption("password", true, "password");
		options.addOption("parseToJdbc", false, "Import the mysql databaste to JDBC");
java -jar bsbmloader-jar-with-dependencies.jar -parseToMongo -u root -p ${MYSQL_1_ENV_MYSQL_ROOT_PASSWORD} -urlMysql jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}/${MYSQL_ENV_MYSQL_DATABASE}
-user root -password 
