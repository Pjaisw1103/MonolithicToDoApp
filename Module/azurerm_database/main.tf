
resource "azurerm_mssql_server" "server" {
  for_each                     = var.databases
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.kvs_name
  administrator_login_password = data.azurerm_key_vault_secret.kvs[each.key].value

}

resource "azurerm_mssql_database" "db" {
  for_each = var.databases

  name        = each.value.database_name
  server_id   = azurerm_mssql_server.server[each.key].id
  sku_name    = each.value.sku_name
  collation   = coalesce(each.value.collation, "SQL_Latin1_General_CP1_CI_AS")
  max_size_gb = each.value.max_size_gb
}

