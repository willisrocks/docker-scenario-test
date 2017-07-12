# Scapy Hunt Scenario Docker Test

A Docker configuration for testing the [scapy hunt security excercises](https://github.com/jfsulliv/scapyHunt)

## Installing Docker
This project relies on Docker (Community Edition) to virtualize the excercise. Docker runs natively on Linux, but you can run it on virtualized environments on OS X and Windows.

### Docker on Windows

* If you run 64bit Windows 10 Pro, Enterprise, or Education editions, the recommended way to install Docker is through the [Docker for Windows](https://docs.docker.com/docker-for-windows/install/) application.

* For other versions of Windows, the recommended way to install Docker is the the [Docker Toolbox for Windows](https://docs.docker.com/toolbox/overview/) application.

### Docker on OS X

* The recommended way to install Docker on a Mac is through the [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) application.

### Docker on Linux

* There are many mays to install Docker on your distribution of choice in Linux. To install Docker on Ubuntu, you could follow the official Docker [instructions](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository).

## Building and Running the Scenario

* Build the Dockerfile: ```docker image build -t scapyhunt .```
* Start the containers: ```docker-compose up -d```
* View the open SSH ports: ```docker-compose ps```
* SSH into a container: ```ssh -p 49105 0.0.0.0```
* View instructions: ```cat instructions.txt```
* Happy hunting!
