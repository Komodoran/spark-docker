#!/bin/bash
sudo /etc/init.d/ssh start

echo "172.19.0.2 master-01" |sudo tee -a /etc/hosts
echo "172.19.0.3 slave-01" |sudo tee -a /etc/hosts

ssh-keygen -q -t rsa -N '' -f /home/hadoop/.ssh/id_rsa
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
cp /home/hadoop/.ssh/id_rsa /opt/src/
cp /home/hadoop/.ssh/id_rsa.pub /opt/src/
chmod 600 /home/hadoop/.ssh/authorized_keys

sudo cp -r ./hadoop-master/* /usr/local/lib/hadoop-3.2.1/etc/hadoop/

hdfs namenode -format
start-dfs.sh
start-yarn.sh

sleep infinity
