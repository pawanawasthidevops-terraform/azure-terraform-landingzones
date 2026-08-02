resource "azurerm_resource_group" "resource_rgs" {
  for_each = var.rgs
  name     = each.key
  location = each.value
}

