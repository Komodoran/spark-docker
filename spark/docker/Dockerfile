FROM ubuntu:18.04

ENV WORKDIR=/opt/src
WORKDIR $WORKDIR

ENV SPARK_HOME=/usr/local/lib/spark
ENV HADOOP_CONF_DIR=/opt/src/hadoop/
RUN adduser hadoop && usermod -aG sudo hadoop && echo 'hadoop:hadoop' |chpasswd

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    sudo \
    vim \
    curl \
    wget \
    tar \
    default-jdk \
    scala \
    python3 \
    python3-pip \
    python3-setuptools \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://ftp.jaist.ac.jp/pub/apache/spark/spark-3.1.1/spark-3.1.1-bin-hadoop2.7.tgz
RUN tar -xvzf spark-3.1.1-bin-hadoop2.7.tgz
RUN mv spark-3.1.1-bin-hadoop2.7 $SPARK_HOME

COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

RUN mkdir /tmp/spark-events
ENTRYPOINT ["/bin/bash","/opt/src/entrypoint.sh"]

EXPOSE 4040
