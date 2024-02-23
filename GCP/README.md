# GCP - OpenTofu

Este projeto cria os seguintes recursos:
+ Resource Group; 
+ VN;
+ Subnet Publica e Privada;
+ IP Publico Linux;
+ IP Publico Windows;
+ Network Interface Linux;
+ Network Interface Windows;
+ Container Blob;
+ Container Group;
+ Network Security Group Publica;
+ Azure SQL MSSQL;
+ Azure SQL POSTGRES;
+ Azure SQL MYSQL;
+ Azure Storage Account;
+ Chave Publica e Privada;
+ VM Linux com NFS montado;
+ VM WIndows **em teste para montar ao subir com o terraform**;
+ CosmoDB;
+ IP Publico VPN;
+ Subnet VPN;
+ Virtual Network Gateway;
+ Local Network Gateway;

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

Praticamente todas as configurações do deploy estão declaradas no arquivo **gcp.vars.tf**, interessante modicar as seguinte variaveis para não ocorrer problemas no ambiente:
+ **var.rg.region** _linha 9_ - Coloque a região do seu ambiente;
+ **var.rg.onprem** _linha 12_ - Modifique para a faixa de IP do seu onpremises para a conexão da VPN;
+ **var.cosmodb.location** _linha 62_ - Coloque a região do seu ambiente;
+ **var.key.private** _linha 144_ - Nome da chave .pem;
+ **var.vn.ip** _linha 158_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.sb_public.ip** _linha 171_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.sb_private.ip** _linha 179_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.sb_vpn** _linha 187_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.storage.name** _linha 264_ - Valor unico, modifique para que não haja problemas no deploy;
+ **var.lng.gw** _linha 330_ - Modifique para o IP publico do seu onpremises para a conexão da VPN;
+ **var.vng_connection** _linha 343_ - Modifique a sua pré-shared key para conexão da VPN;

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