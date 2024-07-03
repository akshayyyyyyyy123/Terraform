
# aws region
variable "aws_region" {
  description = "Specify the aws region"
  type        = string
  default     = "ap-south-1"
}

# public-subnet cidr block
variable "public_subnet_cidr_block" {
  type    = list(string)
  default = ["192.168.0.0/28", "192.168.0.16/28"]
}

# private-subnet cidr block
variable "private_subnet_cidr_block" {
  type    = list(string)
  default = ["192.168.0.32/28", "192.168.0.48/28"]
}

# availability zone for subnets
variable "availability_zones" {
  description = "List of availability zones in the ap-south-1 region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

# instance type
variable "instance_type" {
  description = "specify the type of instance"
  type        = string
  default     = "t2.micro"
}

# instance key-pair (uses already existing key-pair)
variable "instance_key_pair" {
  description = "Instance key-pair to ssh into the instance"
  type        = string
  default     = "akshay-key-pair"
}