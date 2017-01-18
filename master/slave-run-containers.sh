#!/bin/bash

docker_remote="DOCKER_API_VERSION=1.23 docker -H=prostor-slave:2375"
supervisor_container_name="prostor_slave_supervisor"

#waiting=80

eval "$docker_remote ps | grep $supervisor_container_name | grep Up >/dev/null "

if [ $? -eq 0 ] ; then
	echo "Prostor supervisor container is already running!"
	exit 0
fi

if [[ `eval "$docker_remote ps -a| grep $supervisor_container_name | grep 'Exited' 2> /dev/null"` == "" ]]; then
	eval "$docker_remote run -d --net host --name $supervisor_container_name raspberry.prostor.storm.supervisor:1.0.2"
#        sleep $waiting
        echo "Prostor supervisor container is created and launched"
else
	eval "$docker_remote start $supervisor_container_name"
#       sleep $waiting
        echo "Prostor supervisor container is started"
fi
