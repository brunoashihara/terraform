############################################
# MSSQL
############################################

resource "azurerm_mssql_server" "teste_mssql" {
  name                         = var.mssql.name
  resource_group_name          = azurerm_resource_group.teste_rg.name
  location                     = azurerm_resource_group.teste_rg.location
  version                      = var.mssql.version
  administrator_login          = var.rg.admin
  administrator_login_password = var.rg.pass
}

############################################
# MSSQL DATABASE
############################################

resource "azurerm_mssql_database" "teste_mssql_db" {
  name           = var.mssql.db_name
  server_id      = azurerm_mssql_server.teste_mssql.id
  collation      = var.mssql.db_col
  license_type   = var.mssql.db_lic
  max_size_gb    = var.mssql.db_size
  sku_name       = var.mssql.db_sku
  zone_redundant = false
}

############################################
# MSSQL FIREWALL
############################################

resource "azurerm_mssql_firewall_rule" "teste_mssql_fw" {
  name             = var.mssql.fw_name
  server_id        = azurerm_mssql_server.teste_mssql.id
  start_ip_address = var.dbs_fwini
  end_ip_address   = var.dbs_fw.fin
}

############################################
# POSTGRES
############################################

resource "azurerm_postgresql_server" "teste_postgres" {
  name                         = var.postgres.name
  location                     = azurerm_resource_group.teste_rg.location
  resource_group_name          = azurerm_resource_group.teste_rg.name
  sku_name                     = var.postgres.sku
  storage_mb                   = var.postgres.stg
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.rg.admin
  administrator_login_password = var.rg.pass
  version                      = var.postgres.version
  ssl_enforcement_enabled      = var.postgres.ssl
}

############################################
# POSTGRES DATABASE
############################################

resource "azurerm_postgresql_database" "teste_postgres_db" {
  name                = var.postgres.db_name
  resource_group_name = azurerm_resource_group.teste_rg.name
  server_name         = azurerm_postgresql_server.teste_postgres.name
  charset             = var.postgres.db_char
  collation           = var.postgres.db_col
}

############################################
# POSTGRES FIREWALL
############################################

resource "azurerm_postgresql_firewall_rule" "teste_postgres_fw" {
  name                = var.postgres.fw_name
  resource_group_name = azurerm_resource_group.teste_rg.name
  server_name         = azurerm_postgresql_server.teste_postgres.name
  start_ip_address    = var.dbs_fw.ini
  end_ip_address      = var.dbs_fw.fin
}

############################################
# MYSQL
############################################

resource "azurerm_mysql_server" "teste_mysql" {
  name                              = var.mysql.name
  location                          = azurerm_resource_group.teste_rg.location
  resource_group_name               = azurerm_resource_group.teste_rg.name
  administrator_login               = var.rg.admin
  administrator_login_password      = var.rg.pass
  sku_name                          = var.mysql.sku
  storage_mb                        = var.mysql.stg
  version                           = var.mysql.version
  auto_grow_enabled                 = true
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = var.mysql.tls
}

############################################
# MYSQL DATABASE
############################################

resource "azurerm_mysql_database" "teste_mysql_db" {
  name                = var.mysql.db_name
  resource_group_name = azurerm_resource_group.teste_rg.name
  server_name         = azurerm_mysql_server.teste_mysql.name
  charset             = var.mysql.db_char
  collation           = var.mysql.db_col
}

############################################
# MYSQL FIREWALL
############################################

resource "azurerm_mysql_firewall_rule" "teste_mysql_fw" {
  name                = var.mysql.fw_name
  resource_group_name = azurerm_resource_group.teste_rg.name
  server_name         = azurerm_mysql_server.teste_mysql.name
  start_ip_address    = var.dbs_fw.ini
  end_ip_address      = var.dbs_fw.fin
}