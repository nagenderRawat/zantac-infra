## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.app-gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.frontend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_web_application_firewall_policy.waf-policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/web_application_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_gateway_name"></a> [app\_gateway\_name](#input\_app\_gateway\_name) | App Gateway name | `string` | n/a | yes |
| <a name="input_avail_zones"></a> [avail\_zones](#input\_avail\_zones) | Avail zones for App Gateway | `list` | n/a | yes |
| <a name="input_firewall_mode"></a> [firewall\_mode](#input\_firewall\_mode) | firewall mode | `string` | `"Detection"` | no |
| <a name="input_frontend_ip_configuration_name"></a> [frontend\_ip\_configuration\_name](#input\_frontend\_ip\_configuration\_name) | App Gateway frontend ip configuration name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | App Gateway location | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | App Gateway autoscale max capacity | `string` | n/a | yes |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | App Gateway autoscale min capacity | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | App Gateway vnet name | `string` | n/a | yes |
| <a name="input_nw_enf_pvt_link"></a> [nw\_enf\_pvt\_link](#input\_nw\_enf\_pvt\_link) | enforce private link endpoint network policies | `bool` | `true` | no |
| <a name="input_pip_sku"></a> [pip\_sku](#input\_pip\_sku) | App Gateway publicIP sku | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | App Gateway frontend publicIP name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | App Gateway RG | `string` | n/a | yes |
| <a name="input_shared_ag"></a> [shared\_ag](#input\_shared\_ag) | is shared App Gateway? | `number` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | App Gateway sku name | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | App Gateway sku teir | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | App Gateway subnet CIDR | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | App Gateway subnet name | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | App Gateway vnet CIDR | `string` | n/a | yes |
| <a name="input_waf_configuration_enabled"></a> [waf\_configuration\_enabled](#input\_waf\_configuration\_enabled) | waf configuration enabled | `bool` | n/a | yes |

## Outputs

No outputs.
