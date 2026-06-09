resource "azurerm_virtual_network" "vnet" {
  for_each                       = var.vnet
  name                           = each.value.vnet-name
  location                       = each.value.vnet-location
  resource_group_name            = each.value.resource_group_name
  address_space                  = each.value.address_space
  edge_zone                      = each.value.edge_zone
  dns_servers                    = lookup(each.value, "dns_servers", [])
  flow_timeout_in_minutes        = lookup(each.value, "flow_timeout_in_minutes", 4)
  private_endpoint_vnet_policies = lookup(each.value, "private_endpoint_vnet_policies", "Disabled")
  tags                           = each.value.tags
  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name                              = subnet.value.snet-name
      address_prefixes                  = subnet.value.address_prefixes
      security_group                    = subnet.value.security_group
      default_outbound_access_enabled   = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies = subnet.value.private_endpoint_network_policies
      service_endpoints                 = subnet.value.service_endpoints
      dynamic "delegation" {
        for_each = subnet.value.delegation
        content {
          name = subnet.value.delegation.delegation-name
          service_delegation {
            name    = delegation.value.service_delegation.service_delegation-name
            actions = delegation.value.service_delegation.actions_delegation
          }
        }
      }
    }
  }
}


