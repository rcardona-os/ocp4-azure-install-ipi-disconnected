# Define VNet and Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "ocp_vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
}