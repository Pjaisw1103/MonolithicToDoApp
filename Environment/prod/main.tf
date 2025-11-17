module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks
}

module "publicip" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on       = [module.resource_group]
  source           = "../../Modules/azurerm_key_vault"
  key_vaults       = var.key_vaults
  key_vault_secret = var.key_vault_secret
}

module "virtual_machine" {
  depends_on = [module.network, module.publicip, module.key_vault]
  source     = "../../Modules/azurerm_compute"
  vms        = var.vms
}

