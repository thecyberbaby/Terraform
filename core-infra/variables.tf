variable "region" {
  description = "aws region"
  type        = string
}

variable "profile" {
  description = "aws sso profile"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "aws vpc for dev"
  type        = string
  default     = ""
}

variable "public_subnet_cidrs" {
  description = "public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "private subnets"
  type        = list(string)
}

variable "bastion_ami" {
  description = "private subnets"
  type        = string
}

variable "instance_type" {
  description = "private subnets"
  type        = string
}

variable "key_name" {
  description = "private subnets"
  type        = string
}