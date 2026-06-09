variable "databases" {
  type = map(object({
    server_name         = string
    resource_group_name = string
    location            = string
    version             = string
    kv_name             = string
    kvs_name            = string
    administrator_login = string
    database_name       = string
    sku_name            = string
    collation           = optional(string)
    max_size_gb         = number
  }))
  default = {}
}




