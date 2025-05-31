############################################
# MSSQL
############################################

resource "azurerm_mssql_server" "tf_mssql" {
  name                         = var.azure_mssql.name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = var.azure_mssql.version
  administrator_login          = var.azure_resource_group.admin
  administrator_login_password = var.azure_resource_group.pass
}

############################################
# MSSQL DATABASE
############################################

resource "azurerm_mssql_database" "tf_mssql_db" {
  name           = var.azure_mssql.db_name
  server_id      = azurerm_mssql_server.tf_mssql.id
  collation      = var.azure_mssql.db_col
  license_type   = var.azure_mssql.db_lic
  max_size_gb    = var.azure_mssql.db_size
  sku_name       = var.azure_mssql.db_sku
  zone_redundant = false
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
# MYSQL
############################################

resource "azurerm_mysql_server" "tf_mysql" {
  name                              = var.azure_mysql.name
  location                          = var.resource_group_location
  resource_group_name               = var.resource_group_name
  administrator_login               = var.azure_resource_group.admin
  administrator_login_password      = var.azure_resource_group.pass
  sku_name                          = var.azure_mysql.sku
  storage_mb                        = var.azure_mysql.stg
  version                           = var.azure_mysql.version
  auto_grow_enabled                 = true
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = var.azure_mysql.tls
}

############################################
# MYSQL DATABASE
############################################

resource "azurerm_mysql_database" "tf_mysql_db" {
  name                = var.azure_mysql.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.tf_mysql.name
  charset             = var.azure_mysql.db_char
  collation           = var.azure_mysql.db_col
}

############################################
# MYSQL FIREWALL
############################################

resource "azurerm_mysql_firewall_rule" "tf_mysql_fw" {
  name                = var.azure_mysql.fw_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.tf_mysql.name
  start_ip_address    = var.azure_dbs_fw.ini
  end_ip_address      = var.azure_dbs_fw.fin
}

############################################
# POSTGRES
############################################

resource "azurerm_postgresql_server" "tf_postgres" {
  name                         = var.azure_postgres.name
  location                     = var.resource_group_location
  resource_group_name          = var.resource_group_name
  sku_name                     = var.azure_postgres.sku
  storage_mb                   = var.azure_postgres.stg
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.azure_resource_group.admin
  administrator_login_password = var.azure_resource_group.pass
  version                      = var.azure_postgres.version
  ssl_enforcement_enabled      = var.azure_postgres.ssl
}

############################################
# POSTGRES DATABASE
############################################

resource "azurerm_postgresql_database" "tf_postgres_db" {
  name                = var.azure_postgres.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.tf_postgres.name
  charset             = var.azure_postgres.db_char
  collation           = var.azure_postgres.db_col
}

############################################
# POSTGRES FIREWALL
############################################

resource "azurerm_postgresql_firewall_rule" "tf_postgres_fw" {
  name                = var.azure_postgres.fw_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.tf_postgres.name
  start_ip_address    = var.azure_dbs_fw.ini
  end_ip_address      = var.azure_dbs_fw.fin
}