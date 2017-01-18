FROM prostor.storm:1.0.2

MAINTAINER Nebil Ben Mabrouk "nebil.benmabrouk@orange.com"

RUN chmod +x /usr/bin/config-supervisord.sh
RUN chmod +x /usr/bin/start-supervisor.sh

RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8889
CMD /usr/bin/start-supervisor.sh
