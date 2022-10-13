provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-kv"
  location = "westus2"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = "kv-terraform"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  access_policy = [{
    key_permissions         = ["create", "get"]
    object_id               = data.azurerm_client_config.current.object_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    application_id          = "list"
    certificate_permissions = ["list"]
    storage_permissions     = ["list"]
    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
  }]
}
resource "azurerm_key_vault_secret" "secret" {
  name            = "secret-terraform"
  value           = "avcbasfhasfja"
  key_vault_id    = azurerm_key_vault.kv.id
  expiration_date = "2022-12-31T00:00:00Z"
}

data "azurerm_key_vault_secret" "getsecret" {
  name = "secret-terraform"
  key_vault_id = azurerm_key_vault.kv.id
}

output "secret_value" {
  value = data.azurerm_key_vault_secret.getsecret.value
}