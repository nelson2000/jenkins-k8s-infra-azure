#!/bin/bash

# install jenkins
sh jenkins/jenkins-network.sh
sh jenkins/jenkins.sh

# install k8s, 1 master, 2nodes 
sh k8s/k8s-network.sh
sh k8s/k8s-master.sh
sh k8s/k8s-node.sh




# sh jenkins/destroy-jenkins.sh
# sh k8s/destroy-k8s.sh
