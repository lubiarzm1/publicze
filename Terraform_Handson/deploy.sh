#!/bin/bash
set -e
terraform init -reconfigure -backend-config=plecy_mateusza.tfvars
terraform fmt --recursive
terraform plan -var-file=mateusz.tfvars -out=build.plan
if [[ $? -eq 0 ]]
then
    terraform apply build.plan
else
    echo "ERROR: Unable to proceed due to plan failure"
fi
