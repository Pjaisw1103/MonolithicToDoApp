data "azurerm_network_interface" "nic" {
  for_each            = var.niclb
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb" "lb" {
  for_each            = var.niclb
  name                = each.value.lb_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "pool" {
  for_each        = var.niclb
  name            = each.value.pool_name
  loadbalancer_id = data.azurerm_lb.lb[each.key].id
}
