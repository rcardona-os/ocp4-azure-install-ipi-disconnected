# terraform.tfvars

location            = "West Europe"
subscription_id     = "1ef85589-af77-454a-ad02-1814094bb52b"
resource_group_name = "ocp_private_rg"
vnet_name           = "ocp_vnet"
vnet_cidr           = "10.0.0.0/16"
public_subnet_name  = "public_subnet"
public_subnet_cidr  = "10.0.0.0/24"
master_subnet_name  = "master_subnet"
master_subnet_cidr  = "10.0.1.0/24"
worker_subnet_name  = "worker_subnet"
worker_subnet_cidr  = "10.0.2.0/24"