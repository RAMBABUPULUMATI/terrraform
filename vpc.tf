 resource "aws_vpc" "kanna-vpc" {
   cidr_block = "${var.vpc_cidr}"
   tags {
     Name = "kanna"
   }

 }
