#vpc variable

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "subnet_1" {
  type = string
  cidr_block = "10.0.1.0/24"
}

variable "subnet_2" {
  type = string
  cidr_block = "10.0.2.0/24"
}