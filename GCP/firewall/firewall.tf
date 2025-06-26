############################################
# FIREWALL PRIVATE
############################################

resource "google_compute_firewall" "tf_fw_private" {
  for_each      = { for rule in var.gcp_fw_private : rule.name => rule }
  project       = var.project_id
  name          = each.value.name
  network       = var.vpc_id
  source_ranges = each.value.source_ranges
  dynamic "allow" {
    for_each = length(each.value.ports) > 0 ? [each.value] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }
  dynamic "allow" {
    for_each = length(each.value.ports) == 0 ? [each.value] : []
    content {
      protocol = each.value.protocol
    }
  }
}

############################################
# FIREWALL PUBLIC
############################################

resource "google_compute_firewall" "tf_fw_public" {
  for_each      = { for rule in var.gcp_fw_public : rule.name => rule }
  project       = var.project_id
  name          = each.value.name
  network       = var.vpc_id
  source_ranges = each.value.source_ranges
  target_tags   = try(each.value.target_tags, null)
  dynamic "allow" {
    for_each = length(each.value.ports) > 0 ? [each.value] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }
  dynamic "allow" {
    for_each = length(each.value.ports) == 0 ? [each.value] : []
    content {
      protocol = each.value.protocol
    }
  }
}