#!/bin/bash

terraform init -reconfigure -backend-config=init_data.tfvars
terraform plan -var-file=plan_data.tfvars -out=building_plan

if [ $? -eq 0 ]; then
    terraform apply building_plan
else
   echo "There is some problems with your terrafrom file"
fi