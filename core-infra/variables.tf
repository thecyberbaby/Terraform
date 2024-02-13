variable "region" {
  description = "aws vpc"
  type = string
}

variable "vpc_cidr" {
  description = "aws vpc cidr"
  type = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet cidr values"
  type = list(string)
  default = []
}

variable "private_subnet_cidrs" {
  description = "Private subnet cidr values"
  type = list(string)
  default = []
}

variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
  default = []
}
