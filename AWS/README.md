# AWS - OpenTofu

Este projeto cria os seguintes recursos:
+ Key Pair; 
+ VPC;
+ Subnet Publica e Privada;
+ Internet Gateway;
+ Route Tables Publica;
+ Security Group Publica;
+ Network Access Control List Publica;
+ EFS;
+ RDS;
+ S3;
+ EC2 Linux com ponto de montagem EFS;
+ EC2 Windows;
+ DynamoDB;

## Instalação AWS CLI

+ GNU/LINUX

1. Para realizar a instalação é necessário ter o pacote unzip:
   - dnf

   ```bash
      dnf install unzip -y
   ```

   - apt

   ```bash
      apt install unzip -y
   ```

2. Seguir a instalação dependendo da sua arquitetura:
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

1. Para realizar a instalação baixe o arquivo MSI do [AWS CLI](https://awscli.amazonaws.com/AWSCLIV2.msi) e execute-o ou rode o seguinte comando no powershell:
```bash
   msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```
## Autenticar ao ambiente AWS

1. Crie uma [access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) com as permissões necessárias ou para facilitar o laboratório, crie para um usuário com permissões de **admin**.

2. Salve o **Access Key ID** e o **Secret Access Key** para ser usado posteriormente.

3. Execute no terminal o comando **aws configure** e preencha as informações conforme o seu ambiente:

   + Access Key;
   + Secret Access Key;
   + Region;
   + Output;

4. Pronto, já está conectado ao seu ambiente **AWS**!

## Alterar variaveis

Praticamente todas as configurações do deploy estão declaradas no arquivo **aws.vars.tf**, interessante modicar as seguinte variaveis para não ocorrer problemas no ambiente:
+ **var.region.name** _linha 8_ - Recomendado utilizar o passado no comando **aws configure**;
+ **var.kp.private** _linha 68_ - Nome da chave .pem;
+ **var.s3_bucket_name** _linha 101_ - Nomes de bucket precisam ser unicos, modifique-o para que não haja erros no deploy;
+ **var.vpc.cidr** _linha 113_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.sb_public.cidr** _linha 128_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;
+ **var.sb_private.cidr** _linha 136_ - Modifique a faixa de IP para não sobrepor a do seu ambiente;

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

+ [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)