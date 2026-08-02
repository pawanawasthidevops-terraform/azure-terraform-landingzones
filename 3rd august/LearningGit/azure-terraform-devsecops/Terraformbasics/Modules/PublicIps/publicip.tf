resource "azurerm_public_ip" "resource_pips" {
  for_each = var.pips
      name                = each.key
      resource_group_name = each.value.resource_group_name
      location            = each.value.location
      allocation_method   = each.value.allocation_method
}
