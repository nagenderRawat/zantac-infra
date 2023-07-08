resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group
  node_resource_group = var.node_resource_group
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.cluster_version

  default_node_pool {
    name                 = "agentpool"
    vm_size              = var.node_size
    vnet_subnet_id       = var.vnet_subnet_id
    node_count           = var.node_count
    orchestrator_version = var.cluster_version
    zones                = var.node_availability_zones
    enable_auto_scaling  = var.enable_auto_scaling
    max_count            = var.nodes_max_count
    min_count            = var.nodes_min_count
  }

  network_profile {
    network_plugin = var.cluster_network_model
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    managed = true
  } 
}
