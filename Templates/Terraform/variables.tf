# variables.tf
#  NOTE:  A number of these "lists" will be dynamically cataloged later
#         Ex.  If you have 2 AZ listed, the vpc.tf will create 2 public subnets
#              If you have 3 AZ listed, then it will create 3
#         The farther down this file, the less likely it is that you should need to modify the value
variable "aws_region" {
  default   = "us-gov-west-1"
}

variable "availability_zones" {
  type      = list
  default   = ["us-gov-west-1a", "us-gov-west-1b"]
  #default   = ["us-gov-west-1a", "us-gov-west-1b", "us-gov-west-1c"]
}

variable "vpc_cidr" {
  default   = "10.160.0.0/16"
}

variable "subnets_public_cidr" {
  type      = list
  default   = ["10.160.0.0/22", "10.160.4.0/22", "10.160.8.0/22"]
}

variable "subnets_private_cidr" {
  type      = list
  default   = ["10.160.24.0/22", "10.160.28.0/22", "10.160.32.0/22"]
}

# =============================================================================
variable "domain_name_tld" {
  type      = string
  default   = "clouditoutloud.com"
}
variable "domain_name_tertiary" {
  type      = string
  default   = "cloudapps.clouditoutloud.com"
}

# =============================================================================
variable "ocp3_ami" {
  type      = string
  default   = "ami-5a740e3b" # us-gov-west-1 (Red Hat Enterprise Linux 7.6 (HVM))
}
#us-gov-west-1: ami-5a740e3b
#us-gov-east-1: ami-43d63732

variable "instance_type_bastion" {
  type      = string
  default   = "t3.micro"
}
variable "instance_type_master" {
  type      = string
  default   = "t3.micro"
}
variable "instance_type_infra" {
  type      = string
  default   = "t3.micro"
}
variable "instance_type_compute" {
  type      = string
  default   = "t3.micro"
}

#variable "ami" {
#  description   = "ID of AMI to use for the instance(s)"
#}

# =============================================================================
variable "ingress_cidr" {
  type          = list
  default       = [ "0.0.0.0/0" ]
}
variable "egress_cidr" {
  type          = list
  default       = [ "0.0.0.0/0" ]
}
variable "source_cidr" {
  type          = list
  default       = [ "0.0.0.0/0" ]
}

# =============================================================================
variable "dnsSupport" {
  default = true
}
variable "dnsHostNames" {
  default = true
}
variable "instanceTenancy" {
  default = "default"
}

