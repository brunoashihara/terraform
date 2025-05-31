############################################
# NETWORK INTERFACE
############################################

variable "azure_ni" {
  description = "Network Interface Variables"
  type = object({
    alloc     = string
    linux     = string
    name      = string
    windows   = string
  })
}

############################################
# RESOURCE GROUP
############################################

variable "azure_resource_group" {
  description = "Resource group Variables"
  type = object({
    admin   = string
    name    = string
    onprem  = string
    pass    = string
    region  = string
  })
}

############################################
# VIRTUAL MACHINE
############################################

variable "azure_vm_linux" {
  description = "Virtual Machine Linux Variables"
  type = object({
    cache     = string
    conn_type = string
    disk      = string
    sku       = string
    name      = string
    offer     = string
    publisher = string
    tier      = string
    type      = string
    version   = string
  })
}

variable "azure_vm_windows" {
  description = "Virtual Machine Windows Variables"
  type = object({
    cache     = string
    disk      = string
    ext1      = string
    ext1_pub  = string
    ext1_type = string
    ext1_vers = string
    sku       = string
    name      = string
    offer     = string
    publisher = string
    tier      = string
    type      = string
    version   = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "linux_public_ip_id" {
  description = "Linux Public IP ID"
  type        = string
}

variable "private_key_pem" {
  description = "Private Key"
  type        = string
}

variable "public_key_openssh" {
  description = "Public Key OpenSSH"
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet Public ID"
  type        = string
}

variable "storage_account_key" {
  description = "Storage Account Key"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "windows_public_ip_id" {
  description = "Windows Public IP ID"
  type        = string
}