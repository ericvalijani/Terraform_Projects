# Resource for Nexus Babaei 
resource "nexus_blobstore_file" "bsfile" {
  name     = "${var.projectname}-bs"
  path     = "/data/sonatype-work/nexus3/blobs/${var.projectname}-bs"

  soft_quota {
    limit = var.bs_quota * 1000000
    type  = "spaceUsedQuota"
  }
}

resource "nexus_repository_docker_hosted" "docker_repo" {
  name     = var.projectname
  online   = true

  storage {
    blob_store_name                = "${var.projectname}-bs"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }

  docker {
    v1_enabled       = true
    force_basic_auth = false
    http_port        = var.http_port
  }
}
