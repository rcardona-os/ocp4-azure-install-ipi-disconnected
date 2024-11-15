# Public subnet to host registry
resource "azurerm_subnet" "public_subnet" {
  name                 = "public_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.public_subnet_cidr]
  depends_on           = [azurerm_virtual_network.vnet]  # Ensure VNet is created first
}

# Private subnet masters
resource "azurerm_subnet" "master_subnet" {
  name                 = "master_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.master_subnet_cidr]
  depends_on           = [azurerm_virtual_network.vnet]  # Ensure VNet is created first
}

# Private subnet workers
resource "azurerm_subnet" "worker_subnet" {
  name                 = "worker_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.worker_subnet_cidr]
  depends_on           = [azurerm_virtual_network.vnet]  # Ensure VNet is created first
}