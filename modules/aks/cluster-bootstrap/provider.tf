terraform {
  required_providers {
    kubernetes = {
      source                = "hashicorp/kubernetes"
      version               = "=2.13.0"
      configuration_aliases = [kubernetes]
    }
  }
}