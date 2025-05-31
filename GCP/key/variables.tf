############################################
# KEY
############################################

variable "gcp_key" {
  description = "Key Variables"
  type = object({
    algo    = string
    perm    = string
    private = string
    rsa     = number
  })
}