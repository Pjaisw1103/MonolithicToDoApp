variable "vnet" {
  type = map(object({
    vnet-name                      = string
    vnet-location                  = string
    resource_group_name            = string
    address_space                  = list(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string, "Disabled")
    tags                           = optional(map(string))
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))

    encryption = optional(object({
      enforcement = string
    }))

    subnet = optional(list(object({
      snet-name                         = string
      address_prefixes                  = list(string)
      security_group                    = optional(string)
      default_outbound_access_enabled   = optional(bool, true)
      private_endpoint_network_policies = optional(string, "Disabled")
      service_endpoints                 = optional(list(string))
      delegation = optional(list(object({
        delegation-name = string
        service_delegation = object({
          service_delegation-name = string
          actions                 = list(string)
        })
      })), [])
    })), [])
  }))
}
