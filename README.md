# Scapy Hunt Scenario Docker Test

A Docker configuration for testing the [scapy hunt security excercises](https://github.com/jfsulliv/scapyHunt)

## Instructions

* Build the Dockerfile: ```docker image build -t scapyhunt .```
* Start the containers: ```docker-compose up -d```
* View the open SSH ports: ```docker-compose ps```
* SSH into a container: ```ssh -p 49105 0.0.0.0```
* View instructions: ```cat instructions.txt```
* Happy hunting!
