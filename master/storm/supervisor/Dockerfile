FROM prostor.storm:1.0.2

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

RUN chmod +x /usr/bin/config-supervisord.sh
RUN chmod +x /usr/bin/start-supervisor.sh

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
CMD /usr/bin/start-supervisor.sh
