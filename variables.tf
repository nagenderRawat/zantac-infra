variable "prefix" {
  type        = string
  description = "This variable defines the company name prefix used to build resources"
}

variable "clusters" {
  description = "Aks clusters config for mutiple clusters"
}
variable "location" {
  type        = string
  default     = "us-north-central"
  description = "Region in which resources need to be created"
}
variable "resource_group" {
  type = map(any)
  default = {
    prod     = "zantac-tf"
  }
  description = "Resource Group name"
}
variable "vnet_cidr" {
  type        = list(string)
  default     = ["10.8.0.0/16"]
  description = "Vnet CIDR range to reserve internal IP's in Vnet"
}
variable "subnet_cidr" {
  type        = string
  default     = "10.8.0.0/16"
  description = "Subnet CIDR range to reserve internal IP's in Subnet"
}
variable "subnet_enf_pvt_link" {
  type        = bool
  default     = true
  description = "enforce private link endpoint network policies"
}
variable "cluster_network_model" {
  type        = string
  default     = "azure"
  description = "Cluster network model"
}
variable "ssh_public_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "ssh public key"
}
variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "Log analytics sku"
}
variable "container_regestries" {
  type        = list(string)
  description = "Docker container registries names, `,` separated"
}
variable "admin_users_k8s" {
  type        = list(string)
  description = "Admin users emails, that need admins access on K8s cluster, eg [\"user1@test.com\", \"user2@test.com\"]"
}
variable "client_secret" {
  type        = string
  description = "az SP client secret"
  sensitive   = true
}
variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = false
}
variable "nodes_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = null
}
variable "nodes_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = null
}
variable "node_availability_zones" {
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  type        = list(string)
  default     = null
}


########################################
# Azure Application Gateway            #
########################################

variable "shared_ag" {
  type = number
  description = "is shared App Gateway?"
}
variable "network_name_ag" {
  type        = string
  description = "App Gateway vnet name"
}
variable "vnet_cidr_ag" {
  type = string
  description = "App Gateway vnet CIDR"
}
variable "subnet_name_ag" {
  type        = string
  description = "App Gateway subnet name"
}
variable "subnet_cidr_ag" {
  type = string
  description = "App Gateway subnet CIDR"
}
variable "public_ip_name_ag" {
  type = string
  description = "App Gateway frontend publicIP name"
}
variable "pip_sku_ag" {
  type = string
  description = "App Gateway publicIP sku"
}
variable "app_gateway_name" {
  type = string
  description = "App Gateway name"
}
variable "sku_name_ag" {
  type        = string
  description = "App Gateway sku name"
}
variable "sku_tier_ag" {
  type = string
  description = "App Gateway sku teir"
}
variable "frontend_ip_configuration_name" {
  type = string
  description = "App Gateway frontend ip configuration name"
}
variable "firewall_mode" {
  type = string
  description = "firewall mode"
  default = "Detection"
}
variable "waf_configuration_enabled" {
  type = bool
  description = "waf configuration enabled"
}
variable "gateway_min_capacity" {
  type = string
  description = "App Gateway autoscale min capacity"
}
variable "gateway_max_capacity" {
  type = string
  description = "App Gateway autoscale max capacity"
}
variable "app_gw_avail_zones" {
  type = list
  description = "Avail zones for App Gateway"
}
variable "nw_enf_pvt_link" {
  type        = bool
  default     = true
  description = "enforce private link endpoint network policies"
}

########################################
# Ingress - Variables                  #
########################################
variable "sites" {
  type = map(object({
    name        = string
    subdomain   = string
    domain      = string
    secret_name = string
  }))
  description = "Ingress DNS details and tls secret name"
}