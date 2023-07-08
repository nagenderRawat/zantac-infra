variable "resource_group" {
  type        = string
  description = "RG name for vnet"
}
variable "network_name" {
  type        = string
  description = "Vnet name"
}
variable "location" {
  type        = string
  description = "Vnet location"
}
variable "vnet_cidr" {
  type        = list(string)
  description = "Vnet CIDR"
}
