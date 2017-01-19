#!/bin/bash

waiting1=30
waiting2=110

cd master

./master-build-images.sh
./master-run-containers.sh

sleep $waiting1

./slave-build-images.sh
./slave-run-containers.sh

sleep $waiting2

./master-check-supervisors.sh
./master-deploy-dataflow.sh
