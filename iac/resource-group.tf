resource "azurerm_resource_group" "aveva-assignment-1" {
  location = var.location
  name     = "aveva-assignment-01"
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}