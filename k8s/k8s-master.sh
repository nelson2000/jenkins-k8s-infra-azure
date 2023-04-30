#!/bin/bash
export rg_name1=K8S-RG-TEST
export location=canadaeast
export vm_name=master
export admin_user=master
export myvnet1=MainVnet-k8s
export subnet1=subnetA-$myvnet1


az vm create -g K8S-RG-TEST -n master-k8s --image Ubuntu2204 --admin-username master --generate-ssh-keys --availability-set myAvailabilitySet1 --nics myNic2 --size Standard_D4ds_v4 --public-ip-sku Standard --custom-data userdata-master.sh
   
az vm open-port --port 80 --priority 1010 --resource-group K8S-RG-TEST --name master-k8s
az vm open-port --port 22 --priority 1011 --resource-group K8S-RG-TEST --name master-k8s
az vm open-port --port 443 --priority 1012 --resource-group K8S-RG-TEST --name master-k8s