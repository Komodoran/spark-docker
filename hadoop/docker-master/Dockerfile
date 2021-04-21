FROM ubuntu:18.04

ENV WORKDIR=/opt/src
WORKDIR $WORKDIR

ENV HADOOP_HOME=/usr/local/lib/hadoop-3.2.1
ENV HADOOP_INSTALL=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV YARN_HOME=$HADOOP_HOME
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

RUN adduser hadoop && usermod -aG sudo hadoop && echo 'hadoop:hadoop' |chpasswd

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    sudo \
    vim \
    curl \
    wget \
    tar \
    ssh \
    openssh-server \
    default-jdk \
    default-jre \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

RUN echo 'hadoop ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz -O hadoop.tar.gz
RUN tar -xvzf hadoop.tar.gz -C /usr/local/lib/
RUN mkdir $HADOOP_HOME/logs && chown hadoop:hadoop -R $HADOOP_HOME/logs
RUN mkdir $HADOOP_HOME/hdfs && chown hadoop:hadoop -R $HADOOP_HOME/hdfs
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
RUN echo 'export HADOOP_CLASSPATH+=" $HADOOP_HOME/lib/*.jar"' >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN wget https://jcenter.bintray.com/javax/activation/javax.activation-api/1.2.0/javax.activation-api-1.2.0.jar -P $HADOOP_HOME/lib/

RUN mkdir -p /home/hadoop/.ssh/
RUN chown hadoop:hadoop -R /home/hadoop/.ssh/


ENTRYPOINT ["/bin/bash","/opt/src/init-hadoop-master.sh"]

USER hadoop
EXPOSE 8888
