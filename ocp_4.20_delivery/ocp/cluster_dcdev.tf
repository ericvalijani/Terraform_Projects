# Kumo-Dev DEV/UAT CLUSTER
# Create namespace for dev/uat on kumoDev
resource "kubernetes_namespace" "dev_uat_namespaces" {
  provider = kubernetes.kumodev
  count    = length(local.dev_uat_environments)

  metadata {
    name = "${var.project_name}-${local.dev_uat_environments[count.index]}"

    labels = {
      # Label for ClusterResourceQuota selector
      quotaname   = "${var.project_name}"
      environment = local.dev_uat_environments[count.index]
    }
    annotations = {
      "openshift.io/display-name" = "${var.project_name}-${local.dev_uat_environments[count.index]}"
      "openshift.io/requester" = "salehmiri"
      "openshift.io/description" = "${var.project_name}-${local.dev_uat_environments[count.index]}"
    }
  }
}

# Create group for dev/uat cluster
resource "kubernetes_manifest" "dev_uat_group" {
  provider = kubernetes.kumodev

  manifest = {
    apiVersion = "user.openshift.io/v1"
    kind       = "Group"
    metadata = {
      name = "${var.project_name}-group"
    }
    users = var.project_users
  }
}

# Create rolebindings for dev environment
resource "kubernetes_role_binding" "dev_rolebinding" {
  provider = kubernetes.kumodev

  metadata {
    name      = "${var.project_name}-dev-rb"
    namespace = "${var.project_name}-dev"
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
    kubernetes_namespace.dev_uat_namespaces,
    kubernetes_manifest.dev_uat_group
  ]
}

# Create rolebindings for uat environment
resource "kubernetes_role_binding" "uat_rolebinding" {
  provider = kubernetes.kumodev

  metadata {
    name      = "${var.project_name}-uat-rb"
    namespace = "${var.project_name}-uat"
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
    kubernetes_namespace.dev_uat_namespaces,
    kubernetes_manifest.dev_uat_group
  ]
}

# KumoDEV (T1) ClusterResourceQuota
resource "kubernetes_manifest" "dev_uat_cluster_resource_quota" {
  provider = kubernetes.kumodev

  manifest = {
    apiVersion = "quota.openshift.io/v1"
    kind       = "ClusterResourceQuota"
    metadata = {
      name = "crq-${var.project_name}"
    }
    spec = {
      quota = {
        hard = {
          "limits.cpu"       = var.dev_uat_cpu_limit
          "limits.memory"    = var.dev_uat_memory_limit
          "requests.storage" = var.dev_uat_storage_request
        }
      }
      selector = {
        labels = {
          matchLabels = {
            quotaname = var.project_name
          }
        }
      }
    }
  }

  depends_on = [kubernetes_namespace.dev_uat_namespaces]
}
