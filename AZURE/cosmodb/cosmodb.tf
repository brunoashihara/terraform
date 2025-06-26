############################################
# COSMODB
############################################

resource "azurerm_cosmosdb_account" "tf_cosmodb" {
  #checkov:skip=CKV_AZURE_100: Doesnt need CMK
  #checkov:skip=CKV_AZURE_132: Doesnt need it
  name                               = var.azure_cosmodb.name
  location                           = var.resource_group_location
  resource_group_name                = var.resource_group_name
  offer_type                         = var.azure_cosmodb.type
  kind                               = var.azure_cosmodb.kind
  public_network_access_enabled      = false
  is_virtual_network_filter_enabled  = true
  minimal_tls_version                = "Tls12"
  access_key_metadata_writes_enabled = false
  capabilities {
    name = var.azure_cosmodb.cap1
  }
  capabilities {
    name = var.azure_cosmodb.cap2
  }
  capabilities {
    name = var.azure_cosmodb.cap3
  }
  capabilities {
    name = var.azure_cosmodb.cap4
  }
  consistency_policy {
    consistency_level = var.azure_cosmodb.cons
  }
  geo_location {
    location          = var.azure_cosmodb.location
    failover_priority = var.azure_cosmodb.failover
  }

  free_tier_enabled = true
}