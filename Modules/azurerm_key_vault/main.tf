data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  for_each                    = var.key_vaults
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "kv_secret" {
  for_each = var.key_vault_secret

  name         = each.value.kvs_name
  value        = each.value.kvs_value
  key_vault_id = azurerm_key_vault.key_vault[each.value.kv_name].id
}
