// ----------------------------------------------------------------------------
// Resource Group
// ---------------------------------------------------------------------------
resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group
  location = var.location
}

// ----------------------------------------------------------------------------
// Virtual Network
// ----------------------------------------------------------------------------
module "vnet" {
  source         = "./modules/network/vnet"
  resource_group = azurerm_resource_group.resource_group.name
  network_name   = local.network_name
  location       = var.location
  vnet_cidr      = var.vnet_cidr
}

// ----------------------------------------------------------------------------
// Subnet
// ----------------------------------------------------------------------------
module "subnet" {
  source              = "./modules/network/subnet"
  resource_group      = azurerm_resource_group.resource_group.name
  subnet_name         = local.subnet_name
  network_name        = module.vnet.vnet_name
  network_id          = module.vnet.vnet_id
  subnet_cidr         = var.subnet_cidr
  location            = var.location
}

// ----------------------------------------------------------------------------
// AKS Cluster
// ----------------------------------------------------------------------------
module "cluster" {
  source   = "./modules/aks/cluster"
  for_each = { for x in var.clusters : x.cluster_name => x }

  cluster_name                = "${terraform.workspace}-${each.value.cluster_name}"
  node_count                  = each.value.node_count
  node_size                   = each.value.node_size
  vnet_subnet_id              = module.subnet.subnet_id
  dns_prefix                  = "${terraform.workspace}-${each.value.dns_prefix}"
  cluster_version             = each.value.cluster_version
  location                    = var.location
  resource_group              = azurerm_resource_group.resource_group.name
  network_resource_group      = azurerm_resource_group.resource_group.name
  cluster_network_model       = var.cluster_network_model
  node_resource_group         = "${each.value.cluster_name}-${local.cluster_node_resource_group}"
}

// ----------------------------------------------------------------------------
// Setup Azure Container Registry
// ----------------------------------------------------------------------------
module "registry" {
  source = "./modules/registry"

  for_each                = toset(local.container_registry_name)
  location                = var.location
  resource_group          = azurerm_resource_group.resource_group.name
  container_registry_name = each.value
}

// ----------------------------------------------------------------------------
// Kubernetes  Resources
// ----------------------------------------------------------------------------

module "k8s" {
  source          = "./modules/aks/cluster-bootstrap"
  admin_users_k8s = var.admin_users_k8s
  providers = {
    kubernetes = kubernetes.cluster1
  }
}

// ----------------------------------------------------------------------------
// Setup ingress as pre-requisite in cluster
// ----------------------------------------------------------------------------

module "ingress" {
  source                  = "./modules/aks/ingress"
  sites                   = var.sites
  providers = {
    helm       = helm.cluster1
    kubernetes = kubernetes.cluster1
  }
}

// ----------------------------------------------------------------------------
// APP Gateway
// ----------------------------------------------------------------------------
module "app-gateway" {
  source   = "./modules/gateway/app-gateway"
  location = var.location
  resource_group = azurerm_resource_group.resource_group.name
  shared_ag = var.shared_ag
  public_ip_name = var.public_ip_name_ag
  pip_sku = var.pip_sku_ag
  app_gateway_name = var.app_gateway_name
  sku_name = var.sku_name_ag
  sku_tier = var.sku_tier_ag
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  firewall_mode = var.firewall_mode
  waf_configuration_enabled = var.waf_configuration_enabled
  min_capacity  = var.gateway_min_capacity
  max_capacity  = var.gateway_max_capacity
  avail_zones   = var.app_gw_avail_zones
  vnet_subnet_id   = module.subnet.subnet_id
}

// ----------------------------------------------------------------------------
// Setup AGIC
// ----------------------------------------------------------------------------
module "agic" {
  source   = "./modules/gateway/agic"
  providers = {
    helm       = helm.cluster1
    kubernetes = kubernetes.cluster1
  }
  depends_on              = [module.cluster]
  app_gateway_name        = var.app_gateway_name
  resource_group          = azurerm_resource_group.resource_group.name
  shared_ag               = var.shared_ag
  client_secret           = var.client_secret
}
