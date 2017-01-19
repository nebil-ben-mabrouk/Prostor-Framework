FROM prostor.java:8

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.5.2-alpha

LABEL name="zookeeper" version=$VERSION

RUN wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && echo "clientPort=2181"        >> /opt/zookeeper/conf/zoo.cfg \
    && echo "admin.serverPort=8888"  >> /opt/zookeeper/conf/zoo.cfg \
    && echo "dataDir=/tmp/zookeeper" >> /opt/zookeeper/conf/zoo.cfg \ 
    && mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

