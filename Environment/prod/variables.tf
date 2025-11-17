variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

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





variable "public_ips" {
  description = "Map of Public IP configurations"
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    allocation_method       = string # Static / Dynamic
    sku                     = optional(string, "Standard")
    sku_tier                = optional(string, "Regional")
    zones                   = optional(list(string), [])
    ip_version              = optional(string, "IPv4")
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number, 4)
    ip_tags                 = optional(map(string), {})
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    tags                    = optional(map(string), {})
  }))
}

variable "vms" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      resource_group_name    = string
      vnet_name              = string
      subnet_name            = string
      pip_name               = string
      nsg_name               = string
      kv_name                = string
      kvs_name               = string
      vm_name                = string
      size                   = string
      admin_username         = optional(string)
      admin_password         = optional(string)
      source_image_reference = map(string)
    }
  ))
}

variable "key_vaults" {
  type = map(object({
    kv_name             = string
    location            = string
    resource_group_name = string
  }))
}

variable "key_vault_secret" {
  type = map(object({
    kvs_name  = string
    kvs_value = string
    kv_name   = string
  }))
}
