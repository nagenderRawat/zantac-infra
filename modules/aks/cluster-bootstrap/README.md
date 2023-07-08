## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | =2.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | =2.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role_binding.admin_access](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.1/docs/resources/cluster_role_binding) | resource |
| [kubernetes_namespace.ns](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.1/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_users_k8s"></a> [admin\_users\_k8s](#input\_admin\_users\_k8s) | Admin users list for K8s cluster access | `list(string)` | n/a | yes |

## Outputs

No outputs.
