# Define the Resource Group
resource "azurerm_resource_group" "ocp_private_rg" {
  name     = var.resource_group_name
  location = var.location
}