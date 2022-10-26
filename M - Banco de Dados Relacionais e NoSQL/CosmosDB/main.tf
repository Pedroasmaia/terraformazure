provider "azurerm" {
  features {

  }
}
resource "azurerm_resource_group" "rgtest" {
  name     = "meugrupo"
  location = "brazilsouth"
}

resource "azurerm_cosmosdb_account" "meucosmos" {
  name                = "meucosmosepikamane"
  location            = azurerm_resource_group.rgtest.location
  resource_group_name = azurerm_resource_group.rgtest.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  enable_automatic_failover = true
  capabilities {
    name = "EnableAggregationPipeline"
  }
  capabilities {
    name = "mongoEnableDocLevelTTL"
  }
  capabilities {
    name = "MongoDBv3.4"
  }
  capabilities {
    name = "EnableCassandra"
  }
  consistency_policy {
    consistency_level = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix = 100000
  }
  geo_location {
    location = "westus2"
    failover_priority = 1
  }
}
