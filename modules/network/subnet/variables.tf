variable "resource_group" {
  type        = string
  description = "Subnet RG"
}
variable "subnet_name" {
  type        = string
  description = "Subnet name"
}
variable "network_name" {
  type        = string
  description = "Vnet name"
}
variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR"
}
variable "location" {
  type        = string
  description = "Vnet location"
}
variable "network_id" {
  type        = string
  description = "Vnet Id"
}