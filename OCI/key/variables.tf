############################################
# KEY
############################################

variable "oci_key" {
  description = "Configurações da chave SSH"
  type = object({
    algo = string
    bit  = string
    file = string
    perm = string
  })
}