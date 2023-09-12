resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.resource_group_name_prefix}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscluster-dns"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "agentpool"
    node_count = var.system_node_count
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }

  # Configuration to define the network settings for AKS cluster 
  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }

}

#Create the acr
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  sku                 = "Standard"
  admin_enabled       = true
}