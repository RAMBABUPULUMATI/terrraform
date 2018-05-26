# # data "aws_ami" "web" {
# #   filter {
# #     name   = "state"
# #     values = ["available"]
# #   }
# #   most_recent = true
# #   owners = ["682447408639"]
# # }
#
# # Create a new instance of the latest Ubuntu 14.04 on an
# # t2.micro node with an AWS Tag naming it "HelloWorld"
# # provider "aws" {
# #   region = "us-west-2"
# # }
#
# data "aws_ami" "ubuntu" {
#   most_recent = true
#
#   filter {
#     name   = "name"
#     values = ["Jenkins-M"]
#   }
#
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#
#   # owners = ["682447408639"] # Canonical
# }
#
# resource "aws_instance" "web1" {
#   ami           = "${data.aws_ami.ubuntu.id}"
#   instance_type = "t2.micro"
#
#   tags {
#     Name = "HelloWorld"
#   }
# }



variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

resource "aws_subnet" "example" {
  vpc_id            = "${data.aws_vpc.selected.id}"
  availability_zone = "us-west-2a"
  cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block,2,1)}"
}
