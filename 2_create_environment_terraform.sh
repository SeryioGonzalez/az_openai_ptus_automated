
echo "Checking TF is installed"
terraform -version &> /dev/null

if [ $? != 0 ]
then
    echo "ERROR - Please install terraform"
    exit 1
fi

set -e

echo "Initializing TF"
terraform init 

echo "Creating TF plan"
terraform plan

echo "Applying TF plan"
terraform apply