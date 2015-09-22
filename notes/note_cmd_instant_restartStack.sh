sudo -iu palantir


cat > /home/palantir/startPalantirServers.xml <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<serverLifecycleAndConfigOptions xmlns="http://www.palantirtech.com/pt/schema/config/pg-plugin/options/serverLifecycleAndConfig">
    <deploymentName>myDeployment</deploymentName>
</serverLifecycleAndConfigOptions>
EOF


cat > /home/palantir/startAll.sh <<EOF
/opt/palantir/pem/enterpriseManager/bin/unix/pem.sh start
sleep 5
/opt/palantir/pem/enterpriseManager/task/unix/startPalantirServers.sh -u p://admin:palantir@localhost --non-interactive -o /home/palantir/startPalantirServers.xml
EOF


chmod +x /home/palantir/startAll.sh

/home/palantir/startAll.sh