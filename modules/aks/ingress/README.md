## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | =2.5.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | =2.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | =2.5.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | =2.13.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_a_record.a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/2.2.0/docs/resources/release) | resource |
| [kubernetes_ingress.ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.1/docs/resources/ingress) | resource |
| [kubernetes_namespace.ns-ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.1/docs/resources/namespace) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_dns_zone"></a> [resource\_group\_dns\_zone](#input\_resource\_group\_dns\_zone) | RG for ingress DNS A record mapping with DNS zones | `string` | n/a | yes |
| <a name="input_sites"></a> [sites](#input\_sites) | Ingress multi host config | <pre>map(object({<br>    name        = string<br>    subdomain   = string<br>    domain      = string<br>    secret_name = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
