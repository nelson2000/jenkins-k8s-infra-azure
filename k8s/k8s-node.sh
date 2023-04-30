#!/bin/bash
export rg_name1=K8S-RG-TEST
export location=canadaeast
export vm_name1=node1-k8s
export vm_name2=node2-k8s
export admin_user1=node1
export admin_user2=node2
export myvnet1=MainVnet-k8s
export subnet2=subnetB-$myvnet1
export subnet3=subnetC-$myvnet1

az network vnet subnet create \
  --name $subnet2 \
  --resource-group $rg_name1 \
  --vnet-name $myvnet1 \
  --address-prefix 10.0.1.0/24 \


az network public-ip create \
    --resource-group $rg_name1 \
    --name myPublicIP2 \
    --dns-name mypublicdns2

az network nic create \
    --resource-group $rg_name1 \
    --name myNic3 \
    --vnet-name $myvnet1 \
    --subnet $subnet2 \
    --public-ip-address myPublicIP2 \
    --network-security-group network-SG-$myvnet1

# create availability set

az vm availability-set create \
    --resource-group "$rg_name1" \
    --name myAvailabilitySet2

az vm create -g K8S-RG-TEST -n node1-k8s --image Ubuntu2204 --admin-username node1 --generate-ssh-keys --availability-set myAvailabilitySet2 --nics myNic3 --size Standard_D8ds_v4 --public-ip-sku Standard --custom-data userdata-node1.sh
   
az vm open-port --port 80 --priority 1010 --resource-group K8S-RG-TEST --name node1-k8s
az vm open-port --port 22 --priority 1011 --resource-group K8S-RG-TEST --name node1-k8s
az vm open-port --port 443 --priority 1012 --resource-group K8S-RG-TEST --name node1-k8s

# install #2 node


az network vnet subnet create \
  --name $subnet3 \
  --resource-group $rg_name1 \
  --vnet-name $myvnet1 \
  --address-prefix 10.0.2.0/24 \


az network public-ip create \
    --resource-group $rg_name1 \
    --name myPublicIP3 \
    --dns-name mypublicdns3

az network nic create \
    --resource-group $rg_name1 \
    --name myNic4 \
    --vnet-name $myvnet1 \
    --subnet $subnet3 \
    --public-ip-address myPublicIP3 \
    --network-security-group network-SG-$myvnet1

# create availability set

az vm availability-set create \
    --resource-group "$rg_name1" \
    --name myAvailabilitySet3

az vm create -g K8S-RG-TEST -n node2-k8s --image Ubuntu2204 --admin-username node2 --generate-ssh-keys --availability-set myAvailabilitySet3 --nics myNic4 --size Standard_D8ds_v4 --public-ip-sku Standard --custom-data userdata-node2.sh
   
az vm open-port --port 80 --priority 1010 --resource-group K8S-RG-TEST --name node2-k8s
az vm open-port --port 22 --priority 1011 --resource-group K8S-RG-TEST --name node2-k8s
az vm open-port --port 443 --priority 1012 --resource-group K8S-RG-TEST --name node2-k8s