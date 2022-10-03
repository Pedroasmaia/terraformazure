#! Juntar valores no terraform usando o merge()
resource "azurerm_resource_group" "rg-merge" {
  name = "rg-merge"
  location = var.localtion
  tags = merge(var.tags,{
    "plataforma" : "udemy"
    "curso" : "terraform"
  })
}