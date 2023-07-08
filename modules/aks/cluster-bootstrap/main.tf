resource "kubernetes_cluster_role_binding" "admin_access" {
  for_each = toset(var.admin_users_k8s)
  metadata {
    name = "aks-cluster-admin-${each.value}"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = each.value
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_namespace" "ns" {
  metadata {
    annotations = {
      name = "${terraform.workspace}-ns"
    }

    labels = {
      mylabel = "${terraform.workspace}-ns"
    }

    name = "${terraform.workspace}-ns"
  }
}
