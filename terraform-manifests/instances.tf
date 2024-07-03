
# ec2 instance launched from private subnet in ap-south-1a
resource "aws_instance" "private-instance-1" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  key_name                    = var.instance_key_pair
  vpc_security_group_ids      = [aws_security_group.allow_ssh_access.id, aws_security_group.allow_alb_traffic.id]
  availability_zone           = var.availability_zones[0]
  associate_public_ip_address = false
  subnet_id                   = aws_route_table_association.private_subnet_1a_association.id
  user_data                   = file("${path.module}/script.sh")

  tags = {
    "Name" = "instance-1a"
  }
}

# ec2 instance launched from private subnet ap-south-1b
resource "aws_instance" "private-instance-2" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  key_name                    = var.instance_key_pair
  vpc_security_group_ids      = [aws_security_group.allow_ssh_access.id, aws_security_group.allow_alb_traffic.id]
  availability_zone           = var.availability_zones[1]
  associate_public_ip_address = false
  subnet_id                   = aws_route_table_association.private_subnet_1b_association.id
  user_data                   = file("${path.module}/script.sh")

  tags = {
    "Name" = "instance-1b"
  }
}