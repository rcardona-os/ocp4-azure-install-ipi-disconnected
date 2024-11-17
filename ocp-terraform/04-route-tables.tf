# Create a Route Table for Public Subnet (Allows Internet Access)
resource "azurerm_route_table" "public_route_table" {
  name                = "public-route-table"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  route {
    name                   = "AllowInternetAccess"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
  }
}

# Create a Route Table for Private Subnets (Restricts to VNet CIDR)
resource "azurerm_route_table" "private_route_table" {
  name                = "private-route-table"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  route {
    name                   = "AllowVNetAccess"
    address_prefix         = var.vnet_cidr
    next_hop_type          = "VnetLocal"
  }

  # Allowing access to IP for management.azure.com
  route {
    name           = "AllowManagementAzure"
    address_prefix = var.management_azure_ip  # Replace with actual IP for management.azure.com
    next_hop_type  = "Internet"
}
