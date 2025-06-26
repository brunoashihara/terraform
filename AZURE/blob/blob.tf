############################################
# BLOB
############################################

resource "azurerm_storage_container" "tf_blob" {
  #checkov:skip=CKV2_AZURE_21: Doesnt exist this attribute anymore
  name                  = var.azure_blob.name
  storage_account_name  = var.storage_account_name
  container_access_type = var.azure_blob.type
}