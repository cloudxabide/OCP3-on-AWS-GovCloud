# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "dedicated"
  tags = {
    Name        = "OCP3-VPC" 
    Environment = "Development" 
    Purpose     = "Testing OpenShift"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id          = aws_vpc.main.id
}

# Subnet(s) Public 
resource "aws_subnet" "public" {
  count             = length(var.subnets_public_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnets_public_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "Subnet-Public-${count.index+1}"
  }
}

# Subnet(s) Private
resource "aws_subnet" "private" {
  count             = length(var.subnets_private_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnets_private_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "Subnet-Private-${count.index+1}"
  }
}

# Route Table - Internet Gatway Attach
resource "aws_route_table" "public_rt" {
  vpc_id            = aws_vpc.main.id
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.main_igw.id 
  }
}

# Route Table (Public Subnets)
resource "aws_route_table_association" "rt-public" {
  count             = length(var.subnets_public_cidr)
  subnet_id         = element(aws_subnet.public.*.id,count.index)
  route_table_id    = aws_route_table.public_rt.id
}

# NAT Gateway (AZ1)
# NAT Gateway (AZ2)
