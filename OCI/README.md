# OCI - OpenTofu

This project creates the following resources in a modular way:
+ AutonomousDB;
+ Bucket;
+ A dedicated compartment for this deployment;
+ Linux Compute (with file mount) in the public subnet;
+ PEM access key;
+ VCN with one private and one public subnet;
+ Private and public NSGs;
+ Route tables for both private and public subnets;
+ Configured VPN (you only need to update on-premises info);

## Installing the OCI CLI

+ GNU/Linux

1. Run the following command to install:

```bash
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
```

2. At the end of the installation, it will prompt you to add the $PATH. If the default answer isn't "Y", type it and press enter. After the installation, run the command below to reload your shell:

```bash
exec -l $SHELL
```

+ MacOS

```bash
brew update && brew install oci-cli
```

+ Windows

1. Installation on Windows is intended for Windows Server versions:

```bash
Set-ExecutionPolicy RemoteSigned
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.ps1 -OutFile install.ps1
./install.ps1 -AcceptAllDefaults
```

Authenticate with the OCI Environment

1. Create an [API Key](https://cloud.oracle.com/identity/domains/my-profile/api-keys) by selecting "**Generate API key pair**".

2. Save the key and rename it to **oci_api_key.pem**.

3. Create a folder to store the generated .pem key:

+ GNU/LINUX

```bash
mkdir -p ~/.oci
```
   + Move the key to the .oci folder using **mv** or a tool like **WinSCP**.

+ Windows

  + Create a **.oci** folder in your user's home directory and move the key there.

4. Fix file permissions for the key with the following command:

```bash
oci setup repair-file-permissions --file CAMINHODACHAVE/oci_api_key.pem
```

5. Click  **Add** and copy the displayed information into a file named **config** (no file extension) inside the **.oci** folder. Use the example below and replace the values with the ones from your generated **API key**:

```bash
[DEFAULT]
user=ocid1.user.oc1..---------------------------------------------
fingerprint=---------------------------------------------
tenancy=ocid1.tenancy.oc1..----------------------------------
region=------------------
key_file=CAMINHODACHAVE\.oci\oci_api_key.pem
```

6. Finally, fix the permissions of the config file:

```bash
oci setup repair-file-permissions --file CAMINHODACHAVE/config
```

7. You're now connected to your **OCI environment**!

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

+ [OCI cli](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI)
