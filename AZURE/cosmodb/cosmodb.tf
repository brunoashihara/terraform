############################################
# COSMODB
############################################

resource "azurerm_cosmosdb_account" "tf_cosmodb" {
  name                = var.azure_cosmodb.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  offer_type          = var.azure_cosmodb.type
  kind                = var.azure_cosmodb.kind
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
  enable_free_tier = true
}