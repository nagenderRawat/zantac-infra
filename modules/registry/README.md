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
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | Name of container registry | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location in which to create registry | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group in which to create registry | `string` | n/a | yes |

## Outputs

No outputs.
