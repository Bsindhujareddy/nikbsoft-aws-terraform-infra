variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "igw_name" {}
variable "nat_name" {}