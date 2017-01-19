#!/bin/bash

# build java image
if [[ "$(docker images -q prostor.java:8 2> /dev/null)" == "" ]]; then
	docker build -t prostor.java:8 java
else
	echo "Prostor java image already exists!"
fi

# build zookeeper image
if [[ "$(docker images -q prostor.zookeeper:3.5.2-alpha 2> /dev/null)" == "" ]]; then
	docker build -t prostor.zookeeper:3.5.2-alpha zookeeper 
else
	echo "Prostor zookeeper image already exists!"
fi

# build Storm base image
if [[ "$(docker images -q prostor.storm:1.0.2 2> /dev/null)" == "" ]]; then
	docker build -t prostor.storm:1.0.2 storm/base
else
	echo "Prostor storm base image already exists!"
	exit 0
fi
