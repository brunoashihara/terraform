# AZURE - OpenTofu

Este projeto cria os seguintes recursos de forma modular:
+ Blob;
+ Container;
+ Cosmodb;
+ Mysql;
+ Mssql;
+ Postgres;
+ DNS Zone para acesso privado do fileshare;
+ FIleshare pela subnet privado;
+ Chave de acesso pem;
+ Vnet com subnet privado e publico;
+ NSG privado e publico;
+ Resource Group para neste deploy;
+ Storage Account;
+ VM linux (montado fileshare) e windows (em teste a montagem) na subnet publico;
+ VPN configurada faltando apenas modificar dados do onpremises;

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

+ [Azure cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script)
