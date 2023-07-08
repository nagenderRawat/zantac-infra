# Azure IAAC repo to setup Zantac Prod env infra through terraform.


# How do you use this 

## Prerequisites
-- In order to work with this you need have the following binaries locally installed and configured on your _PATH_:

- `terraform` (~> 1.1.0)
- `kubectl` (>=1.21.0)
- `az` (>=2.25.0)

-- An Azure AD account or service principal(SP) with the following minimum privileges is required to execute Terraform under
- `Contributor + User Access Administrator (Subscription)`
- `Cloud Application Administrator (Azure AD Role)`
- `Application.ReadWrite.All (Azure Active Directory Graph API permission)`

## Configure access credentials(SP)
To be able to create resource using terraform the SP credentials need to be set as an env variables using `bash/sh` or `powershell` shown below, from where we will be going to run the ```terraform apply``` command.

 * **Linux(bash/sh) -:**
   ```
    export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
    export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
    export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
    export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
    export TF_VAR_client_secret="00000000-0000-0000-0000-000000000000"
   ```
 * **Windows(Powershell) -:**
   ```
    $env:ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
    $env:ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
    $env:ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
    $env:ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
    $env:TF_VAR_client_secret="00000000-0000-0000-0000-000000000000"

   ```
## Initialize terraform
In order to use terraform to deploy resources we need to first initialize our terraform setup using [`terraform init`](https://www.terraform.io/docs/cli/commands/init.html) command run from root of our project dir to install all the required [providers](https://www.terraform.io/docs/language/providers/index.html) for our project and dependent [modules](https://www.terraform.io/docs/language/modules/index.html).
The [providers](https://www.terraform.io/docs/language/providers/index.html) needed for our project can be seen [providers.tf](./providers.tf)
The [modules](https://www.terraform.io/docs/language/modules/index.html) required can be found on [main.tf](./main.tf).

## Create environment Workspaces
Terraform [workspaces](https://www.terraform.io/docs/language/state/workspaces.html) are handy tool for managing similar type of multiple env's with same set of code but using different named [workspaces](https://www.terraform.io/docs/language/state/workspaces.html) and their respective state files.
So we will create workspaces for our each env(dev/staging/prod) such the have they have their own state files.

Before create any new, check for already existing using below command -:
```
terraform workspace list
```
If only `default` present than we are can create our new workspaces using below command for each env's -:
```
terraform workspace new prod
```
To switch between already exist workspaces, use below command -:
```
terraform workspace select prod
```

## Provision Environment specific resources
The init and workspace creation is already done, so to provision the env specific resource we need to make sure we on the root dir of project and on the right workspace(take eg. of `prod` in this case).

* **Run plan for [prod] env**
 To prepare a plan run -:
```
terraform plan -var-file="./env/prod.tfvars" -out="./env/prod.tfplan"
```


* **Apply for [prod] env**
To execute above plan -:
```
terraform apply ./env/prod.tfplan
```

## Destroy Resource
If at any point of time you want to [`destroy`](https://www.terraform.io/docs/cli/commands/destroy.html) resources using terraform(that were also created using TF) you can use terraform destroy command as shown below -:
```
terraform destroy -var-file="./env/prod.tfvars"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.13.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | =2.5.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | =2.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.13.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_agic"></a> [agic](#module\_agic) | ./modules/gateway/agic | n/a |
| <a name="module_app-gateway"></a> [app-gateway](#module\_app-gateway) | ./modules/gateway/app-gateway | n/a |
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./modules/aks/cluster | n/a |
| <a name="module_ingress"></a> [ingress](#module\_ingress) | ./modules/aks/ingress | n/a |
| <a name="module_k8s"></a> [k8s](#module\_k8s) | ./modules/aks/cluster-bootstrap | n/a |
| <a name="module_registry"></a> [registry](#module\_registry) | ./modules/registry | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ./modules/network/subnet | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./modules/network/vnet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.13.0/docs/resources/resource_group) | resource |
| [random_id.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_pet.pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_users_k8s"></a> [admin\_users\_k8s](#input\_admin\_users\_k8s) | Admin users emails, that need admins access on K8s cluster, eg ["user1@test.com", "user2@test.com"] | `list(string)` | n/a | yes |
| <a name="input_app_gateway_name"></a> [app\_gateway\_name](#input\_app\_gateway\_name) | App Gateway name | `string` | n/a | yes |
| <a name="input_app_gw_avail_zones"></a> [app\_gw\_avail\_zones](#input\_app\_gw\_avail\_zones) | Avail zones for App Gateway | `list` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | az SP client secret | `string` | n/a | yes |
| <a name="input_cluster_network_model"></a> [cluster\_network\_model](#input\_cluster\_network\_model) | Cluster network model | `string` | `"azure"` | no |
| <a name="input_clusters"></a> [clusters](#input\_clusters) | Aks clusters config for mutiple clusters | `any` | n/a | yes |
| <a name="input_container_regestries"></a> [container\_regestries](#input\_container\_regestries) | Docker container registries names, `,` separated | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | `false` | no |
| <a name="input_firewall_mode"></a> [firewall\_mode](#input\_firewall\_mode) | firewall mode | `string` | `"Detection"` | no |
| <a name="input_frontend_ip_configuration_name"></a> [frontend\_ip\_configuration\_name](#input\_frontend\_ip\_configuration\_name) | App Gateway frontend ip configuration name | `string` | n/a | yes |
| <a name="input_gateway_max_capacity"></a> [gateway\_max\_capacity](#input\_gateway\_max\_capacity) | App Gateway autoscale max capacity | `string` | n/a | yes |
| <a name="input_gateway_min_capacity"></a> [gateway\_min\_capacity](#input\_gateway\_min\_capacity) | App Gateway autoscale min capacity | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region in which resources need to be created | `string` | `"us-north-central"` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Log analytics sku | `string` | `"PerGB2018"` | no |
| <a name="input_network_name_ag"></a> [network\_name\_ag](#input\_network\_name\_ag) | App Gateway vnet name | `string` | n/a | yes |
| <a name="input_node_availability_zones"></a> [node\_availability\_zones](#input\_node\_availability\_zones) | (Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | `list(string)` | `null` | no |
| <a name="input_nodes_max_count"></a> [nodes\_max\_count](#input\_nodes\_max\_count) | Maximum number of nodes in a pool | `number` | `null` | no |
| <a name="input_nodes_min_count"></a> [nodes\_min\_count](#input\_nodes\_min\_count) | Minimum number of nodes in a pool | `number` | `null` | no |
| <a name="input_nw_enf_pvt_link"></a> [nw\_enf\_pvt\_link](#input\_nw\_enf\_pvt\_link) | enforce private link endpoint network policies | `bool` | `true` | no |
| <a name="input_pip_sku_ag"></a> [pip\_sku\_ag](#input\_pip\_sku\_ag) | App Gateway publicIP sku | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | This variable defines the company name prefix used to build resources | `string` | n/a | yes |
| <a name="input_public_ip_name_ag"></a> [public\_ip\_name\_ag](#input\_public\_ip\_name\_ag) | App Gateway frontend publicIP name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource Group name | `map(any)` | <pre>{<br>  "prod": "zantac-tf"<br>}</pre> | no |
| <a name="input_shared_ag"></a> [shared\_ag](#input\_shared\_ag) | is shared App Gateway? | `number` | n/a | yes |
| <a name="input_sites"></a> [sites](#input\_sites) | Ingress DNS details and tls secret name | <pre>map(object({<br>    name        = string<br>    subdomain   = string<br>    domain      = string<br>    secret_name = string<br>  }))</pre> | n/a | yes |
| <a name="input_sku_name_ag"></a> [sku\_name\_ag](#input\_sku\_name\_ag) | App Gateway sku name | `string` | n/a | yes |
| <a name="input_sku_tier_ag"></a> [sku\_tier\_ag](#input\_sku\_tier\_ag) | App Gateway sku teir | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | ssh public key | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Subnet CIDR range to reserve internal IP's in Subnet | `string` | `"10.8.0.0/16"` | no |
| <a name="input_subnet_cidr_ag"></a> [subnet\_cidr\_ag](#input\_subnet\_cidr\_ag) | App Gateway subnet CIDR | `string` | n/a | yes |
| <a name="input_subnet_enf_pvt_link"></a> [subnet\_enf\_pvt\_link](#input\_subnet\_enf\_pvt\_link) | enforce private link endpoint network policies | `bool` | `true` | no |
| <a name="input_subnet_name_ag"></a> [subnet\_name\_ag](#input\_subnet\_name\_ag) | App Gateway subnet name | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | Vnet CIDR range to reserve internal IP's in Vnet | `list(string)` | <pre>[<br>  "10.8.0.0/16"<br>]</pre> | no |
| <a name="input_vnet_cidr_ag"></a> [vnet\_cidr\_ag](#input\_vnet\_cidr\_ag) | App Gateway vnet CIDR | `string` | n/a | yes |
| <a name="input_waf_configuration_enabled"></a> [waf\_configuration\_enabled](#input\_waf\_configuration\_enabled) | waf configuration enabled | `bool` | n/a | yes |

## Outputs

No outputs.
