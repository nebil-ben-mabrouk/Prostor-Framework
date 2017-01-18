#!/bin/bash
supervisor_container_name="prostor_slave_supervisor"

docker ps | grep $supervisor_container_name | grep Up >/dev/null 
if [ $? -eq 0 ] ; then
	echo "Prostor supervisor container is already running!"
	exit 0
fi

CONTAINER=`docker ps -a| grep $supervisor_container_name | grep "Exited" |awk '{print $1}'`
if [ "$CONTAINER" == "" ] ; then
	docker run -d --net host --name $supervisor_container_name raspberry.prostor.storm.supervisor:1.0.2
else
	docker start $CONTAINER
fi
