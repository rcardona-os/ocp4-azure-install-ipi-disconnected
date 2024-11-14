# variables.tf

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "subscription_id" {
  description = "The subscription to use for installation"
  type        = string
}

variable "resource_group_name" {
  description = "The subscription to use for installation"
  type        = string
}

variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "master_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "worker_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ssh_key_path" {
  description = "Local path to the ssh key used to access vms"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}