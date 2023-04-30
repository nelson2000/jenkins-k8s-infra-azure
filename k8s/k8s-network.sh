#!/bin/bash
export rg_name1=K8S-RG-TEST
export location=canadaeast
export myvnet1=MainVnet-k8s
export subnet1=subnetA-$myvnet1

# create a key vault to store your certificate


if [ $(az group exists --name $rg_name1) = false ]; then 
    
    az group create --name $rg_name1 --location $location
    resource=$(az group show -n $rg_name1 --query "id" --output tsv)
    az tag create --resource-id $resource --tags Team=DataScience Environment=Development Project=TI

else
   echo $rg_name1' already exist, change name of resource group to continue'
fi


az network vnet create \
    --resource-group $rg_name1 \
    --name $myvnet1 \
    --address-prefix 10.0.0.0/16 \
    --subnet-name $subnet1 \
    --subnet-prefix 10.0.0.0/24

# create public ip for vnet

az network public-ip create \
    --resource-group $rg_name1 \
    --name myPublicIP1 \
    --dns-name mypublicdns1

# create security group 
az network nsg create \
    --resource-group $rg_name1 \
    --name network-SG-$myvnet1

az network nsg rule create \
    --resource-group $rg_name1 \
    --nsg-name network-SG-$myvnet1 \
    --name ssh_network-sg1 \
    --protocol tcp \
    --priority 1000 \
    --destination-port-range 22 \
    --access allow

az network nsg rule create \
    --resource-group $rg_name1 \
    --nsg-name network-SG-$myvnet1 \
    --name Web-network-sg1 \
    --protocol tcp \
    --priority 1001 \
    --destination-port-range 80 \
    --access allow


az network nic create \
    --resource-group $rg_name1 \
    --name myNic2 \
    --vnet-name $myvnet1 \
    --subnet $subnet1 \
    --public-ip-address myPublicIP1 \
    --network-security-group network-SG-$myvnet1


# create availability set

az vm availability-set create \
    --resource-group "$rg_name1" \
    --name myAvailabilitySet1
