source "1_az_cli_config.sh"

echo "Checking AZ CLI is installed"
az --version &> /dev/null
if [ $? != 0 ]
then
    echo "ERROR - Please install AZ CLI"
    exit 1
fi

echo "Creating RG $rg_name in region $region"
az group create --location $region --resource-group $rg_name -o none

echo "Creating cognitive service account $cognitive_service_account_name in $rg_name"
az cognitiveservices account create --kind "OpenAI" --location $region -n "$cognitive_service_account_name" -g $rg_name --sku "S0" -o none

echo "Creating cognitive service account $cognitive_service_account_name in $rg_name"
az cognitiveservices account deployment create  \
--name "$cognitive_service_account_name" \
--resource-group $rg_name \
--deployment-name $model_deployment_name \
--model-name $oai_model \
--model-version $oai_model_version \
--model-format OpenAI \
--sku-capacity $number_of_ptus \
--sku-name ProvisionedManaged

