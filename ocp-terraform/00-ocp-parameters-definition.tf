# Define the Azure region where resources will be deployed.

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

# Specify the Azure subscription ID where the deployment will occur.
variable "subscription_id" {
  description = "The subscription to use for installation"
  type        = string
}

# Specify the name of the resource group in the Azure subscription.
variable "resource_group_name" {
  description = "The name of the resource group to use for installation"
  type        = string
}

# Provide the name of the existing Virtual Network (VNet) for infrastructure services in the OpenShift installation.
variable "vnet_infra" {
  description = "Existing VNet that hosts the infrastructure services for OCP installation"
  type        = string
}

# Define the private domain name used for OpenShift Private DNS configuration.
variable "private_domain" {
  default     = "ocp-private.com"
  description = "Private domain name for the OpenShift installation"
  type        = string
}

# Specify the management IP address or CIDR block for Azure resources.
variable "management_azure_ip" {
  default     = "ocp-private.com"
  description = "4.150.240.10/32"
  type        = string
}

# Define the CIDR block for the Virtual Network (VNet) used in this configuration.
variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

# Specify the CIDR block for the public subnet within the Virtual Network.
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet in the Virtual Network"
  type        = string
  default     = "10.0.0.0/24"
}

# Specify the CIDR block for the master subnet within the Virtual Network.
variable "master_subnet_cidr" {
  description = "The CIDR block for the master subnet in the Virtual Network"
  type        = string
  default     = "10.0.1.0/24"
}

# Specify the CIDR block for the worker subnet within the Virtual Network.
variable "worker_subnet_cidr" {
  description = "The CIDR block for the worker subnet in the Virtual Network"
  type        = string
  default     = "10.0.2.0/24"
}

# Provide the local path to the SSH public key used to access virtual machines.
variable "ssh_key_path" {
  description = "Local path to the SSH public key used to access VMs"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}