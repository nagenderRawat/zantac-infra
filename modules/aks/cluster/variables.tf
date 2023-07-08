variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
}
variable "cluster_version" {
  description = "Kubernetes version to use for the AKS cluster."
  type        = string
}
variable "location" {
  type        = string
  description = "Kubernetes cluster location"
}
variable "node_size" {
  type        = string
  description = "Kubernetes cluster node size"
}
variable "node_count" {
  description = "The number of nodes that should exist in the node Pool. Please set `node_count` `null` while `enable_auto_scaling` is `true` to avoid possible `node_count` changes."
  type        = string
  default     = null
}
variable "vnet_subnet_id" {
  type        = string
  description = "Subnet id to spin cluster on"
}
variable "dns_prefix" {
  type        = string
  description = "Kubernetes cluster dns prrefix for API server"
}
variable "resource_group" {
  type        = string
  description = "Kubernetes cluster RG"
}
variable "node_resource_group" {
  type        = string
  description = "Kubernetes cluster node RG"
}
variable "network_resource_group" {
  type        = string
  description = "Kubernetes cluster network RG"
}
variable "cluster_network_model" {
  type        = string
  default     = "azure"
  description = "Kubernetes cluster network model"
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
variable "enable_container_insights" {
  description = "AKS Container Insights"
  type        = string
  default     = false
}
