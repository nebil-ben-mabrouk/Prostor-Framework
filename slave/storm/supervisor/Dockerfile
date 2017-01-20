FROM raspberry.prostor.java:8

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

ARG BIN_VERSION=apache-storm-1.0.2

RUN mkdir /opt/prostor

WORKDIR /opt/prostor

RUN alias python=python2-picamera \
    && apt-get update -y \
    && apt-get install -y python \
    && python -V \
    && wget -q -N http://mirrors.gigenet.com/apache/storm/${BIN_VERSION}/${BIN_VERSION}.tar.gz \
    && tar -C /opt/prostor -xvf /opt/prostor/${BIN_VERSION}.tar.gz \
    && mv /opt/prostor/${BIN_VERSION} /opt/prostor/apache-storm  \
    && mkdir -p /tmp/storm \
    && rm ${BIN_VERSION}.tar.gz \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add startup script
COPY storm.yaml /opt/prostor/apache-storm/conf/storm.yaml
COPY entrypoint.sh /opt/prostor/apache-storm/entrypoint.sh
COPY cluster.xml /opt/prostor/apache-storm/storm/log4j2/cluster.xml
COPY worker.xml /opt/prostor/apache-storm/log4j2/worker.xml

RUN chmod +x /opt/prostor/apache-storm/entrypoint.sh

# supervisor: worker and logviewer ports
EXPOSE 6700 6701 6702 6703 8000

ENTRYPOINT ["/opt/prostor/apache-storm/entrypoint.sh"]

CMD ["supervisor"]


















