# Provision Azure OpenAI PTUs in an automated manner
### Overview ###
Once your subscription as PTU quota, you can provision these PTU resources via the portal or using automated means. 
This repo will show examples on how to privision PTUs using bash scripts with:
- Azure CLI
- Terraform

- **AZ CLI** For AZ CLI deployments, all configuration has been placed in [1_az_cli_config.sh](https://github.com/SeryioGonzalez/az_openai_ptus_automated/blob/main/1_az_cli_config.sh "1_az_cli_config.sh"). Modify the entries in this configuration file for your desired outcome. Then execute the following script as with any other bash script:
```
$ ./1_create_environment_az_cli.sh
```