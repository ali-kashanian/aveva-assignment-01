resource "azurerm_container_app" "aveva-app" {
  name                         = "${var.application_name}-app-${var.env_id}"
  resource_group_name          = azurerm_resource_group.aveva-assignment.name
  container_app_environment_id = azurerm_container_app_environment.aveva-environment.id
  revision_mode                = "Single"

  template {
    container {
      name   = "${var.application_name}-container-${var.env_id}"
      image  = "docker.io/library/node:lts-alpine"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 3000

    traffic_weight {
      percentage = 100
      label = "primary"
      latest_revision = true
    }
  }
  
  tags = {
    environment = var.env_id
    src = var.src_key
    context = var.context_key
  }
}