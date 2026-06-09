variable "ilbs" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    frontend_ip_configuration = object({
      name                          = string
      private_ip_address_allocation = optional(string, "Dynamic")
      private_ip_address            = optional(string)
    })
    backend_pool_name = string
    probe_name        = string
    subnet_name       = string
    vnet_name         = string
    probe_port        = number
    probe_protocol    = optional(string, "Tcp")
    rule_name         = string
    rule_protocol     = optional(string, "Tcp")
    rule_port         = number
    backend_port      = number
  }))
}
