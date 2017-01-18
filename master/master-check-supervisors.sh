#!/bin/bash

curl --silent prostor-master:8889/api/v1/supervisor/summary | grep "prostor-master" >/dev/null
if [ $? -eq 1 ] ; then
  echo "supervisor on prostor-master is not running"
  /opt/prostor/master/prostor-master-build-images.sh
  /opt/prostor/master/prostor-master-run-containers.sh
else  
  echo "supervisor q-prostor is running"
fi

curl --silent q-prostor:8889/api/v1/supervisor/summary | grep "m1-prostor" >/dev/null
if [ $? -eq 1 ] ; then
  echo "supervisor m1-prostor is not running"
  /root/docker/prostor/quartier/m1-build-images.sh
  /root/docker/prostor/quartier/m1-run-containers.sh
else  
  echo "supervisor m1-prostor is running"
fi
