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
| [azurerm_private_dns_a_record.subnet-sql-endpoint-dns-a-record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_zone.endpoint-dns-private-zone-db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns-zone-to-vnet-link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.subnet-sql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_private_endpoint_connection.subnet-sql-endpoint-data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Vnet location | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | Vnet Id | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Vnet name | `string` | n/a | yes |
| <a name="input_private_ep_name"></a> [private\_ep\_name](#input\_private\_ep\_name) | subnet <=> sql-server pvt endpoint name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Subnet RG | `string` | n/a | yes |
| <a name="input_sql_server_id"></a> [sql\_server\_id](#input\_sql\_server\_id) | SQL server id for private end point | `string` | n/a | yes |
| <a name="input_sql_server_name"></a> [sql\_server\_name](#input\_sql\_server\_name) | SQL server name for private end point | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Subnet CIDR | `string` | n/a | yes |
| <a name="input_subnet_enf_pvt_link"></a> [subnet\_enf\_pvt\_link](#input\_subnet\_enf\_pvt\_link) | enforce private link endpoint network policies | `bool` | `true` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
