#!/bin/bash

remote_java_dockerfile_on_raspberry="/opt/prostor/slave/java"
remote_supervisor_dockerfile_on_raspberry="/opt/prostor/slave/storm/supervisor"

docker_remote="DOCKER_API_VERSION=1.23 docker -H=prostor-slave:2375"


if [[ `eval "$docker_remote images -q raspberry.prostor.java:8 2> /dev/null"` == "" ]]; then
	eval "$docker_remote build -t raspberry.prostor.java:8 $remote_java_dockerfile_on_raspberry"
else
	echo "Raspberry java image already exists!"
fi


# build Storm base image
if [[ `eval "$docker_remote images -q raspberry.prostor.storm.supervisor:1.0.2 2> /dev/null"` == "" ]]; then
	eval "$docker_remote build -t raspberry.prostor.storm.supervisor:1.0.2 $remote_supervisor_dockerfile_on_raspberry"
	exit 0
else
	echo "Raspberry storm supervisor image already exists!"
	exit 0
fi
