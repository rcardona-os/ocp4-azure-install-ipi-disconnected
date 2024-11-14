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

variable "vnet_name" {
  description = "The subscription to use for installation"
  type        = string
}

variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_name" {
  description = "Name of the subnet to be used to deploy the registry"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "master_subnet_name" {
  description = "Name of the subnet to be used to deploy the contorl plane"
  type        = string
}

variable "master_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "worker_subnet_name" {
  description = "Name of the subnet to be used to deploy the compute nodes"
  type        = string
}

variable "worker_subnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}