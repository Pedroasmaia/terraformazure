# Organizando o Terraform - Pastas, Modules, Workspaces e Terragrunt

🗂️ [Diretório](/7%20-%20Organizando%20o%20Terraform/)


## Opções de Organização da Nossa Iac

### Ver o IaC como produto

Olhar pra infraestrutura como código como produto pode ser util. Se precisamos versionar um serviço como uma VM com load-balancer já crie um *produto*, caso necessário utilizar uma vm com load-balancer em outro projeto, apenas reutilize o código.

### Separando os Ambientes

#### Organizando em Pastas

Dentro do repositório vai existir uma pasta para cada ambiente e os comando do terraform serão executados dentro delas.

- Pontos Positivos
  - Fácil adição e remoção de ambientes
  - Mudanças em um ambiente não interfere nos outros ambientes
- Pontos Negativos
  - Duplicidade excessiva
  - Impossibilidade de alterar todos ao mesmo tempo


Veja o seguinte provisonamento de um appservice

~~~hcl
resource "azurerm_windows_web_app" "appservice" {
  name = "appservice-${lower(var.ambiente)}"
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
  service_plan_id = azurerm_service_plan.service_plan.id
  site_config {
  }
}
~~~

Quando definir as variaveis dentro de tfvars e passar o comando:
~~~ powershell
terraform plan -var-file="main.tfvars"
terraform apply -var-file="main.tfvars" -auto-approve
~~~

Será provisionado com os valores declarados dentro do arquivo ou seja, se a variavel ambiente tem o valor de "Dev" o nome do app service acima será : appservice-dev

Também é possível usar o tfvars individual dentro de cada pasta passando o comando:

~~~powershell
terraform plan -var-file="path/main.tfvars"
terraform apply -var-file="path/main.tfvars" -auto-approve
~~~

Podemos dividir em pastas utilizando TFState e TFplan por ambiente usando o sub comando **-state**:

~~~powershell
terraform plan -var-file="path/main.tfvars" -state="path/main.tfplan"
terraform apply -var-file="path/main.tfvars" -state="path/main.tfplan"
terraform destroy -var-file="path/main.tfvars" -state="path/main.tfplan"
~~~

Assim gerando um tfplan em cada basta, atribuindo os recursos a cada pasta do seu ambiente

#### Organizando em Módulos

Modulo é um contêiner que guarda as configurações

- Pontos Positivos:
  - Versionamento
  - Padronização
- Pontos Negativos:
  - Complexidade

Assim é o esqueleto de um modulo:

~~~hcl
  module "dev" {
    source = "../infra"
    ambiente = "dev"
    location = "westus2"
  }
~~~

No **source** ficam as informações que serão provisionadas

#### Workspace

Workspaces são espaços de trabalho e são gerenciados pelo comando

~~~powershell
  terraform workspace
~~~

alguns subcomandos são:

- show: mostra em qual workspace estamos
- list: lista todos os workspace
- select "name" : seleciona o workspace
- new "name" : cria um novo workspace
- delete "name" : apaga o workspace

Não muda a configuração de pastas mas ajuda a testar os scripts

Podemos apenas selecionando com qual workspace queremos trabalhar seguindo os seguintes comandos:

~~~powershell
terraform workspace select name
terraform plan
terraform apply
~~~

#### Yeoman

Yeoman é um Gerador de templetes

1. Instalar o Node JS
2. Com o NodeJS instalado rode o comando:
~~~powershell
  npm install -g yo
~~~
3. Instalamos agora o gerador de templete terraform
~~~powershell
  npm install -g generator-az-terra-module
~~~
4. Crie uma pasta chamada go-work no disco local C:\ e adicione como variável de ambiente com o nome GOPATH


#### Terragrunt

🌐 [Documentação Util](https://terragrunt.gruntwork.io/docs/#getting-started)