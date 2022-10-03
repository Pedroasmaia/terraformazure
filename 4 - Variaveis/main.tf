provider "azurerm" {
  features {
  }
}

#! Usando a variavel
resource "azurerm_resource_group" "recursogp" {
  name = var.name-rg
  location = var.localtion
  tags = var.tags
}

#! Para chamar variaveis na linha de comando basta usar o comando adicional -var "env=dev"