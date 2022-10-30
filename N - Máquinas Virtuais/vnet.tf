resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  resource_group_name = azurerm_resource_group.rgvmtf.name
  location            = azurerm_resource_group.rgvmtf.location
  address_space       = ["10.0.0.0/16", "192.168.0.0/16"]
}

resource "azurerm_subnet" "snet" {
  name = "snet"
  resource_group_name = azurerm_resource_group.rgvmtf.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "publicip" {
  name = "vmwinservertf-nic"
  location = azurerm_resource_group.rgvmtf.location
  resource_group_name = azurerm_resource_group.rgvmtf.name
  allocation_method = "Dynamic"
  idle_timeout_in_minutes = 30
  domain_name_label = "vmwinservertf"
}

resource "azurerm_network_interface" "nic-teste" {
  name = "vmwinservertfmo"
  location = azurerm_resource_group.rgvmtf.location
  resource_group_name = azurerm_resource_group.rgvmtf.name
  ip_configuration {
    name = "ipexterno-config"
    subnet_id = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id

  }
}
resource "azurerm_network_security_group" "nsgteste" {
  name = "nsg-teste"
  location = azurerm_resource_group.rgvmtf.location
  resource_group_name = azurerm_resource_group.rgvmtf.name
}

variable "entrada" {
  type = map(any)
  default = {
    101 = 80 
    102 = 443 
    103 = 3389 
    104 = 22 
  }
}

resource "azurerm_network_security_rule" "rule_entrada" {
  for_each = var.entrada
  resource_group_name = azurerm_network_security_group.nsgteste.resource_group_name
  name = "porta-entrada-${each.value}"
  priority = each.key
  direction = "Inbound"
  access = "Allow"
  source_port_range = "*"
  protocol = "Tcp"
  destination_port_range = each.value
  source_address_prefix = "*"
  destination_address_prefix = "*"
  network_security_group_name = azurerm_network_security_group.nsgteste.name
}

resource "azurerm_subnet_network_security_group_association" "nsgassociacao" {
  subnet_id = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsgteste.id
  
}