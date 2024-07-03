
# public subnet 1a
resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = aws_vpc.akshay-vpc.id
  cidr_block        = var.public_subnet_cidr_block[0]
  availability_zone = var.availability_zones[0]
  tags = {
    "Name" = "akshay-alb-public-subnet-1a"
  }
}

# public subnet 1b
resource "aws_subnet" "public-subnet-1b" {
  vpc_id            = aws_vpc.akshay-vpc.id
  cidr_block        = var.public_subnet_cidr_block[1]
  availability_zone = var.availability_zones[1]
  tags = {
    "Name" = "akshay-alb-public-subnet-1b"
  }
}

# private subnet 1a
resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.akshay-vpc.id
  cidr_block        = var.private_subnet_cidr_block[0]
  availability_zone = var.availability_zones[0]
  tags = {
    "Name" = "akshay-alb-private-subnet-1a"
  }
}

# private subnet 1b
resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.akshay-vpc.id
  cidr_block        = var.private_subnet_cidr_block[1]
  availability_zone = var.availability_zones[1]
  tags = {
    "Name" = "akshay-alb-private-subnet-1a"
  }
}