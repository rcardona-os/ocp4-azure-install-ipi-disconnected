# Defining NAT Gateway to access management.azure.com
resource "azurerm_nat_gateway" "master_subnet_nat_gateway" {
  name                = "master-subnet-nat-gateway"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_public_ip.nat_public_ip] # Ensure public IP is created first
  idle_timeout_in_minutes = 10
}

# Create a Public IP for the NAT Gateway
resource "azurerm_public_ip" "nat_public_ip" {
  name                = "nat-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_public_ip_association" {
  nat_gateway_id       = azurerm_nat_gateway.master_subnet_nat_gateway.id
  public_ip_address_id = azurerm_public_ip.nat_public_ip.id
}