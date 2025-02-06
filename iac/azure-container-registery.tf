resource "azurerm_container_registry" "aveva-registery" {
  name                          = "avevaassignment"
  resource_group_name           = azurerm_resource_group.aveva-assignment.name
  location                      = azurerm_resource_group.aveva-assignment.location
  sku                           = "Standard"
  admin_enabled                 = true
  public_network_access_enabled = true
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}