############################################
# KEYS
############################################

variable "aws_key" {
  description = "Key Variables"
  type  = object({
    algo      = string
    private   = string
    perm      = string
    public    = string
  })
}