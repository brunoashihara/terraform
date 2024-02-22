############################################
# COSMODB
############################################

resource "azurerm_cosmosdb_account" "teste_cosmodb" {
  name                = var.cosmodb.name
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  offer_type          = var.cosmodb.type
  kind                = var.cosmodb.kind
  capabilities {
    name = var.cosmodb.cap1
  }
  capabilities {
    name = var.cosmodb.cap2
  }
  capabilities {
    name = var.cosmodb.cap3
  }
  capabilities {
    name = var.cosmodb.cap4
  }
  consistency_policy {
    consistency_level = var.cosmodb.cons
  }
  geo_location {
    location          = var.cosmodb.location
    failover_priority = var.cosmodb.failover
  }
  enable_free_tier = true
}