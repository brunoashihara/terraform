############################################
# BLOB
############################################

variable "azure_blob" {
  description = "Blob Variables"
  type = object({
    name = string
    type = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}