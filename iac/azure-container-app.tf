resource "azurerm_container_app" "aveva-container-app" {
  name                         = "aveva-app-${var.env_id}"
  resource_group_name          = azurerm_resource_group.aveva-assignment-1.name
  container_app_environment_id = azurerm_container_app_environment.aveva-container-app-environment.id
  revision_mode                = "Multiple"

  template {
    min_replicas = 1
    max_replicas = 3

    container {
      name   = "aveva-app-container-${var.env_id}"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080

    traffic_weight {
      percentage = 100
      label = "primary"
      latest_revision = true
    }
  }
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}