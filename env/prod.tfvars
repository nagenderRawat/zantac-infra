/* Variables for tts infrastructure */
prefix      = "rg"
location    = "centralus"
vnet_cidr   = ["10.7.0.0/16"]
subnet_cidr = "10.7.0.0/16"
subnet_enf_pvt_link = true

/* K8s cluster */
clusters = [
  {
    cluster_name            = "zantac"
    node_count              = null
    node_size               = "Standard_D2_v3"
    dns_prefix              = "ti"
    cluster_version         = "1.25.6"
    node_availability_zones = ["1", "2", "3"]
    enable_auto_scaling     = true
    nodes_max_count         = 3
    nodes_min_count         = 1
  }
]
admin_users_k8s = ["nagi.rawat3@gmail.com"]

/* Docker registry */
container_regestries = ["dockerzantac"]


/* Ingress */
sites = {
  "zantac" = {
    name        = "zantac"
    subdomain   = "app"
    secret_name = "zantac-tls-cert"
    domain      = "zantac.com"
  }
}

/* Application Gateway */
shared_ag = 0
network_name_ag = "app-gw-zantac"
vnet_cidr_ag = "10.10.0.0/16"
subnet_name_ag = "app-gw-zantac"
subnet_cidr_ag = "10.10.0.0/24"
public_ip_name_ag = "app-gw-zantac"
pip_sku_ag = "Standard"
sku_name_ag = "WAF_v2"
sku_tier_ag = "WAF_v2"
frontend_ip_configuration_name = "app-gw-zantac-frontend-ip"
firewall_mode = "Detection"
waf_configuration_enabled = true
gateway_min_capacity  = "1"
gateway_max_capacity  = "2"
app_gw_avail_zones    = ["1", "2", "3"]
nw_enf_pvt_link = true
app_gateway_name = "app-gw-zantac"

