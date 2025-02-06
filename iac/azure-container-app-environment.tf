resource "azurerm_container_app_environment" "aveva-environment" {
  name                       = "${var.application_name}-environment-${var.env_id}"
  location                   = azurerm_resource_group.aveva-assignment.location
  resource_group_name        = azurerm_resource_group.aveva-assignment.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aveva-log.id
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}