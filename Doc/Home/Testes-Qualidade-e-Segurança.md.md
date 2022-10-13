# Testes e Qualidade e Segurança

🗂️ [Diretório](https://dev.azure.com/pedroasmaia/Meus%20Estudos/_git/terraformazure?path=/11%20-%20Testes%20Qualidade%20e%20Seguran%C3%A7a)


## Podemos pegar informações do client usando o metodo data
~~~hcl
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name = "kv-terraform"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id = data.azurerm_client_config.current.tenant_id
}
~~~