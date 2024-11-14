# Define VNet and Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "ocp_vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]
}

# Public subnet to host registry
resource "azurerm_subnet" "public_subnet" {
  name                 = "public_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.public_subnet_cidr]
}

# Private subnet masters
resource "azurerm_subnet" "master_subnet" {
  name                 = "master_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.master_subnet_cidr]
}

# Private subnet workers
resource "azurerm_subnet" "worker_subnet" {
  name                 = "worker_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.worker_subnet_cidr]
}