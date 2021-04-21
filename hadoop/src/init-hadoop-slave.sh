#!/bin/bash
sudo /etc/init.d/ssh start

echo "172.19.0.2 master-01" |sudo tee -a /etc/hosts
echo "172.19.0.3 slave-01" |sudo tee -a /etc/hosts

cp /opt/src/id_rsa /home/hadoop/.ssh/
cat /opt/src/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
chmod 600 /home/hadoop/.ssh/authorized_keys

sudo cp -r ./hadoop-slave/* /usr/local/lib/hadoop-3.2.1/etc/hadoop/

hadoop-daemon.sh start datanode
yarn-daemon.sh start nodemanager

sleep infinity
