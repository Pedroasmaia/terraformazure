resource "azurerm_resource_group" "grupoexemplostrings" {
  name = "grupo-exemplar"
  location = "brazilsouth"
  tags = {
    data = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    ambiente = lower("Develop")
    colaborador = upper("Pedro Maia")
    recurso = title("grupo de recurso")
  }
}
variable "vnetips" {
  type = list
  default = [ "10.0.0.0/16" ]
}

resource "azurerm_virtual_network" "vnetconcat" {
  name = "vnetconcat"
  location = "brazilsouth"
  resource_group_name = azurerm_resource_group.grupoexemplostrings.name
  address_space = concat(var.vnetips, ["192.168.0.10"])
}

resource "azurerm_virtual_network" "vnetconditon" {
  name = "vnetconditon"
  location = "brazilsouth"
  resource_group_name = azurerm_resource_group.grupoexemplostrings.name
  address_space = length(var.vnetips) == 0 ? ["10.0.0.0/16","192.168.0.10"] : var.vnetips
}