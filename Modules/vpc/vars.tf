variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "dedicated"
}

variable "vpc_id" {}

variable "subnet_cidr_1" {
    default = "10.0.1.0/24"
}

variable "subnet_cidr_2" {
    default = "10.0.2.0/24"
}

variable "availibility_zone_1" {}

variable "availibility_zone_2" {}

