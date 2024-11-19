
## OpenShift v4 IPI Installation in Disconnected/Air-Gapped Mode on Azure

In OpenShift Container Platform version 4.17, a private cluster can be deployed into an existing Azure Virtual Network (VNet) on Microsoft Azure. The installation process automatically provisions the necessary infrastructure, which can be customized further. Customization is achieved by modifying parameters in the install-config.yaml file before initiating the cluster installation.

It is possible to deploy a private OpenShift Container Platform cluster that does not expose any external endpoints. Such clusters are restricted to access from an internal network and remain hidden from the internet.

By default, OpenShift Container Platform is configured to use publicly accessible DNS and endpoints. In the case of a private cluster, the DNS, Ingress Controller, and API server are set to private during deployment, ensuring that the cluster resources are only accessible from within the internal network and are not exposed to the internet.

The setup for disconnected or air-gapped mode differs based on how the private mirror registry is populated. The mirror registry can be configured either by directly accessing the Red Hat repositories over a public connection or by using a mobile USB drive to transfer the required images and content offline. This flexibility allows the cluster to adapt to varying levels of network connectivity and security requirements.

#### 🔹 Prerequisites

- Azure subscription with needed privileges [INFO](https://docs.openshift.com/container-platform/4.17/installing/installing_azure/installing-azure-account.html#minimum-required-permissions-ipi-azure_installing-azure-account)

- Creates a credentials configuration file called osServicePrincipal.json, and store it file in the `${HOME}/.azure/` directory. This ensures that the installation program can load the profile when it is creating an OpenShift Container Platform cluster on the target platform.

- To create a private cluster on Microsoft Azure, you must provide an existing private VNet and subnets to host the cluster. The installation program must also be able to resolve the DNS records that the cluster requires. The installation program configures the Ingress Operator and API server for only internal traffic.

