resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                = "vmlinux"
  resource_group_name = azurerm_resource_group.rgvmtf.name
  location            = azurerm_resource_group.rgvmtf.location


  size                  = "Standard_B1ls"
  admin_username        = "l1eflinux"
  admin_password        = "myp@assw@rd"
  network_interface_ids = [azurerm_network_interface.nic-teste.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  admin_ssh_key {
    username   = "l1eflinux"
    public_key = file("~/.ssh/id_rsa.pub")
  }
 source_image_reference {
    publisher = "Cononical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "lastet"
  }
}