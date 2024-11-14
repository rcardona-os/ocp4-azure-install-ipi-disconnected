# Define VNet and Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "ocp-private-vnet"
  location            = azurerm_resource_group.ocp-private-rg.location
  resource_group_name = azurerm_resource_group.ocp-private-rg.name
  address_space       = ["10.0.0.0/16"]
}

# Public subnet to host registry
resource "azurerm_subnet" "registry_subnet" {
  name                 = "registry-subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Private subnet in availability zone 0
resource "azurerm_subnet" "az0_subnet" {
  name                 = "az0_subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Private subnet in availability zone 1
resource "azurerm_subnet" "az1_subnet" {
  name                 = "az1_subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Private subnet in availability zone 2
resource "azurerm_subnet" "az2_subnet" {
  name                 = "az2_subnet"
  resource_group_name  = azurerm_resource_group.ocp-private-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"] 
}