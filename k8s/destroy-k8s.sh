#!/bin/bash

export rg_name1=K8S-RG-TEST

# az group delete -n $rg_name1 --yes

if [ $(az group exists --name $rg_name1) = true ]; then 

    az group delete -n $rg_name1 --yes
    
else
   echo $rg_name1' has not been provisioned, nothing to delete'
fi
