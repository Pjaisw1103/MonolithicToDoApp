variable "networks" {

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))

    dns_servers                    = optional(list(string))
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)

    ddos_protection_plan = optional(map(object({
      id = string
      enable = string
    })),{})

    encryption = optional(map(object({
      enforcement = string
    })),{})


    subnets = optional(list(object({
      name                              = string
      address_prefixes                  = list(string)
      security_group                    = optional(string)
      default_outbound_access_enabled   = optional(bool, true)
      private_endpoint_network_policies = optional(string, "Disabled")
      service_endpoints                 = optional(list(string))

      delegation = optional(list(object({

        name               = string
        service_delegation = map(string)
      })),[])
    })), [])
  }))
}



