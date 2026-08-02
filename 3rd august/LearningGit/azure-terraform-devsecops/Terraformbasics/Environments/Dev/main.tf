module "resourcegroup" {
  source = "../../Modules/ResourceGroup"
  rgs    = var.rgs
}

module "virtualnetwork" {
  depends_on = [module.resourcegroup]
  source     = "../../Modules/VirtualNetwork"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtualnetwork]
  source     = "../../Modules/subnets"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.resourcegroup]
  source     = "../../Modules/PublicIps"
  pips       = var.pips
}

module "kvs" {
  depends_on = [module.resourcegroup]
  source     = "../../Modules/KeyVaults"
  keyvaults  = var.keyvaults
  kvsecret   = var.kvsecret

}

module "vms" {
  depends_on = [module.virtualnetwork, module.pips, module.subnet, module.kvs]
  source     = "../../Modules/linux_vms"
  vms        = var.vms
}
