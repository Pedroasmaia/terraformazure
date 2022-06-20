# Definir qual provedor vamos usar:
provider "azurerm" {
  features {}
}
#Criando recursos
resource "azurerm_resource_group" "apelido" {
  name     = "exemplo de nome"
  location = "Brazil South"
}
#Solicitar algum retorno no console durante o provisionamento
output "rgname" {
  value = azurerm_resource_group.apelido.name
}