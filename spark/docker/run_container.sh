cp -r ../../hadoop/src/hadoop-master ../src/hadoop

docker run -it -d --name spark \
  -v `pwd`/../src/:/opt/src/ \
  --network hadoop-network \
  -p 4040:4040 \
  spark

docker exec -it spark /bin/bash
