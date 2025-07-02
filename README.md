# TERRAFORM

IaC labs for AWS, AZURE, GCP, and OCI providers.

## Checklist

1. Install OpenTofu;
2. Install the provider CLI;
3. Modify Terraform variables;
4. If using the entire environment as a module, the `main.tf` is already created in the root. You just need to copy the variables into the modules and `.tfvars` as shown below:
    + **azure/variables.tf** to the root as **azure_vars.tf**;
    + **azure/terraform.tfvars** to the root as **azure.tfvars**;
5. Run `tofu apply` referencing the tfvars, since it only reads `terraform.tfvars` by default, and will not recognize other file names unless specified:
```bash 
tofu apply -var-file="aws.tfvars" -var-file="azure.tfvars" -var-file="gcp.tfvars" -var-file="oci.tfvars"
```

> **Based on experience, I recommend using a GNU/Linux environment since Windows and antivirus software may block or flag installations as malicious. If you're using Windows, it's better to use [WSL](https://learn.microsoft.com/pt-br/windows/wsl/install)**

## OpenTofu Installation

+ GNU/Linux

```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method standalone
rm install-opentofu.sh
```

+ Windows PowerShell

1. In Windows, you need to enable script execution using **RemoteSigned** or **Unrestricted**

```bash
Set-ExecutionPolicy RemoteSigned
```

2. To install OpenTofu, it may ask for cosign or GPG and require adding them to the path. You can skip the verification with -skipVerify (not recommended):

```bash
Invoke-WebRequest -outfile "install-opentofu.ps1" -uri "https://get.opentofu.org/install-opentofu.ps1"
& .\install-opentofu.ps1 -installMethod standalone -skipVerify
Remove-Item install-opentofu.ps1
```

## Provider CLI Installation

+ [AWS](https://github.com/brunoashihara/terraform/blob/main/AWS/)
+ [AZURE](https://github.com/brunoashihara/terraform/blob/main/AZURE/)
+ [GCP](https://github.com/brunoashihara/terraform/blob/main/GCP/)
+ [OCI](https://github.com/brunoashihara/terraform/blob/main/OCI/)

## References

+ [OpenTofu docs](https://opentofu.org/docs/)
+ [Terraform docs](https://registry.terraform.io/providers)
