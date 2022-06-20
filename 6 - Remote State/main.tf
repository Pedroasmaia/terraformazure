terraform {
  backend "azurerm"{
      subscription_id = "subscription_id" #Isso não consta no curso, apos enfrentar alguns erros 404, achei no stackoverflow
      resource_group_name = "resource_group_name"
      storage_account_name = "storage_account_name"
      container_name = "container_name"
      key = "key"
  }
}
provider "azurerm" {
    features {
      
    }
}
resource "azurerm_resource_group" "rgstate" {
  name = "rg-terraformstate-poc"
  location = "brazilsouth"
}