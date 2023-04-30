#!/bin/bash
export rg_name=CICD-RG-TEST
export location=canadaeast
export vm_name=jenkins
export admin_user=jenkins
export myvnet=MainVnet
export subnet=subnetA-$myvnet

# create a key vault to store your certificate

if [ $(az group exists --name $rg_name) = false ]; then 
    
    az group create --name $rg_name --location $location
    resource=$(az group show -n $rg_name --query "id" --output tsv)
    az tag create --resource-id $resource --tags Team=DataScience Environment=Development Project=TI

else
   echo $rg_name' already exist, change name of resource group to continue'
fi



# create vnet and subnet


az network vnet create \
    --resource-group $rg_name \
    --name $myvnet \
    --address-prefix 192.168.0.0/16 \
    --subnet-name $subnet \
    --subnet-prefix 192.168.1.0/24

# create public ip for vnet

az network public-ip create \
    --resource-group $rg_name \
    --name myPublicIP \
    --dns-name mypublicdns

# create security group 
az network nsg create \
    --resource-group $rg_name \
    --name network-SG-$myvnet

az network nsg rule create \
    --resource-group $rg_name \
    --nsg-name network-SG-$myvnet \
    --name ssh_network-sg \
    --protocol tcp \
    --priority 1000 \
    --destination-port-range 22 \
    --access allow

az network nsg rule create \
    --resource-group $rg_name \
    --nsg-name network-SG-$myvnet \
    --name Web-network-sg \
    --protocol tcp \
    --priority 1001 \
    --destination-port-range 80 \
    --access allow


az network nic create \
    --resource-group $rg_name \
    --name myNic1 \
    --vnet-name $myvnet \
    --subnet $subnet \
    --public-ip-address myPublicIP \
    --network-security-group network-SG-$myvnet


# create availability set

az vm availability-set create \
    --resource-group "$rg_name" \
    --name myAvailabilitySet
