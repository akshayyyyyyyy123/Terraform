
# public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.akshay-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "akshay-alb-public-rt"
  }
}

# Associate public subnet 1a with public route table
resource "aws_route_table_association" "public_subnet_1a_association" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate public subnet 1b with public route table
resource "aws_route_table_association" "public_subnet_1b_association" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public_rt.id
}


# private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.akshay-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    "Name" = "akshay-alb-private-rt"
  }
}

# Associate private subnet 1a with private route table
resource "aws_route_table_association" "private_subnet_1a_association" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private_rt.id
}

# Associate private subnet 1b with private route table
resource "aws_route_table_association" "private_subnet_1b_association" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.private_rt.id
}

