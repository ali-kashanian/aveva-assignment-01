resource "azurerm_mssql_server" "sql-server" {
  name                         = "aveva-sql-server-${var.env_id}"
  resource_group_name          = azurerm_resource_group.aveva-assignment-1.name
  location                     = azurerm_resource_group.aveva-assignment-1.location
  version                      = "12.0"
  administrator_login          = "ali"
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = "1.2"

  tags = {
    environment = var.env_id
    src         = var.src_key
  }
}

resource "azurerm_mssql_database" "sql-db" {
  name           = "aveva-sql-db"
  server_id      = azurerm_mssql_server.sql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 2
  sku_name       = "GP_S_Gen5_2"
  zone_redundant = false

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    environment = var.env_id
    src         = var.src_key
  }
}

resource "azurerm_mssql_firewall_rule" "sql-firewall-rule" {
  name                = "AllowAllAzureServicesAndResources"
  server_id           = azurerm_mssql_server.sql-server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}