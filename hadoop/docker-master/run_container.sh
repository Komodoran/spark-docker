docker network create hadoop-network

docker run -it -d --name hadoop-master \
  -v `pwd`/../src/:/opt/src/ \
  --network hadoop-network \
  -p 9870:9870 \
  -p 9864:9864 \
  -p 8088:8088 \
  hadoop-master

docker exec -it hadoop-master /bin/bash
