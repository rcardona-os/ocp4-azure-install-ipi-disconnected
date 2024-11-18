# Specifies the Azure region where all resources will be deployed.
# Example: "East US" is one of the Azure-supported regions providing high availability and low latency.
location = "East US"

# The unique identifier for the Azure subscription where the resources will be provisioned.
# Replace this with your actual Azure subscription ID to ensure the correct subscription is targeted.
subscription_id = "1ef85589-af77-454a-ad02-1814094bb52b"

# Defines the name of the existing Azure Resource Group where resources will be deployed.
# Resource groups are used to organize and manage resources within Azure.
# Example: "existing_infra_rg" refers to an already existing resource group in Azure.
resource_group_name = "existing_infra_rg"

# Specifies the name of the existing Virtual Network (VNet) in Azure to host infrastructure services.
# VNets provide logical isolation for Azure resources and enable communication between resources.
# Example: "existing_infra_vnet" is the pre-configured VNet for this deployment.
vnet_infra = "existing_infra_vnet"

# Specifies the private domain name to be used for DNS resolution within the OpenShift cluster.
# This is crucial for internal cluster communication and services.
# Example: "ocp-private.com" serves as a private DNS domain name for OpenShift.
private_domain = "ocp-private.com"

💥 IMPORTANT 💥    💥 IMPORTANT 💥    💥 IMPORTANT 💥
# Represents the management IP address or CIDR range that allows specific administrative access to Azure resources. 
#Update the IP address of management.azure.com in the target region.
# Ensure this IP is from a trusted network or device for secure access.
management_azure_ip = "4.150.240.10/32"

# Defines the CIDR block for the entire Virtual Network (VNet) to provide address space for all subnets.
# Example: "10.0.0.0/16" offers 65,536 IP addresses for network configuration.
vnet_cidr = "10.0.0.0/16"

# Specifies the CIDR block for the public subnet within the Virtual Network.
# The public subnet is typically used for resources that require internet access.
# Example: "10.0.0.0/24" provides up to 256 IP addresses for the public-facing subnet.
public_subnet_cidr = "10.0.0.0/24"

# Defines the CIDR block for the master nodes' subnet within the Virtual Network.
# Master nodes manage the OpenShift cluster and coordinate workloads.
# Example: "10.0.1.0/24" allocates a specific range of 256 IP addresses for master nodes.
master_subnet_cidr = "10.0.1.0/24"

# Specifies the CIDR block for the worker nodes' subnet within the Virtual Network.
# Worker nodes run application workloads within the OpenShift cluster.
# Example: "10.0.2.0/24" allocates 256 IP addresses for worker nodes.
worker_subnet_cidr = "10.0.2.0/24"

# Provides the local file path to the SSH public key used to access virtual machines in the cluster.
# This key ensures secure access for administrative purposes.
# Example: "~/.ssh/id_rsa.pub" is the default SSH key location in most Unix-like systems.
ssh_key_path = "~/.ssh/id_rsa.pub"
