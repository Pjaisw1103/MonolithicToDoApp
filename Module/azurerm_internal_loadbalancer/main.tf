resource "azurerm_lb" "ilb" {
  for_each            = var.ilbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                          = each.value.frontend_ip_configuration.name
    subnet_id                     = data.azurerm_subnet.lb_subnet[each.key].id
    private_ip_address_allocation = each.value.frontend_ip_configuration.private_ip_address_allocation
    private_ip_address            = each.value.frontend_ip_configuration.private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = var.ilbs
  loadbalancer_id = azurerm_lb.ilb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_lb_probe" "probe" {
  for_each        = var.ilbs
  loadbalancer_id = azurerm_lb.ilb[each.key].id
  name            = each.value.probe_name
  port            = each.value.probe_port
  protocol        = each.value.probe_protocol
}

resource "azurerm_lb_rule" "rule" {
  for_each                       = var.ilbs
  loadbalancer_id                = azurerm_lb.ilb[each.key].id
  name                           = each.value.rule_name
  protocol                       = each.value.rule_protocol
  frontend_port                  = each.value.rule_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration.name
  probe_id                       = azurerm_lb_probe.probe[each.key].id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
}
