resource "azurerm_log_analytics_workspace" "aveva-log" {
  name                = "${var.application_name}-log-analytics-${var.env_id}"
  location            = azurerm_resource_group.aveva-assignment.location
  resource_group_name = azurerm_resource_group.aveva-assignment.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = var.env_id
    src = var.src_key
  }
}