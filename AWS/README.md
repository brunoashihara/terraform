# AWS - OpenTofu

This project creates the following resources in a modular way:
+ DynamoDB;
+ EC2 instances (Linux with EFS mounted, and Windows) in the public subnet;
+ EFS in the private subnet;
+ PEM access key;
+ NACLs for both private and public subnets;
+ RDS;
+ Route tables for both private and public subnets;
+ S3;
+ Private and public Security Groups;
+ VPC with one private and one public subnet;

## Installing AWS CLI

+ GNU/Linux

1. You must have the `unzip` package installed:
   - Using `dnf`:

   ```bash
   dnf install unzip -y
   ```

   - apt

   ```bash
   apt install unzip -y
   ```

2. Install the CLI based on your system architecture:
   - x86

   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ``` 

   - ARM

   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ``` 

+ MacOS

```bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

+ Windows

1. Download the [AWS CLI](https://awscli.amazonaws.com/AWSCLIV2.msi) and run it, or use the following PowerShell command:
```bash
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```
## Authenticate with the AWS Environment

1. Create an [access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) with the necessary permissions. For lab purposes, you can use a user with **admin** privileges.

2. Save the **Access Key ID** and  **Secret Access Key** to be used later.

3. Run the following command in your terminal and fill in the prompts according to your environment:
```bash
aws configure
```

   + Access Key;
   + Secret Access Key;
   + Region;
   + Output;

4. Done! You're now connected to your **AWS environment**!

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

+ [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)