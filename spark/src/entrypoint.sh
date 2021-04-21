#!/bin/bash
echo "172.19.0.2 master-01" |sudo tee -a /etc/hosts
echo "172.19.0.3 slave-01" |sudo tee -a /etc/hosts

/bin/bash $SPARK_HOME/sbin/start-history-server.sh &
sleep infinity
