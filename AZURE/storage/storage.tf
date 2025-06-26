############################################
# STORAGE
############################################

resource "azurerm_storage_account" "tf_sa" {
  #checkov:skip=CKV_AZURE_190: All the configuration is done
  #checkov:skip=CKV_AZURE_33: Doesnt need queue
  #checkov:skip=CKV_AZURE_206: For this lab I used LRS
  #checkov:skip=CKV2_AZURE_1: Doesnt need CMK
  #checkov:skip=CKV2_AZURE_21: Resource to do this doesnt exist anymore
  #checkov:skip=CKV2_AZURE_47: Doest exist the attribute anymore
  name                          = var.azure_storage.name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  account_kind                  = "StorageV2"
  account_tier                  = var.azure_storage.tier
  account_replication_type      = "ZRS" #var.azure_storage.replic
  min_tls_version               = var.azure_storage.tls
  public_network_access_enabled = false
  shared_access_key_enabled     = false
  sas_policy {
    expiration_period = "P7D"
  }
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
}

############################################
# STORAGE PRIVATE ENDPOINT
############################################

resource "azurerm_private_endpoint" "storage_pe" {
  name                = "${azurerm_storage_account.tf_sa.name}-pe"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sb_private_id

  private_service_connection {
    name                           = "${azurerm_storage_account.tf_sa.name}-connection"
    private_connection_resource_id = azurerm_storage_account.tf_sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}