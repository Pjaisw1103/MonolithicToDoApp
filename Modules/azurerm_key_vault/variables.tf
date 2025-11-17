variable "key_vaults" {
  type = map(object({
    kv_name = string
    location = string
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