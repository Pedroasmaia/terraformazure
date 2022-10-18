resource "azurerm_resource_group" "grupoexemplo" {
  name = "grupo-exemplar"
  location = "brazilsouth"
  tags = {
    data = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}