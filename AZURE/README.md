# AZURE - OpenTofu

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

## Instalação Azure CLI

+ GNU/LINUX

1. Para instalar o Azure cli o linux precisa dos pacotes:

   + Python 3.6.x, 3.7.x ou 3.8.x;
   + libffi;
   + OpenSSL 1.0.2;

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
## Autenticar ao ambiente Azure

1. Execute o comando abaixo e siga os passos para se autenticar:

```bash
   az login
``` 

2. Pronto, já está conectado ao seu ambiente **AZURE**!

## Alterar variaveis

Praticamente todas as configurações do deploy estão declaradas no arquivo **azure.vars.tf**, interessante modicar as seguinte variaveis para não ocorrer problemas no ambiente:
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

+ [Azure cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script)