# Define VNet and Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "ocp-private-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr
}

# Public subnet to host registry
resource "azurerm_subnet" "registry_subnet" {
  name                 = "registry-subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Private subnet masters
resource "azurerm_subnet" "master_subnet" {
  name                 = "master_subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Private subnet workers
resource "azurerm_subnet" "worker_subnet" {
  name                 = "worker_subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

