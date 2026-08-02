rgs = {
  "avaaneurg2" = "centralindia"
}

vnets = {
  vnet1 = {
    name           = "avaavnetdev-SHUDH"
    location       = "centralindia"
    address_prefix = "10.0.0.0/16"
    resource_group = "avaaneurg2"
  }
}

subnets = {
  avaaneudev-fsubnet1 = {
    address_prefix       = ["10.0.1.0/24"]
    resource_group_name  = "avaaneurg2"
    virtual_network_name = "avaavnetdev-SHUDH"
  }
  avaaneudev-bsubnet1 = {
    address_prefix       = ["10.0.2.0/24"]
    resource_group_name  = "avaaneurg2"
    virtual_network_name = "avaavnetdev-SHUDH"
  }
}

pips = {
  pip1 = {
    resource_group_name = "avaaneurg2"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  frontendvm1 = {
    nic_name                        = "frontendnic"
    size                            = "Standard_D2_v3"
    admin_username                  = "adminuser123"
    admin_password                  = "Admin@12345"
    disable_password_authentication = "false"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
        backendvm1 = {
    nic_name                        = "backendnic"
    size                            = "Standard_D2_v3"
    admin_username                  = "adminuser123"
    admin_password                  = "Admin@12345"
    disable_password_authentication = "false"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}

keyvaults = {
  kv1 = {
    name                        = "avaakeyvault1-dev"
    rbac_authorization_enabled  = false
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

kvsecret = {
  name  = "secret-sauce"
  value = "Admin@123"
}