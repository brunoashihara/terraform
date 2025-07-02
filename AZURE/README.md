# AZURE - OpenTofu

This project creates the following resources in a modular way:
+ Blob storage;
+ Container;
+ Cosmos DB;
+ MySQL;
+ MSSQL;
+ PostgreSQL;
+ DNS Zone for private access to the File Share;
+ File Share mounted in the private subnet;
+ PEM access key;
+ VNet with public and private subnets;
+ Public and private NSGs;
+ Resource Group specific to this deployment;
+ Storage Account;
+ Linux VM (with File Share mounted) and Windows VM (File Share mounting in testing) in the public subnet;
+ Configured VPN (only requires updating on-premises information);

## Installing Azure CLI

+ GNU/Linux

1. To install the Azure CLI, your Linux system must include:

   + Python 3.6.x, 3.7.x, or 3.8.x  
   + `libffi`  
   + OpenSSL 1.0.2

```bash
curl -L https://aka.ms/InstallAzureCli | bash
```

+ MacOS

```bash
brew update && brew install azure-cli
```

+ Windows

```bash
winget install -e --id Microsoft.AzureCLI
```
## Authenticate with the Azure Environment

1. Run the following command and follow the steps to authenticate:

```bash
az login
``` 

2. Done! You're now connected to your **AZURE environment**!

## Modify variables

Before deploying, check the **terraform.tfvars** file and update any fields related to IPs, etc.

## Running OpenTofu

1. To start using OpenTofu, navigate to the directory containing the **main.tf** file and run:

```bash
tofu init
```

2. Ensure there are no errors, then run the formatting and validation commands:

```bash
tofu fmt
tofu valdiate
```

3. To generate a deployment plan:

```bash
tofu plan
```

4. If there are no errors, apply the deployment with:

```bash
tofu apply --auto-approve
```

5. To destroy the entire environment:

```bash
tofu destroy --auto-approve
```

> **NOTE**: 
> Wait for the apply or destroy process to finish or fail. Forcing it to stop may cause OpenTofu to lose sync with the actual state of your infrastructure. If that happens, run: **tofu refresh**.

> If Autonomous Database created an automatic backup, **tofu destroy --auto-approve** might fail when trying to delete the compartment. This happens because backups take time to be fully removed. Make sure the Autonomous Database has disappeared from the compartment, and then delete the compartment manually if needed.

```bash
tofu refresh
```

If syncing fails or is inaccurate, you may need to manually destroy each resource.

## References

+ [Azure cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script)
