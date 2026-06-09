variable "appgws" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    gateway_ip_configuration_name  = string
    subnet_name                    = string
    vnet_name                      = string
    frontend_port_name             = string
    frontend_port                  = number
    frontend_ip_configuration_name = string
    public_ip_name                 = string

    backend_address_pool_name  = string
    nic1_name                  = string
    nic2_name                  = string
    backend_http_settings_name = string
    cookie_based_affinity      = string
    path                       = string
    port                       = number
    protocol                   = string
    request_timeout            = number

    http_listener_name        = string
    listener_protocol         = string
    request_routing_rule_name = string
    rule_type                 = string
    priority                  = number
  }))

  default = {}
}