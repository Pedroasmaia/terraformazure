remote_state{
    backend = "azurerm"
    config = {
        subscription_id = ""
        resource_group_name = ""
        storage_account_name = ""
        container_name = ""
        key = ""
}

input{
    local = westus2
    rg = rg-teste
}