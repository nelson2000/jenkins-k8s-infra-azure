#!/bin/bash
export rg_name=CICD-RG-TEST
export location=canadaeast
export vm_name=jenkins
export admin_user=jenkins
export myvnet=MainVnet
export subnet1=subnetA-$myvnet

az vm create -g CICD-RG-TEST -n jenkins --image Ubuntu2204 --admin-username jenkins --generate-ssh-keys --availability-set myAvailabilitySet --nics myNic1 --size Standard_D4ds_v4 --public-ip-sku Standard --custom-data userdata-jenkins.sh
   
az vm open-port --port 8080 --priority 1010 --resource-group CICD-RG-TEST --name jenkins
az vm open-port --port 22 --priority 1011 --resource-group CICD-RG-TEST --name jenkins
az vm open-port --port 443 --priority 1012 --resource-group CICD-RG-TEST --name jenkins



