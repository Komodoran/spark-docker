docker run -it -d --name hadoop \
  -v `pwd`/../src/:/opt/src/ \
  -p 9870:9870 \
  -p 9864:9864 \
  -p 8088:8088 \
  hadoop \
  /bin/bash

docker exec -it hadoop /bin/bash
