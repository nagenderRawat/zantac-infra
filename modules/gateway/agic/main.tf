# Helm release for AGIC
data "azurerm_client_config" "current" {
}

data "template_file" "sp-cred-json" {
  template = file("${path.module}/templates/sp-cred.json")
  vars = {
    client_id        = data.azurerm_client_config.current.client_id,
    client_secret    = var.client_secret,
    subscription_id  = data.azurerm_client_config.current.subscription_id,
    tenant_id        = data.azurerm_client_config.current.tenant_id
  }
}

resource "helm_release" "agic" {
  name       = "agic-ingress"
  namespace  = "${terraform.workspace}-ns"
  repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart      = "ingress-azure"
  timeout    = 600
  version    = "1.5.2"

  values = [
    "${templatefile("${path.module}/templates/helm-config.yaml", {
      subscription_id         = data.azurerm_client_config.current.subscription_id,
      resource_group_name     = var.resource_group,
      applicationgateway_name = var.app_gateway_name,
      shared_ag               = var.shared_ag == 1 ? true : false,
      secret_json             = base64encode(data.template_file.sp-cred-json.rendered)
    })}"
  ]
}
