# Prostor Framework

Contact: Nebil BEN MABROUK (nebil.benmabrouk@gmail.com)

## Introduction

Prostor is a location-aware distributed dataflow computation system that it is based on [Apache Storm](http://storm.apache.org/). Prostor makes it easy to process unbounded streams of data, while deploying computations on specific locations defined by developers (instead of the dynamic scheduling proposed by Apache Storm) . 

Prostor presents the following features:

- It is based on Apache Storm and accordingly supports all Storm features;
- It comprehends a custom location-aware scheduler ([Prostor-Scheduler](https://github.com/nebil-ben-mabrouk/Prostor-Scheduler)), which enables deploying each component instance (of a Storm topology) on supervisor hosts specified by the developer;
- The location-aware scheduler embeds a REST server and supports synchronous communication with Storm topologies (i.e., dataflows) at run-time;
- Prostor implements custom stream groupings ([Prostor-Stream-Groupings](https://github.com/nebil-ben-mabrouk/Prostor-Stream-Groupings)), which promote (i) local streaming (between component instances running on the same hosts) and (ii) location-aware streaming (between components that run on specific hosts defined by the developer);
- Prostor is a virtualized framework (thanks to Docker), i.e., all Prostor components run within docker containers;
- Prostor implements a Storm worker that is able to run on limited-resource devices (notably raspberry pi).

## Prostor Components
In this repository, we provide a version of Prostor to be installed on a cluster of two machines:

1.  A commodity computer (we call it *prostor-master*),  which hosts the follwing components:
	- Zookeeper (coordination server)
	- Nimbus (Storm master)
	- Supervisor (Storm worker)
	- UI (Storm user interface)
	- Client (Storm client needed to deploy applications)
2.   A raspberry pi (we call it *prostor-slave*), which hosts the follwing components:
	- Supervisor (Storm worker)

The goal is to run Storm topologies distributed over both hosts.

## Pre-requisites
Installing Prostor requires:

- Docker (Engine) and Docker Compose on *prostor-master*;
- Docker (Engine) on *prostor-slave*;
- Editing '/etc/hosts' of both machines to add IP addresses corresponding to the hostnames *prostor-master* and *prostor-slave*.

## Installation
```
git clone git://github.com/nebil-ben-mabrouk/prostor-framework.git
```
To install Prostor, two folders named 'master' and 'slave' are provided; All the elements required for the installation exist in these folders;

- The folder 'master' is to be copied in the host *prostor-master*. In our case, we choose the directory '/opt/prostor/master'
- The folder 'slave' is to be copied in the host *prostor-slave*. In our case, we choose the directory '/opt/prostor/slave'
- The whole installation is to be launched using the script 'prostor-wrapper.sh'.
	- The installation on *prostor-slave* is performed remotely (from the host *prostor-master*) using Docker commands in the form: 
	``` DOCKER_API_VERSION=1.23 docker -H=prostor-slave:2375```  *append-docker-cmd*
	- The installation on *prostor-slave*  runs the scripts '/opt/prostor/master/slave-build-images.sh' and '/opt/prostor/master/slave-run-containers.sh'.
	- In the above scripts, please check and configure the version and the port of Docker (installed on *prostor-slave*). 
	- If any problems occur, the installation on *prostor-slave* can be performed locally (from the host *prostor-slave*) by running the scripts 'slave-build-images-locally.sh' and 'slave-run-containers-locally.sh'. Both scripts are in the folder '/opt/prostor/slave' already copied in *prostor-slave*.
	
#### Check the installation
- Check runnig containers on both hosts (*prostor-master* and *prostor-slave*)
- In *prostor-master* five containers should be running (prostor\_zookeeper, prostor\_nimbus, prostor\_ui, prostor\_supervisor, prostor\_client)
- In *prostor-slave*  the container prostor\_slave\_supervisor should be running
- In a web browser, access Storm UI via the address: http://*prostor-master*:8889
	- In this interface, check whether Nimbus is running with the address *prostor-master*
	- Check that two Storm workers (with the addresses *prostor-master* and *prostor-slave*) are running
- The ports used by containers running on *prostor-master*:

	| Public port (host)      | Container port       | Container           |
	|-------------------------|----------------------| --------------------|
	| 8888                    | 8888                 | prostor_zookeeper   |
	| 2181                    | 2181                 | prostor_zookeeper   |
	| 3888                    | 3888                 | prostor_zookeeper   |
	| 2888                    | 2888                 | prostor_zookeeper   |
	| 6627                    | 6627                 | prostor_nimbus      |
	| 3772                    | 3772                 | prostor_nimbus      |
	| 3773                    | 3773                 | prostor_nimbus      |
	| 8889                    | 8889                 | prostor_ui          |
	| 8000                    | 8000                 | prostor_supervisor  |
	| 6700                    | 6700                 | prostor_supervisor  |
	| 6701                    | 6701                 | prostor_superviso   |
	| 6702                    | 6702                 | prostor_supervisor  |
	| 6703                    | 6703                 | prostor_supervisor  |
	| 8282                    | 8282                 | prostor_supervisor  |
	
- The ports used by containers running on *prostor-slave*:

	|  Public port (host)      | Container port        | Container                      |
	| -------------------------|-----------------------| -------------------------------|
	| 8000                     | 8000                  | prostor\_slave\_supervisor     |
	| 6700                     | 6700                  | prostor\_slave\_supervisor     |
	| 6701                     | 6701                  | prostor\_slave\_supervisor     |
	| 6702                     | 6702                  | prostor\_slave\_supervisor     |
	| 6703                     | 6703                  | prostor\_slave\_supervisor     |
	| 8282                     | 8282                  | prostor\_slave\_supervisor     |


## Credits 

Prostor is built based on the following works:
- https://github.com/wurstmeister/storm-docker
- https://github.com/lpicanco/docker-storm
- https://github.com/Baqend/tutorial-swarm-storm

