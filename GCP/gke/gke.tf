############################################
# K8e
############################################

#tfsec:ignore:google-gke-use-service-account
resource "google_container_cluster" "tf_gke" {
  #checkov:skip=CKV_GCP_61: Flows logs doesnt need here
  #checkov:skip=CKV_GCP_65: Doesnt need RBAC

  project            = var.project_id
  name               = var.gcp_gke.name
  location           = var.region
  initial_node_count = var.gcp_gke.count
  ip_allocation_policy {}
  enable_autopilot = var.gcp_gke.disable
  resource_labels  = var.gcp_gke.labels
  private_cluster_config {
    enable_private_nodes    = var.gcp_gke.enable
    enable_private_endpoint = var.gcp_gke.disable
    master_ipv4_cidr_block  = var.gcp_gke.cidr
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorized_cidr
      display_name = var.gcp_gke.auth_name
    }
  }
  release_channel {
    channel = "REGULAR" # ou "RAPID", "STABLE"
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = var.gcp_gke.disable
    }
  }
  binary_authorization {
    evaluation_mode = var.gcp_gke.binary
  }
    pod_security_policy_config {
      enabled = var.gcp_gke.enable
    }
  node_config {
    oauth_scopes = [
      var.gcp_gke.oauth
    ]
    #service_account = var.gcp_gke.service_account
    labels = var.gcp_gke.labels
    tags   = var.gcp_gke.tags
    metadata = {
      disable-legacy-endpoints = var.gcp_gke.enable
    }
    workload_identity_config {
      workload_pool = "${var.project_id}.svc.id.goog"
    }
    workload_metadata_config {
      mode = var.gcp_gke.metadata
    }
    shielded_instance_config {
      enable_secure_boot          = var.gcp_gke.enable
      enable_integrity_monitoring = var.gcp_gke.enable
    }
  }
  timeouts {
    create = var.gcp_gke.to_create
    update = var.gcp_gke.to_update
  }
  network_policy {
    enabled  = var.gcp_gke.enable
    provider = var.gcp_gke.provider
  }
  network    = var.vpc_id
  subnetwork = var.sb_public_id
}