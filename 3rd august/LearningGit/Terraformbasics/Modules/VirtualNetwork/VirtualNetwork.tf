resource "azurerm_virtual_network" "resource_vnets" {
  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = [each.value.address_prefix]
}