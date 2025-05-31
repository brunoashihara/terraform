############################################
# FIREWALL PUBLIC
############################################

resource "google_compute_firewall" "tf_fw_public" {
  for_each = { for rule in var.gcp_fw_public : rule.name => rule }
  project = var.project_id
  name    = each.value.name
  network = var.vpc_id
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
  source_ranges = each.value.source_ranges
}