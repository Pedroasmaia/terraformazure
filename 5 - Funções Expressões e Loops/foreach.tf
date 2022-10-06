resource "azurerm_resource_group" "vnetrg" {
  name = "vnetrg"
  location = "brazilsouth"
}
resource "azurerm_network_security_group" "nsg" {
  name = "treinamento-nsg"
  location = "brazilsouth"
  resource_group_name = "vnetrg"

}
variable "regras_entrada" {
  type = map
  description = "Portas liberadas no NSG"
  default = {
    101 = 80
    102 = 443
    103 = 3389
    104 = 22
  }
}
resource "azurerm_network_security_rule" "entrada_liberada" {
  for_each = var.regras_entrada
  resource_group_name = "vnetrg"
  name = "portaentrada_${each.key}"
  priority = each.key
  destination_port_range = each.value
  direction = "Inbound"
  access = "Allow"
  source_port_range = ""
  protocol = "Tcp"
  source_address_prefix = "*"
  network_security_group_name = "treinamento-nsg"
}
