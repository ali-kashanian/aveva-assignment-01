resource "azurerm_container_app_environment" "aveva-container-app-environment" {
  name                       = "aveva-container-app-environment-${var.env_id}"
  location                   = azurerm_resource_group.aveva-assignment-1.location
  resource_group_name        = azurerm_resource_group.aveva-assignment-1.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aveva-log-analytics-workspace.id
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}