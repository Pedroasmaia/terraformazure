# Importando e exportando infraestrutura

🗂️ [Diretório](https://dev.azure.com/pedroasmaia/Meus%20Estudos/_git/terraformazure?path=/8%20-%20Importando%20e%20Exportando)

## Como podemos importar recursos:

~~~powershell
terraform import <resource name>.<resource label> <azure resource id>
~~~

Suponha que exista uma VNET no azure e você precisa importar para o terraform, o 1° passo é escrever seu grupo de recurso e a vnet pode deixar sem declarar seus valores:

~~~hcl
resource "azurerm_resource_group" "rgvnet" {
  
}
resource "azurerm_virtual_network" "vnet" {
  
}
~~~

Após isto pegue o valor do ID do grupo de recurso que deseja importar, pode pegar pelo portal ou usando do comando

~~~powershell
az group list
# Output: 
# [
#   {
#     "id": "/subscriptions/xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/rg-vnet",
#     "location": "westus2",
#     "managedBy": null,
#     "name": "rg-vnet",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": {},
#     "type": "Microsoft.Resources/resourceGroups"
#   }
# ]
~~~

Conclua passando o seguinte comando:

~~~powershell
terraform import azurerm_resource_group.alias id
~~~

Onde alias é o declarado no terraform: "rgvnet" e id é a saida do comando do azure cli : "/subscriptions/xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/rg-vnet"

E faça o mesmo com a VNET podendo pegar o ID em propriedades no portal Azure.

Podemos conferir os em nosso tfstate com o comando

~~~powershell
terraform state list
~~~

## Alterando recursos importados:

Seguindo o mesmo cenario, podemos adicionar as informações que já temos no terraform.tfstate no script adicionado e alterarmos como desejarmos
ficando assim o nosso grupo de recurso e vnet:

~~~hcl
resource "azurerm_resource_group" "rgvnet" {
  name = "rgvnet"
  location = "brazilsouth"
  tags = {
    "env" = "dev"
  }
}
resource "azurerm_virtual_network" "vnet" {
  name = "vnet"
  resource_group_name =  azurerm_resource_group.rgvnet.name
  location = "brazilsouth"
  address_space = [ "10.0.0.0/16","192.168.0.1" ]
  tags = {
    "env" = "dev"
  }
}
~~~

## Exportando Gráfico de sua infraestrutura

Para gerar um arquivo de imagem para vizualizar nossa infraestrutura precisamos baixar a biblioteca Graphviz

🌐 [Documentação Util](https://graphviz.org/)

Para instalar rode o comando

~~~powershell
choco install graphviz
~~~

e após isso bastar rodar o comando

~~~powershell
terraform graph | dot -Tsvg > graph.svg
~~~
