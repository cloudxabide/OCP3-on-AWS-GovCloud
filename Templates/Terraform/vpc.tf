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
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnets_public_cidr,count.index)
  availability_zone = element(var.availability_zones,count.index)
  tags = {
    Name = "Subnet-Public-${count.index+1}"
  }
}

# Subnet(s) Private
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnets_private_cidr,count.index)
  availability_zone = element(var.availability_zones,count.index)
  tags = {
    Name = "Subnet-Private-${count.index+1}"
  }
}

# ==============================================================================
# Route Table for NAT (public)
resource "aws_route_table" "public" {
  count            = length(var.availability_zones)
  vpc_id           = aws_vpc.main.id
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.main_igw.id
  }
  tags = {
    "Name"         = "Route Table (Public) - ${element(var.availability_zones,count.index)}"
  }
}

# Route Table Association (public)
resource "aws_route_table_association" "public" {
  count             = length(var.availability_zones)
  subnet_id         = element(aws_subnet.public.*.id,count.index)
  route_table_id    = element(aws_route_table.public.*.id,count.index)
}

# ==============================================================================
## NAT GATEWAY CONFIGURATION
# EIP(s)
resource "aws_eip" "main" {
  count             = length(var.availability_zones)
  vpc               = true
  tags = {
    "Name"          = "NAT EIP - ${element(var.availability_zones,count.index)}"
  }
}
# NAT Gateway(s)
resource "aws_nat_gateway" "main" {
  count             = length(var.availability_zones)
  subnet_id         = element(aws_subnet.public.*.id,count.index)
  allocation_id     = element(aws_eip.main.*.id,count.index)
  depends_on        = [aws_internet_gateway.main_igw]
  tags = {
    "Name"          = "NATGW - ${element(var.availability_zones,count.index)}"
  }
}

# Route Table for NAT (private)
resource "aws_route_table" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  tags = {
    "Name"         = "Route Table (Private) - ${element(var.availability_zones,count.index)}"
  }
}

# Route Table Association (private)
resource "aws_route_table_association" "private" {
  count             = length(var.availability_zones)
  subnet_id         = element(aws_subnet.private.*.id,count.index)
  route_table_id    = element(aws_route_table.private.*.id,count.index)
}

