variable "vms" {
  type = map(object({
    nic-name                        = string
    nic-location                    = string
    resource_group_name             = string
    subnet_name                     = string
    vnet_name                       = string
    nsg-name                        = string
    nsg-location                    = string
    vm-name                         = string
    vm-location                     = string
    kv_name                         = string
    kvs_name                        = string
    size                            = string
    script_name                     = string
    admin_username                  = optional(string)
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool, true)
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

