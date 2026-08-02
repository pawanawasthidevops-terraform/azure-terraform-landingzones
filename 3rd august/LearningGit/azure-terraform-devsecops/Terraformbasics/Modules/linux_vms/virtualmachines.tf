
resource "azurerm_network_interface" "resource_nics" {
  for_each = var.vms
  name                = each.value.nic_name
  location            = data.azurerm_resource_group.data_rgs.location
  resource_group_name = data.azurerm_resource_group.data_rgs.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.data_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "resource_rgs" {
  for_each = var.vms
  name                = each.key
  resource_group_name = data.azurerm_resource_group.data_rgs.name
  location            = data.azurerm_resource_group.data_rgs.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.resource_nics[each.key].id,
  ]
  admin_password = data.azurerm_key_vault_secret.data_secret.value
  disable_password_authentication = each.value.disable_password_authentication


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
    source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}