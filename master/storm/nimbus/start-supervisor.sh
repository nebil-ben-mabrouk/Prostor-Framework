
echo "storm.local.hostname: prostor-master" >> $STORM_HOME/conf/storm.yaml
echo "storm.scheduler: orange.labs.iot.computational.storage.storm.schedulers.LocationAwareScheduler" >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
