# variables.tf
variable "aws_region" {
	default = "us-gov-west-1"
}

variable "vpc_cidr" {
	default = "10.160.0.0/16"
}

variable "subnets_public_cidr" {
	type = "list"
	default = ["10.160.0.0/22", "10.160.4.0/22"]
}

variable "subnets_private_cidr" {
	type = "list"
	default = ["10.160.24.0/22", "10.160.28.0/22"]
}

variable "azs" {
	type = "list"
	default = ["us-gov-west-1a", "us-gov-west-1b"]
}
