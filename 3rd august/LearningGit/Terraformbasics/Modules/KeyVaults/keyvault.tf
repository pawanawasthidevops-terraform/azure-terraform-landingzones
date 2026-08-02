data "azurerm_client_config" "b18g31" {}

data "azurerm_resource_group" "data_rg" {
  name = "avaaneurg1"
}

resource "azurerm_key_vault" "resource_keyvault" {
  for_each                    = var.keyvaults
  name                        = each.value.name
  location                    = data.azurerm_resource_group.data_rg.location
  resource_group_name         = data.azurerm_resource_group.data_rg.name
  rbac_authorization_enabled  = each.value.rbac_authorization_enabled
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.b18g31.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.b18g31.tenant_id
    object_id = data.azurerm_client_config.b18g31.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "resource_kvsecret" {
  name         = var.kvsecret.name
  value        = var.kvsecret.value
  key_vault_id = azurerm_key_vault.resource_keyvault["kv1"].id
}