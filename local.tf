resource "random_pet" "pet" {
}

resource "random_id" "random" {
  byte_length = 6
}


locals {
  prefix                      = var.prefix
  resource_group              = var.resource_group != "" ? "${local.prefix}-${var.resource_group[terraform.workspace]}" : "${local.prefix}-rg-net-${random_pet.pet.id}"
  network_name                = var.resource_group != "" ? "${local.prefix}-${var.resource_group[terraform.workspace]}-vnet" : "${local.prefix}-${random_pet.pet.id}-vnet"
  subnet_name                 = var.resource_group != "" ? "${local.prefix}-${var.resource_group[terraform.workspace]}-subnet" : "${local.prefix}-${random_pet.pet.id}-subnet"
  cluster_node_resource_group = "${local.prefix}-${random_pet.pet.id}-node-resource-group"
  container_registry_name = [for container_regestry in var.container_regestries : "${terraform.workspace}${container_regestry}"]
}
