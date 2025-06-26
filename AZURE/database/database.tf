############################################
# DATA
############################################

data "azuread_user" "admin" {
  user_principal_name = var.azure_mssql.upn
}

############################################
# MSSQL
############################################

resource "azurerm_mssql_server" "tf_mssql" {
  name                          = var.azure_mssql.name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  version                       = var.azure_mssql.version
  administrator_login           = var.azure_resource_group.admin
  administrator_login_password  = var.azure_resource_group.pass
  minimum_tls_version           = var.azure_mssql.tls
  public_network_access_enabled = false
  azuread_administrator {
    login_username = data.azuread_user.admin.user_principal_name
    object_id      = data.azuread_user.admin.object_id
  }
}

############################################
# MSSQL DATABASE
############################################

resource "azurerm_mssql_database" "tf_mssql_db" {
  #checkov:skip=CKV_AZURE_224: Doesnt need the ledger
  name           = var.azure_mssql.db_name
  server_id      = azurerm_mssql_server.tf_mssql.id
  collation      = var.azure_mssql.db_col
  license_type   = var.azure_mssql.db_lic
  max_size_gb    = var.azure_mssql.db_size
  sku_name       = var.azure_mssql.db_sku
  zone_redundant = true
}

############################################
# MSSQL FIREWALL
############################################

resource "azurerm_mssql_firewall_rule" "tf_mssql_fw" {
  name             = var.azure_mssql.fw_name
  server_id        = azurerm_mssql_server.tf_mssql.id
  start_ip_address = var.azure_dbs_fw.ini
  end_ip_address   = var.azure_dbs_fw.fin
}

############################################
# MSSQL AUDIT
############################################

resource "azurerm_mssql_server_extended_auditing_policy" "tf_mssql_audit" {
  server_id                  = azurerm_mssql_server.tf_mssql.id
  storage_endpoint           = var.blob_endpoint
  storage_account_access_key = var.storage_account_key
  retention_in_days          = var.azure_mssql.retention
}

############################################
# MSSQL PRIVATE ENDPOINT
############################################

resource "azurerm_private_endpoint" "tf_sql_pe" {
  name                = "${azurerm_mssql_server.tf_mssql.name}-pe"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sb_private_id

  private_service_connection {
    name                           = "${azurerm_mssql_server.tf_mssql.name}-connection"
    private_connection_resource_id = azurerm_mssql_server.tf_mssql.id
    subresource_names              = [var.azure_mssql.sub_name]
    is_manual_connection           = false
  }
}

############################################
# MSSQL SECURITY ALERT
############################################

resource "azurerm_mssql_server_security_alert_policy" "sql_va_policy" {
  resource_group_name        = var.resource_group_name
  server_name                = azurerm_mssql_server.tf_mssql.name
  state                      = "Enabled"
  storage_endpoint           = var.blob_endpoint
  storage_account_access_key = var.storage_account_key
  email_addresses            = var.azure_mssql.email
  email_account_admins       = true
}