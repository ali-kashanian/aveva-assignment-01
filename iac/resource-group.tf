resource "azurerm_resource_group" "aveva-assignment" {
  location = var.location
  name     = var.application_name
  
  tags = {
    environment = var.env_id
    src = var.src_key
    context = var.context_key
  }
}