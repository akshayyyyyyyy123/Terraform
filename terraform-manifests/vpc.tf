
# vpc
resource "aws_vpc" "akshay-vpc" {
  cidr_block       = "192.168.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "akshay-alb-vpc"
  }
}