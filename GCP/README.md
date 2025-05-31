# GCP - OpenTofu

Este projeto cria os seguintes recursos de forma modular:
+ Projeto; 
+ VPC;
+ Subnet Publica e Privada;
+ Firewall Publica e Privada;
+ IP Linux;
+ Compute Linux com NFS montado;
+ Filestore;
+ Firestore;
+ GKE;
+ Chave privada e publica;
+ Cloud SQL postgres;
+ Cloud Storage;
+ VPN Gateway;
+ IP VPN;
+ Forwarding Rules;
+ VPN Tunnels;
+ VPN Route Table;

## Instalação GCP CLI

+ GNU/LINUX

1. Para instalar o gcp cli o linux precisa dos pacotes:

   + Python 3.8.x ~ 3.12.x;

2. Instale conforme a arquitetura do seu linux:

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
## Autenticar ao ambiente GCP

1. Execute o comando abaixo e siga os passos para se autenticar:

```bash
gcloud auth login --no-launch-browser
``` 

2. Pronto, já está conectado ao seu ambiente **GCP**!

## Alterar variaveis

Antes de fazer o deploy consultar o arquivo **terraform.tfvars** e alterar campos principalmente relacionados a IPs

## Executar OpenTofu

1. Para iniciar o OpenTofu navegue até o diretório que contêm o arquivo **main.tf** e execute o seguinte comando:

```bash
tofu init
```

2. Observe se não ocorreu erros e execute os comandos para arrumar a formatação e validar os arquivos .tf:

```bash
tofu fmt
tofu valdiate
```

3. Execute o comando abaixo para descrever o planejamento do deploy:

```bash
tofu plan
```

4. Em caso de nenhum erro pode executar o comando abaixo para aplicar os deploys:

```bash
tofu apply --auto-approve
```

5. Para destruir todo o ambiente execute o comando abaixo:

```bash
tofu destroy --auto-approve
```

**OBS: Aguarde a falha ou a conclusão do apply ou do destroy, em caso de paradas forçadas o OpenTofu perde sua sincronia do tfstate com a realidade do seu ambiente, pode ser corrigido com o comando _tofu refresh_:**

```bash
tofu refresh
```

Em caso negativo ao tentar sincronizar o status, se for necessário destruir o ambiente este deve ser destruido os recursos de forma manual.

## Referências

+ [GCP cli](https://cloud.google.com/sdk/docs/install#linux)
