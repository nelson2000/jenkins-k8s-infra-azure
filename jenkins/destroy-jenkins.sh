#!/bin/bash

export rg_name=CICD-RG-TEST

az group delete -n $rg_name --yes
