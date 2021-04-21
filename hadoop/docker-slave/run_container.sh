docker run -it -d --name hadoop-slave \
  -v `pwd`/../src/:/opt/src/ \
  --network hadoop-network \
  hadoop-slave

docker exec -it hadoop-slave /bin/bash
