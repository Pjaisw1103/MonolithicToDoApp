data "azurerm_key_vault" "kv" {
  for_each            = var.databases
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kvs" {
  for_each     = var.databases
  name         = each.value.kvs_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
