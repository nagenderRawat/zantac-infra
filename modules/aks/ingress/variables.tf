variable "sites" {
  type = map(object({
    name        = string
    subdomain   = string
    domain      = string
    secret_name = string
  }))
  description = "Ingress multi host config"
}
