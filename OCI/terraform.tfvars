############################################
# AUTONOMOUS DATABASE
############################################

oci_autonomousdb = {
  backup    = "true"
  db_name   = "autodbtf"
  free      = "true"
  name      = "autodbtf"
  pass      = "troqueasenha"
  retention = 1
  version   = "19c" 
}

############################################
# BUCKET
############################################

oci_bucket = {
  name      = "tf-bucket"
  namespace = "idnriwtvurim"
  tier      = "Standard"
  type      = "NoPublicAccess"
}

############################################
# Customer Premises Equipament
############################################

oci_cpe = {
  ip   = "0.0.0.0"
  name = "tf-cpe"
}

############################################
# COMPARTMENT
############################################

oci_compartment = {
  ad     = "jSSY:US-ASHBURN-AD-1"
  delete = true
  desc   = "tf compartment deploy"
  name   = "tf"
}

############################################
# COMPUTE
############################################

oci_compute = {
  ad          = "jSSY:US-ASHBURN-AD-1"
  img         = "ocid1.image.oc1.iad.aaaaaaaacnjdag7ngxnzim3ogkgfywf4aoclwz4gkcaqdr773hukt5o2ahma"
  name        = "oci01"
  public      = true
  shape = {
    ocpus = 1
    mem   = 1
    name  = "VM.Standard.E2.1.Micro"
  }
  source_type = "image"
  type        = "ssh"
  user        = "opc"
}

############################################
# Dynamic Routing Gateway
############################################

oci_drg = {
  name = "tf-drg"
}

############################################
# Dynamic Routing Gateway Attachment
############################################

oci_drg_attach = {
  name = "tf-drg-attach"
  type = "VCN"
}

############################################
# EXPORT
############################################

oci_export = {
  path = "/export"
}

############################################
# FILE STORAGE
############################################

oci_file = {
  ad   = "jSSY:US-ASHBURN-AD-1"
  name = "tf-file"
}

############################################
# INTERNET GATEWAY
############################################

oci_igw = {
  name = "tf-igw"
}

############################################
# IPSec
############################################

oci_ipsec = {
  cpe        = "0.0.0.0"
  ident_type = "IP_ADDRESS"
  name       = "ipsec"
  static     = ["0.0.0.0/0"]
}

############################################
# KEY
############################################

oci_key = {
  algo = "RSA"
  bit  = "2048"
  file = "oci.pem"
  perm = "0600"
}

############################################
# MOUNT TARGET
############################################

oci_mount = {
  ad   = "jSSY:US-ASHBURN-AD-1"
  name = "mt-tf"
}

############################################
# NETWORK SECURITY GROUP PRIVATE
############################################

oci_nsg_private = {
  name           = "tf-nsg-private"
  ingress_rules = [
    {
      protocol    = "all"
      source_type = "CIDR_BLOCK"
      source      = "10.250.120.0/22"
      description = "private traffic"
    }
  ]
  egress_rules = [
    {
      protocol         = "all"
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      description      = "all out"
    }
  ]
}

############################################
# NETWORK SECURITY GROUP PUBLIC
############################################

oci_nsg_public = {
  name           = "tf-nsg-public"
  ingress_rules = [
    {
      protocol    = "all"
      source_type = "CIDR_BLOCK"
      source      = "0.0.0.0/0"
      description = "Access SSH/HTTP/HTTPS"
    }
  ]
  egress_rules = [
    {
      protocol         = "all"
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      description      = "All out"
    }
  ]
}

############################################
# ROUTE TABLE PRIVATE
############################################

oci_rt_private = {
  name  = "tf-rt-private"
}

############################################
# ROUTE TABLE PUBLIC
############################################

oci_rt_public = {
  name  = "tf-rt-public"
  rules = [
    {
      cidr        = "0.0.0.0/0"
      description = "Route Table Rule IGW"
      target      = "igw"
    },
    {
      cidr        = "0.0.0.0/0"
      description = "Route Table Rule DRG"
      target      = "drg"
    }
  ]
}


############################################
# SUBNET PRIVATE
############################################

oci_sb_private = {
  cidr   = "10.250.120.0/24"
  name   = "tf-sb-private"
  public = false
  label  = "private"
}

############################################
# SUBNET PUBLIC
############################################

oci_sb_public = {
  cidr    = "10.250.121.0/24"
  name    = "tf-sb-public"
  public  = true
  label   = "public"
}

############################################
# VCN
############################################

oci_vcn = {
  cidr = ["10.250.120.0/22"]
  name = "tf-vcn"
}