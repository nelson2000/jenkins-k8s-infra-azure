#!/bin/bash

export rg_name=K8S-RG-TEST

az group delete -n $rg_name --yes
