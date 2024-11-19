
## OpenShift v4 IPI Installation in Disconnected/Air-Gapped Mode on Azure

In OpenShift Container Platform version 4.17, a private cluster can be deployed into an existing Azure Virtual Network (VNet) on Microsoft Azure. The installation process automatically provisions the necessary infrastructure, which can be customized further. Customization is achieved by modifying parameters in the install-config.yaml file before initiating the cluster installation.

It is possible to deploy a private OpenShift Container Platform cluster that does not expose any external endpoints. Such clusters are restricted to access from an internal network and remain hidden from the internet.

The setup for disconnected or air-gapped mode differs based on how the private mirror registry is populated. The mirror registry can be configured either by directly accessing the Red Hat repositories over a public connection or by using a mobile USB drive to transfer the required images and content offline. This flexibility allows the cluster to adapt to varying levels of network connectivity and security requirements.

#### 🔹 Prerequisites

- Azure subscription with needed privileges [INFO](https://docs.openshift.com/container-platform/4.17/installing/installing_azure/installing-azure-account.html#installation-azure-limits_installing-azure-account)

- Creates a credentials configuration file called **```osServicePrincipal.json```**, and store it file in the **```${HOME}/.azure/```** directory. This ensures that the installation program can load the profile when it is creating an OpenShift Container Platform cluster on the target platform.

ex.

```bash
$ cat ~/.azure/osServicePrincipal.json  | jq
{
  "subscriptionId": "5rf8r9-ard7e-wr354a-asw2-18qwqx564b52b",
  "clientId": "347e24678-347a-xe131-8233-51234540346c",
  "clientSecret": "m8wda~0adssdI7ZPijweqTNewewLpTtwdeerbnerc_7",
  "tenantId": "rew.onmicrosoft.com"
}
```

- To create a private cluster on Microsoft Azure, you must provide an existing private VNet and subnets to host the cluster. The installation program must also be able to resolve the DNS records that the cluster requires. The installation program configures the Ingress Operator and API server for only internal traffic.

- For an existing existing VNet, the following component should be present:

   ☑️ Subnets

   ☑️ Route tables

   ☑️ VNets

   ☑️ Network Security Groups

#### 🔹 Steps

##### 0. Cloning repo
```bash
$ git clone https://gitlab.com/rcardona/ocp4-azure-install-ipi-disconnected.git
```

##### 1. Update the terraform variables file
```bash
$ cat ocp-terraform/terraform.tfvars
# Specifies the Azure region where all resources will be deployed.
# Example: "East US" is one of the Azure-supported regions providing high availability and low latency.
location = "East US"

# The unique identifier for the Azure subscription where the resources will be provisioned.
# Replace this with your actual Azure subscription ID to ensure the correct subscription is targeted.
subscription_id = "1343589-af77-423a-a322-181434b5477b"

# Defines the name of the existing Azure Resource Group where resources will be deployed.
# Resource groups are used to organize and manage resources within Azure.
# Example: "existing_infra_rg" refers to an already existing resource group in Azure.
resource_group_name = "existing_infra_rg"
.
.
.
.
```

###### 2. In case that the "existing" VNets is not yet provisioned
```bash
$ cd ocp-terraform

$ terraform init

$ terraform plan -out=ocp-infra

$ terraform apply "ocp-infra"
```

##### 2. configure private mirrored registry

Taking in accoun that this VM instances will be provisioned by the terraform plan. This is the [PROCEDURE](https://gitlab.com/rcardona/ocp4-tasks/-/blob/main/cluster-registry/mirror-registry-commons.md) to configure the private mirrored registry.

