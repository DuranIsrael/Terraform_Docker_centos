resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr_1}"

  tags = {
    Name = "subnet_1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr_2}"

  tags = {
    Name = "subnet_2"
  }
}

output "vpc_id"{
  value = "${aws_vpc.main.id}"
}

output "subnet_id" {
   value = "${aws_subnet.subnet_1.id}"
}

output "subnet_id" {
   value = "${aws_subnet.subnet_2.id}"
}