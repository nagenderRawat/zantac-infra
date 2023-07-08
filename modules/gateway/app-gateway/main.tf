resource "azurerm_public_ip" "pip" {
  name                 = var.public_ip_name
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"
  sku                 = var.pip_sku
}

resource "azurerm_application_gateway" "app-gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group
  location            = var.location
  firewall_policy_id  = azurerm_web_application_firewall_policy.waf-policy.id
  zones = var.avail_zones
  lifecycle {
    ignore_changes = [
      backend_address_pool,
      backend_http_settings,
      frontend_port,
      http_listener,
      probe,
      redirect_configuration,
      request_routing_rule,
      ssl_certificate,
      tags,
      url_path_map,
    ]
  }
  
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = 0
  }

  gateway_ip_configuration {
    name      = "${var.app_gateway_name}-ip-configuration"
    subnet_id = var.vnet_subnet_id
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  frontend_port {
    name = "default-80"
    port = 80
  } 

  backend_address_pool {
    name = "default-backend-address-pool"
  }

  backend_http_settings {
    name                  = "default-http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "default-listener-80"
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = "default-80"
    protocol                       = "Http"
    firewall_policy_id             = azurerm_web_application_firewall_policy.waf-policy.id
  }

  request_routing_rule {
    name                       = "default-request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "default-listener-80"
    backend_address_pool_name  = "default-backend-address-pool"
    backend_http_settings_name = "default-http-setting"
  }
  
  waf_configuration {
    enabled = true
    firewall_mode = "Detection"
    rule_set_type = "OWASP"
    rule_set_version = "3.1"
  }
  
  autoscale_configuration {
    min_capacity  = var.min_capacity
    max_capacity  = var.max_capacity
  }
}


resource "azurerm_web_application_firewall_policy" "waf-policy" {
  name                = "${var.app_gateway_name}-wafpolicy"
  resource_group_name = var.resource_group
  location            = var.location  

  policy_settings {
    enabled                     = true
    mode                        = "Detection"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
    }
  }
}