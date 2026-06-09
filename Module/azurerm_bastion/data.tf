data "azurerm_subnet" "bastion_subnet" {
  for_each             = var.bastion
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.bastion
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
