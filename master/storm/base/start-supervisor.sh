echo "storm.local.hostname: prostor-master" >> $STORM_HOME/conf/storm.yaml

/usr/sbin/sshd && supervisord
