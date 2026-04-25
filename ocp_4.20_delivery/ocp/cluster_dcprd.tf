# KumoPRD1 CLUSTERS RESOURCES
# Create namespace
resource "kubernetes_namespace" "kumoprd1_ns" {
  provider = kubernetes.kumoprd1
  count    = contains(var.clusters, "kumoprd1") ? 1 : 0

  metadata {
    name = "${var.project_name}-prd"

    labels = {
      environment = "prd"
    }
  }
}

# Create group
resource "kubernetes_manifest" "kumoprd1_group" {
  provider = kubernetes.kumoprd1
  count    = contains(var.clusters, "kumoprd1") ? 1 : 0

  manifest = {
    apiVersion = "user.openshift.io/v1"
    kind       = "Group"
    metadata = {
      name = "${var.project_name}-group"
    }
    users = var.project_users
  }
}

# Create rolebinding
resource "kubernetes_role_binding" "kumoprd1_rolebinding" {
  provider = kubernetes.kumoprd1
  count    = contains(var.clusters, "kumoprd1") ? 1 : 0

  metadata {
    name      = "${var.project_name}-prd-rb"
    namespace = "${var.project_name}-prd"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "edit"
  }

  subject {
    kind      = "Group"
    name      = "${var.project_name}-group"
    api_group = "rbac.authorization.k8s.io"
  }

  depends_on = [
    kubernetes_namespace.kumoprd1_ns,
    kubernetes_manifest.kumoprd1_group
  ]
}

# ResourceQuota for PRD Clusters
resource "kubernetes_resource_quota" "kumoprd1_resource_quota" {
  provider = kubernetes.kumoprd1
  count    = contains(var.clusters, "kumoprd1") ? 1 : 0

  metadata {
    name      = "rq-${var.project_name}"
    namespace = "${var.project_name}-prd"
  }

  spec {
    hard = {
      "limits.cpu"       = var.prd_cpu_limit
      "limits.memory"    = var.prd_memory_limit
      "requests.storage" = var.prd_storage_request
    }
  }

  depends_on = [kubernetes_namespace.kumoprd1_ns]
}
