resource "azurerm_container_registry" "aveva-registery" {
  name                          = "avevaregistery${var.env_id}"
  resource_group_name           = azurerm_resource_group.aveva-assignment-1.name
  location                      = azurerm_resource_group.aveva-assignment-1.location
  sku                           = "Standard"
  admin_enabled                 = true
  public_network_access_enabled = true
  
  tags = {
    environment = var.env_id
    src = var.src_key
  }
}