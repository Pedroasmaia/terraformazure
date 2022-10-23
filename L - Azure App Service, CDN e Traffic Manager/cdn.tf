resource "azurerm_cdn_profile" "cdnteste" {
  name                = "cdnprofile"
  location            = azurerm_resource_group.rgteste.location
  resource_group_name = azurerm_resource_group.rgteste.name
  sku                 = "Standard_Verizon"
}
resource "azurerm_cdn_endpoint" "cdnteste" {
  name                = "appservice-profile"
  location            = azurerm_resource_group.rgteste.location
  resource_group_name = azurerm_resource_group.rgteste.name
  profile_name        = azurerm_cdn_profile.cdnteste.id
  origin_host_header  = azurerm_windows_web_app.appslots.default_hostname
  origin {
    name      = azurerm_windows_web_app.appslots.name
    host_name = azurerm_windows_web_app.appslots.default_hostname
  }
  delivery_rule {
    name = "enforceHttps"
    order = "1"
  }
}
