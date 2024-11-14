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
  description = "The subscription to use for installation"
  type        = string
}