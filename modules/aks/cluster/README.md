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
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.nodepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_solution.los_ws_sln](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.log_ws](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name | `string` | n/a | yes |
| <a name="input_cluster_network_model"></a> [cluster\_network\_model](#input\_cluster\_network\_model) | Kubernetes cluster network model | `string` | `"azure"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version to use for the AKS cluster. | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Kubernetes cluster dns prrefix for API server | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | `false` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | AKS Container Insights | `string` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Kubernetes cluster location | `string` | n/a | yes |
| <a name="input_network_resource_group"></a> [network\_resource\_group](#input\_network\_resource\_group) | Kubernetes cluster network RG | `string` | n/a | yes |
| <a name="input_node_availability_zones"></a> [node\_availability\_zones](#input\_node\_availability\_zones) | (Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | `list(string)` | `null` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes that should exist in the node Pool. Please set `node_count` `null` while `enable_auto_scaling` is `true` to avoid possible `node_count` changes. | `string` | `null` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | Kubernetes cluster node RG | `string` | n/a | yes |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | Kubernetes cluster node size | `string` | n/a | yes |
| <a name="input_nodepools"></a> [nodepools](#input\_nodepools) | Nodepool config to have multinodepool cluster | `list(map(string))` | n/a | yes |
| <a name="input_nodes_max_count"></a> [nodes\_max\_count](#input\_nodes\_max\_count) | Maximum number of nodes in a pool | `number` | `null` | no |
| <a name="input_nodes_min_count"></a> [nodes\_min\_count](#input\_nodes\_min\_count) | Minimum number of nodes in a pool | `number` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Kubernetes cluster RG | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | Subnet id to spin cluster on | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | n/a |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
| <a name="output_kube_config_admin_raw"></a> [kube\_config\_admin\_raw](#output\_kube\_config\_admin\_raw) | n/a |
| <a name="output_kubelet_identity_id"></a> [kubelet\_identity\_id](#output\_kubelet\_identity\_id) | n/a |
| <a name="output_kubernetes_cluster"></a> [kubernetes\_cluster](#output\_kubernetes\_cluster) | n/a |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | n/a |
