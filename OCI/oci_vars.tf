############################################
# COMPARTMENTS
############################################

variable "compartment" {
  description = "Variaveis compartment"
  default = {
    name   = "tf"
    desc   = "teste tofu"
    delete = true
    ad     = "jSSY:US-ASHBURN-AD-1"
  }
}

############################################
# VCN
############################################

variable "vcn" {
  description = "The details of VCN1."
  default = {
    cidr = ["10.23.0.0/20"]
    name = "tf-vcn"
  }
}

############################################
# SUBNET PUBLIC
############################################

variable "sb_public" {
  description = "The details of the subnet"
  default = {
    cidr   = "10.23.11.0/24"
    name   = "sb-public"
    public = true
  }
}

############################################
# ROUTE TABLE PUBLIC
############################################

variable "rt_public" {
  description = "Variaveis rt public"
  default = {
    name  = "rt-public"
    desc1 = "Route Table Rule IGW"
    cidr1 = "0.0.0.0/0"
    desc2 = "Route Table Rule DRG"
    cidr2 = "x.x.x.x/x"
  }
}

############################################
# INTERNET GATEWAY
############################################

variable "igw" {
  description = "Variaveis internet gateway"
  default = {
    name = "igw"
  }
}

############################################
# NETWORK SECURITY GROUP PUBLIC
############################################

variable "nsg_public" {
  description = "Variaveis nsg public"
  default = {
    name      = "tf-nsg"
    type      = "CIDR_BLOCK"
    ingress   = "INGRESS"
    egress    = "EGRESS"
    proto_all = "all"
    cidr_all  = "0.0.0.0/0"
  }
}

############################################
# INSTANCE
############################################

variable "instance" {
  description = "The details of the compute instance"
  default = {
    name        = "oci01"
    public      = true
    img         = "ocid1.image.oc1.iad.aaaaaaaacnjdag7ngxnzim3ogkgfywf4aoclwz4gkcaqdr773hukt5o2ahma"
    source_type = "image"
    shape = {
      name  = "VM.Standard.E2.1.Micro"
      ocpus = 1
      mem   = 1
    }
    type = "ssh"
    user = "opc"
    ad   = "jSSY:US-ASHBURN-AD-1"
  }
}

############################################
# KEY
############################################

variable "key" {
  description = "Variaveis key"
  default = {
    algo = "RSA"
    bit  = "2048"
    file = "teste-oci-key.pem"
    perm = "0600"
  }
}

############################################
# BUCKET
############################################

variable "bucket" {
  description = "Variaveis bucket"
  default = {
    name      = "tf-tf-teste-tf-tf"
    namespace = "idnriwtvurim"
    type      = "NoPublicAccess"
    tier      = "Standard"
  }
}

############################################
# AUTONOMOUS DATABASE
############################################

variable "autodb" {
  description = "Variaveis autonomousdb"
  default = {
    db_name   = "autodbtf"
    name      = "autodbtf"
    version   = "19c"
    free      = "true"
    pass      = "##123Mudar@@"
    backup    = "true"
    retention = 1
  }
}

############################################
# FILE STORAGE
############################################

variable "file" {
  description = "Variaveis file"
  default = {
    name = "tf-file"
    ad   = "jSSY:US-ASHBURN-AD-1"
  }
}

############################################
# MOUNT TARGET
############################################

variable "mount" {
  description = "Variaveis mount target"
  default = {
    name = "mt-tf"
    ad   = "jSSY:US-ASHBURN-AD-1"
  }
}

############################################
# EXPORT
############################################

variable "export" {
  description = "Variaveis export"
  default = {
    path = "/export"
  }
}

############################################
# Customer Premises Equipament
############################################

variable "cpe" {
  description = "Variaveis cpe"
  default = {
    name = "cpe"
    ip   = "x.x.x.x"
  }
}

############################################
# Dynamic Routing Gateway
############################################

variable "drg" {
  description = "Variaveis drg"
  default = {
    name = "drg"
  }
}

############################################
# Dynamic Routing Gateway Attachment
############################################

variable "drg_attach" {
  description = "Variaveis drg attachment"
  default = {
    name = "drg-attach"
    type = "VCN"
  }
}

############################################
# IPSec
############################################

variable "ipsec" {
  description = "Variaveis ipsec"
  default = {
    name       = "ipsec"
    ident_type = "IP_ADDRESS"
    cpe        = "x.x.x.x"
    static     = ["x.x.x.x/x"]
  }
}