resource "helm_release" "ingress_nginx" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "${terraform.workspace}-ns"

  timeout    = 600
  version    = "4.0.13"

  values = [<<EOF
controller:
  admissionWebhooks:
    enabled: false
  ingressClass: nginx
  podLabels:
    app: ingress-nginx
  service:
    annotations:
      service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path: "/healthz"
  config:
    log-format-escape-json: "true"
    log-format-upstream: '{"remote_address": "$remote_addr", "timestamp": "$time_local", "method": "$request_method", "uri": "$request_uri", "status": "$status", "bytes_sent": "$body_bytes_sent", "response_length": "$upstream_response_length", "response_time": "$upstream_response_time", "user_id": "$upstream_http_user_id"}'
EOF
  ]
}

data "kubernetes_service" "ingress-svc" {
  depends_on = [
    helm_release.ingress_nginx
  ]
  metadata {
    name = "nginx-ingress-ingress-nginx-controller"
    namespace = "${terraform.workspace}-ns"
  }
}

