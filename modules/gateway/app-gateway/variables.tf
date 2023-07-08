variable "location" {
  type = string
  description = "App Gateway location"
}
variable "resource_group" {
  type = string
  description = "App Gateway RG"
}
variable "shared_ag" {
  type = number
  description = "is shared App Gateway?"
}
variable "vnet_subnet_id" {
  type = string
  description = "App Gateway subnet id"
}
variable "public_ip_name" {
  type = string
  description = "App Gateway frontend publicIP name"
}
variable "pip_sku" {
  type = string
  description = "App Gateway publicIP sku"
}
variable "app_gateway_name" {
  type = string
  description = "App Gateway name"
}
variable "sku_name" {
  type        = string
  description = "App Gateway sku name"
}
variable "sku_tier" {
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
variable "min_capacity" {
  type = string
  description = "App Gateway autoscale min capacity"
}
variable "max_capacity" {
  type = string
  description = "App Gateway autoscale max capacity"
}
variable "avail_zones" {
  type = list
  description = "Avail zones for App Gateway"
}
