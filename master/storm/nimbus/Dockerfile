FROM prostor.storm:1.0.2

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

RUN /usr/bin/config-supervisord.sh nimbus
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773


ADD start-supervisor.sh /usr/bin/start-supervisor.sh
ADD storm-scheduler.jar $STORM_HOME/lib/storm-scheduler.jar

CMD /usr/bin/start-supervisor.sh
