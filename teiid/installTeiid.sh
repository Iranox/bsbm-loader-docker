wget https://repository.jboss.org/nexus/service/local/repositories/releases/content/org/jboss/teiid/teiid/8.13.6/teiid-8.13.6-wildfly-server.zip
unzip teiid-8.13.6-wildfly-server.zip
mv teiid-8.13.6 /opt
mv /com /opt/teiid-8.13.6/modules
rm /opt/teiid-8.13.6/configuration/standalone-teiid.xml
mv /standalone/configuration/standalone-teiid.xml /opt/teiid-8.13.6/configuration/standalone-teiid.xml
mv /standalone/deployment/mysql-vdb.xml /opt/teiid-8.13.6/standalone/deployment/mysql-vdb.xml

