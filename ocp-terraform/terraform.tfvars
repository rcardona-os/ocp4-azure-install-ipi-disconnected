# terraform.tfvars

location            = "East US"
subscription_id     = "1ef85589-af77-454a-ad02-1814094bb52b"
resource_group_name = "ocp_private_rg"
vnet_cidr           = "10.0.0.0/16"
public_subnet_cidr  = "10.0.0.0/24"
master_subnet_cidr  = "10.0.1.0/24"
worker_subnet_cidr  = "10.0.2.0/24"
ssh_key_path        = "~/.ssh/id_rsa.pub"