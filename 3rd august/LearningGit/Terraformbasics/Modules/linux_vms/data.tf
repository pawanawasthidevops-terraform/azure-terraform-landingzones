data "azurerm_resource_group" "data_rgs" {
  name = "avaaneurg2"
}

data "azurerm_subnet" "data_subnet" {
  name                 = "avaaneudev-fsubnet1"
  virtual_network_name = "avaavnetdev-SHUDH"
  resource_group_name  = "avaaneurg2"
}

data "azurerm_public_ip" "data_pip" {
   name                = "pip1"
  resource_group_name = "avaaneurg2" 
}

data "azurerm_key_vault" "data_kv" {

  name                = "avaakeyvault1-dev"
  resource_group_name = "avaaneurg1"
}

data "azurerm_key_vault_secret" "data_secret" {

  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.data_kv.id
}