
# security-group that allow ssh traffic
resource "aws_security_group" "allow_ssh_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.akshay-vpc.id

  ingress {
    description = "Allow only ssh access from admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.207.232.243/32"] #change 
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# security-group that allows all alb traffic from ALB to instances locally within VPC
resource "aws_security_group" "allow_alb_traffic" {
  name        = "allow_alb_traffic"
  description = "Allow ALB traffic"
  vpc_id      = aws_vpc.akshay-vpc.id

  ingress {
    description = "Allow all ALB traffic from office vpn"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    #cidr_blocks = [ "115.111.96.120/29", "106.51.37.224/32", "125.19.50.240/29", "192.168.0.0/24" ]
    cidr_blocks = ["192.168.0.0/24"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_alb_traffic"
  }
}

# security group for application load balancer
resource "aws_security_group" "allow_vpn_traffic_for_alb" {
  name        = "allow_vpn_traffic"
  description = "Security group for ALB with specified rules"
  vpc_id      = aws_vpc.akshay-vpc.id

  ingress {
    description = "Allow all ALB traffic from office vpn"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["115.111.96.120/29", "125.19.50.240/29", "192.168.0.0/24"]
  }

  # ingress {
  #    description = "Allow all traffic from alb"
  #   from_port   = 0
  #   to_port     = 65535
  #   protocol    = "tcp"
  #   cidr_blocks = [ "115.111.96.120/29", "125.19.50.240/29", "192.168.0.0/24" ]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}