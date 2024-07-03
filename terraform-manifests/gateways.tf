
# internet-gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.akshay-vpc.id

  tags = {
    "Name" = "akshay-alb-igw"
  }
}

# create an elastic-ip
resource "aws_eip" "elastic_ip" {
  domain = "vpc"

  tags = {
    "Name" = "elastic-ip"
  }
}

# nat-gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    "Name" = "nat-gw-for-public-subnet-1a"
  }
}
