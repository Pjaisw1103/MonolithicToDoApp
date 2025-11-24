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
      script_name            = string
      admin_username         = optional(string)
      admin_password         = optional(string)
      source_image_reference = map(string)
    }
  ))
}
