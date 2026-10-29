FROM eclipse-temurin:8-jdk

WORKDIR /opt

# Java
ENV JAVA_HOME=/opt/java/openjdk

# Hadoop client
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz \
    && tar -xzf hadoop-3.2.1.tar.gz \
    && mv hadoop-3.2.1 hadoop \
    && rm hadoop-3.2.1.tar.gz

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

COPY config/core-site.xml $HADOOP_HOME/etc/hadoop/

# Mahout
RUN wget https://archive.apache.org/dist/mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz \
    && tar xzf apache-mahout-distribution-0.13.0.tar.gz \
    && mv apache-mahout-distribution-0.13.0 /usr/local \
    && ln -sf /usr/local/apache-mahout-distribution-0.13.0 /usr/local/mahout \
    && rm apache-mahout-distribution-0.13.0.tar.gz

ENV MAHOUT_HOME=/usr/local/mahout

ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$MAHOUT_HOME/bin

RUN mkdir /workspace

WORKDIR /workspace

CMD ["bash"]