resource "azurerm_virtual_network" "virtual_networks" {
  for_each                       = var.networks
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  location                       = each.value.location
  address_space                  = each.value.address_space
  tags                           = each.value.tags
  dns_servers                    = lookup(each.value, "dns_servers", [])
  flow_timeout_in_minutes        = lookup(each.value, "flow_timeout_in_minutes", 4)
  private_endpoint_vnet_policies = lookup(each.value, "private_endpoint_vnet_policies", "Disabled")

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name                              = subnet.value.name
      address_prefixes                  = subnet.value.address_prefixes
      security_group                    = subnet.value.security_group
      default_outbound_access_enabled   = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies = subnet.value.private_endpoint_network_policies
      service_endpoints                 = subnet.value.service_endpoints

      dynamic "delegation" {
        for_each = subnet.value.delegation
        content {
          name               = subnet.value.delegation.name
          service_delegation = subnet.value.delegation.service_delegation
        }
      }
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }
}
