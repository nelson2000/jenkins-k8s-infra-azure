  #!/bin/bash


# Get the id for VNet1.
echo "Getting the id for $myvnet"
VNet1Id=$(az network vnet show --resource-group $rg_name --name $myvnet --query id --out tsv)

# Get the id for VNet2.
echo "Getting the id for $myvnet2"
VNet2Id=$(az network vnet show --resource-group $rg_name1 --name $myvnet2 --query id --out tsv)

# Peer VNet1 to VNet2.
echo "Peering $myvnet to $myvnet2"
az network vnet peering create --name "Link"$myvnet"To"$myvnet2 --resource-group $resourceGroup --vnet-name $myvnet --remote-vnet $VNet2Id --allow-vnet-access

# Peer VNet2 to VNet1.
echo "Peering $$myvnet to $$myvnet2"
az network vnet peering create --name "Link"$myvnet"To"$myvnet2 --resource-group $resourceGroup --vnet-name $myvnet2 --remote-vnet $VNet1Id --allow-vnet-accessclea