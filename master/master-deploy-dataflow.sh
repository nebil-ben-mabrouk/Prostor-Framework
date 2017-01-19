#!/bin/bash

waiting=10

if [[ "$(docker exec -it  prostor_client storm list | grep prostor-empty-data-flow 2> /dev/null)" != "" ]]; then
	echo "Application already exists. It will be killed !!"
	docker exec -it prostor_client storm kill prostor-empty-data-flow -w $waiting
	sleep $waiting 
fi
echo "Deploying application 'srol-prostor-data-flow' !!"
docker exec -it  prostor_client storm jar /opt/apache-storm-1.0.2/topologies/prostor-empty-data-flow.jar org.apache.storm.flux.Flux --remote /opt/apache-storm-1.0.2/topologies/prostor-empty-data-flow.yaml
