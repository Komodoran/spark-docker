#!/bin/bash
sudo /etc/init.d/ssh start

ssh-keygen -q -t rsa -N '' -f /home/hadoop/.ssh/id_rsa
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
chmod 600 /home/hadoop/.ssh/authorized_keys

sudo cp -r ./hadoop /usr/local/lib/hadoop-3.2.1/etc/

hdfs namenode -format
start-dfs.sh
start-yarn.sh

