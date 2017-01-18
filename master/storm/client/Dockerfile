FROM prostor.storm:1.0.2

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

RUN mkdir -p $STORM_HOME/topologies && chown -R storm:storm $STORM_HOME/topologies

ADD prostor-empty-data-flow.jar $STORM_HOME/topologies/prostor-empty-data-flow.jar
ADD prostor-empty-data-flow.yaml $STORM_HOME/topologies/prostor-empty-data-flow.yaml

RUN /usr/bin/config-supervisord.sh client

CMD /usr/bin/start-supervisor.sh
