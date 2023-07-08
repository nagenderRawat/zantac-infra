variable "client_secret" {
  type = string
  description = "Client Secret"
}
variable "shared_ag" {
  type = number
  description = "is shared App Gateway?"
}
variable "app_gateway_name" {
  type = string
  description = "App Gateway name"
}
variable "resource_group" {
  type = string
  description = "App Gateway RG"
}
