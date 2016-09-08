#!/bin/bash


mkdir /opt/jboss/teiid-8.11.0.Final/modules/com
mkdir /opt/jboss/teiid-8.11.0.Final/modules/com/mysql
mkdir /opt/jboss/teiid-8.11.0.Final/modules/com/mysql/main
cp /bsbm/scripts/module.xml  /opt/jboss/teiid-8.11.0.Final/modules/com/mysql/main
cp /bsbm/scripts/mysql-connector-java-5.1.39-bin.jar /opt/jboss/teiid-8.11.0.Final/modules/com/mysql/main
cp /bsbm/scripts/standalone-teiid.sh /opt/jboss/teiid-8.11.0.Final/standalone/configuration
cp /bsbm/scripts/standalone-teiid.sh /opt/jboss/teiid-8.11.0.Final/standalone/deployment


