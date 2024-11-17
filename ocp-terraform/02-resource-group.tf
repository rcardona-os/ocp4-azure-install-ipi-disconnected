# Define the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Define the Resource Group
resource "azurerm_resource_group" "ocp_installer_rg" {
  name     = "ocp_installer_rg"
  location = var.location
}