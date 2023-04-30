

#!/bin/bash
export rg_name=CICD-RG-TEST

# az group delete -n $rg_name --yes

if [ $(az group exists --name $rg_name) = true ]; then 

    az group delete -n $rg_name --yes
    
else
   echo $rg_name' has not been provisioned, nothing to delete'
fi
