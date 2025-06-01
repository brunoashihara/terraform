# OCI - OpenTofu

Este projeto cria os seguintes recursos de forma modular:
+ AutonomousDB;
+ Bucket; 
+ Compartment para usar neste deploy;
+ Compute linux (montado o file) na subnet publico;
+ Chave de acesso pem;
+ VCN com uma subnet privado e uma publico;
+ NSG privado e publico;
+ Route Table para subnet privado e publico;
+ VPN configurada faltando apenas modificar dados do onpremises;

## Instalação OCI CLI

+ GNU/LINUX

1. Para realizar a instalação rode o comando abaixo:
```bash
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
```

2. No final da instalação vai ser solicitado adicionar o $PATH, se a resposta padrão não for "Y" digite e aperte enter. Após a instalação rode o comando abaixo para reiniciar o shell: 

```bash
exec -l $SHELL
```

+ MacOS

```bash
brew update && brew install oci-cli
```

+ Windows

1. A instalação do Windows é para as versões Windows Server:

```bash
Set-ExecutionPolicy RemoteSigned
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.ps1 -OutFile install.ps1
./install.ps1 -AcceptAllDefaults
```

## Autenticar ao ambiente OCI

1. Crie uma [API Key](https://cloud.oracle.com/identity/domains/my-profile/api-keys) selecionando "**Generate API key pair**".

2. Salve a chave e renomeie para **oci_api_key.pem**.

3. Crie uma pasta para colocar a chave .pem criada:

+ GNU/LINUX

```bash
mkdir -p ~/.oci
```
   + Mova a chave criada para a pasta .oci ou pelo comando **mv** ou por um **WinSCP**.

+ Windows

  + Crie uma pasta **.oci** na pasta raiz do seu usuário e mova a chave para está pasta.

4. Agora vamos corrigir as permissões da chave com o comando:

```bash
oci setup repair-file-permissions --file CAMINHODACHAVE/oci_api_key.pem
```

4. Clique em **Add** e copie as informações para dentro da pasta **.oci** em um arquivo sem extensão com o nome de **config**. Segue um exemplo abaixo, lembrando de substituir as informações com os que aparecer ao criar a **API key**.

```bash
[DEFAULT]
user=ocid1.user.oc1..---------------------------------------------
fingerprint=---------------------------------------------
tenancy=ocid1.tenancy.oc1..----------------------------------
region=------------------
key_file=CAMINHODACHAVE\.oci\oci_api_key.pem
```

5. Por fim, corrigir as permissões da config com o comando:

```bash
oci setup repair-file-permissions --file CAMINHODACHAVE/config
```

6. Pronto, já está conectado ao seu ambiente **OCI**!

## Alterar variaveis

Antes de fazer o deploy consultar o arquivo **terraform.tfvars** e alterar campos principalmente relacionados a IPs

```bash
oci os ns get
```

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

**OBS2: Caso o Autonomous Database executou seu backup automático, ao realizar o comando *tofu destroy --auto-approve* vai falhar na exclusão do *compartment* pois o backup demora algum tempo para ser removido do ambiente, confirme se o Autonomous Database realmente sumiu do seu *compartment* e em caso positivo pesquise por *compartment* e exclua-o manualmente.**

```bash
tofu refresh
```

Em caso negativo ao tentar sincronizar o status, se for necessário destruir o ambiente este deve ser destruido os recursos de forma manual.

## Referências

+ [OCI cli](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI)
