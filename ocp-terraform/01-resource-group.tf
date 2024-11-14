# Define the Resource Group
resource "azurerm_resource_group" "private_rg" {
  name     = "ocp-private-rg"
  location = "East US"
}