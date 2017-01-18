#!/bin/bash


# build java image
if [[ "$(docker images -q raspberry.prostor.java:8 2> /dev/null)" == "" ]]; then
	docker build -t raspberry.prostor.java:8 java
else
	echo "Raspberry java image already exists!"
fi

# build Storm base image
if [[ "$(docker images -q raspberry.prostor.storm.supervisor:1.0.2 2> /dev/null)" == "" ]]; then
	docker build -t raspberry.prostor.storm.supervisor:1.0.2 storm/supervisor
	exit 0
else
	echo "Raspberry storm supervisor image already exists!"
	exit 0
fi
