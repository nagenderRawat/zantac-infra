# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.13.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "=2.13.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "=2.5.1"
    }
  }
}

# Microsoft Azure Resource Manager Provider
provider "azurerm" {
  features {}
}


# Kubernetes Provider
provider "kubernetes" {
}

# TF doesn't support loop for provider(rel open ticket of TF https://github.com/hashicorp/terraform/issues/19932), so need to hardcode for mutiple instances for k8s clusters
provider "kubernetes" {
  alias = "cluster1"
  host  = values(module.cluster)[0].cluster_endpoint

  client_certificate     = base64decode("${values(module.cluster)[0].client_certificate}")
  client_key             = base64decode("${values(module.cluster)[0].client_key}")
  cluster_ca_certificate = base64decode("${values(module.cluster)[0].cluster_ca_certificate}")
}

# helm Provider
provider "helm" {
}

provider "helm" {
  alias = "cluster1"
  kubernetes {
    host = values(module.cluster)[0].cluster_endpoint

    client_certificate     = base64decode("${values(module.cluster)[0].client_certificate}")
    client_key             = base64decode("${values(module.cluster)[0].client_key}")
    cluster_ca_certificate = base64decode("${values(module.cluster)[0].cluster_ca_certificate}")
  }
}