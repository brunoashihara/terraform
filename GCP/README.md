# GCP - OpenTofu

This project creates the following resources in a modular way:
+ Linux Compute (with Filestore mounted) in the public subnet;
+ Filestore in the private subnet;
+ Firestore;
+ Private and public Firewalls;
+ GKE (Google Kubernetes Engine);
+ PEM access key;
+ VPC with public and private subnets;
+ Project specifically for this deployment;
+ SQL;
+ Storage;
+ VPN configured (you just need to update on-premises data);

## Installing GCP CLI

+ GNU/Linux

1. To install the GCP CLI, your system must have:

   + Python 3.8.x to 3.12.x

2. Install according to your Linux architecture:

   - x64

   ```bash
   curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-465.0.0-linux-x86_64.tar.gz
   tar -xf google-cloud-cli-465.0.0-linux-x86_64.tar.gz
   ./google-cloud-sdk/install.sh
   ```

   - ARM

   ```bash
   curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-465.0.0-linux-arm.tar.gz
   tar -xf google-cloud-cli-465.0.0-linux-x86_64.tar.gz
   ./google-cloud-sdk/install.sh
   ```

   - x86

   ```bash
   curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-465.0.0-linux-x86.tar.gz
   tar -xf google-cloud-cli-465.0.0-linux-x86_64.tar.gz
   ./google-cloud-sdk/install.sh
   ```

+ Windows

```bash
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
& $env:Temp\GoogleCloudSDKInstaller.exe
    
```
## Authenticate with the GCP Environment

1. Run the following command and follow the instructions to authenticate:

```bash
gcloud auth login --no-launch-browser
``` 

2. Done! You're now connected to your **GCP environment**!

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

+ [GCP cli](https://cloud.google.com/sdk/docs/install#linux)
