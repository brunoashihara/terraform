# TERRAFORM

Laboratórios de IaC para os providers AWS, AZURE, GCP e OCI.

## Checklist

1. Instalação OpenTofu;
2. Instalação cli do provider;
3. Modificar variaveis do terraform;
4. Caso use todo o ambiente como modulo o main.tf está criado na raiz, o que faltaria é copiar as variaveis nos modulos e tfvars como os exemplos abaixo:
    + **azure/variables.tf** para a raiz como **azure_vars.tf**;
    + **azure/terraform.tfvar**s para a raiz como **azure.tfvars**;
5. Executar o tofu apply referenciando os tfvars pois ele lê apenas um arquivo (terraform.tfvars) e se tiver com outro nome ele não vai ler;
```bash 
tofu apply -var-file="aws.tfvars" -var-file="azure.tfvars" -var-file="gcp.tfvars" -var-file="oci.tfvars"
```

**Por experiência recomendo o uso de ambiente GNU/Linux pois o Windows e Antvírus podem invalidar e acusar as instalações como maliciosas. Em caso de uso do Windows podemos usar o [WSL](https://learn.microsoft.com/pt-br/windows/wsl/install)**

## Instalação OpenTofu

+ GNU/Linux

```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method standalone
rm install-opentofu.sh
```

+ Windows PowerShell

1. No Windows precisa habilitar o uso de scripts tanto com o **RemoteSigned** ou o **Unrestricted**

```bash
Set-ExecutionPolicy RemoteSigned
```

2. Para instalar o OpenTofu ele pede para instalar o cosign ou GPG e adicionar o caminho para a instalação, no caso podemos ignorar a verificação com o -skipVerify _não recomendado_

```bash
Invoke-WebRequest -outfile "install-opentofu.ps1" -uri "https://get.opentofu.org/install-opentofu.ps1"
& .\install-opentofu.ps1 -installMethod standalone -skipVerify
Remove-Item install-opentofu.ps1
```

## Instalação cli do provider

+ [AWS](https://github.com/brunoashihara/terraform/blob/main/AWS/)
+ [AZURE](https://github.com/brunoashihara/terraform/blob/main/AZURE/)
+ [GCP](https://github.com/brunoashihara/terraform/blob/main/GCP/)
+ [OCI](https://github.com/brunoashihara/terraform/blob/main/OCI/)

## Referências

+ [OpenTofu docs](https://opentofu.org/docs/)
+ [Terraform docs](https://registry.terraform.io/providers)
