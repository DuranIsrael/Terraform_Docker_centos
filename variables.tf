#vpc variable

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_1" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_2" {
  type = string
  default = "10.0.2.0/24"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}