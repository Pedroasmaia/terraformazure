resource "azurerm_windows_virtual_machine" "vmwin" {
  name                = "vm"
  resource_group_name = azurerm_resource_group.rgvmtf.name
  location            = azurerm_resource_group.rgvmtf.location


  size                  = "Standard_B1ls"
  admin_username        = "L1ef"
  admin_password        = "myp@assw@rd"
  network_interface_ids = [azurerm_network_interface.nic-teste.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindosServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "lastet"
  }

}
