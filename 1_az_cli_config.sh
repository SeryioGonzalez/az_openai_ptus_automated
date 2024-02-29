#!/bin/bash

rg_name="test-ptu-cli"
region="swedencentral"
oai_model="gpt-4"
oai_model_version="0613"
number_of_ptus="100"

#DERIVATED NAMES
cognitive_service_account_name="$rg_name-cogn-account"
model_deployment_name="$rg_name-$oai_model-deployment"