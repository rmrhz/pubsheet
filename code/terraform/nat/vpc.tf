# VPC
resource "aws_vpc" "duh" {
  cidr_block = "10.0.0.0/23"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Duh VPC"
  }
}

# Subnets
resource "aws_subnet" "a" {
  vpc_id = aws_vpc.duh.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "{your availability zone here}"

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "b" {
  vpc_id = aws_vpc.duh.id
  cidr_block = "10.0.1.0/25"
  availability_zone = "{your availability zone here}"

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "c" {
  vpc_id = aws_vpc.duh.id
  cidr_block = "10.0.1.128/25"
  map_public_ip_on_launch = true
  availability_zone = "{your availability zone here}"

  tags = {
    Name = "Public"
  }
}

# Networking
resource "aws_route_table" "pvt" {
  vpc_id = aws_vpc.duh.id
  
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }

  tags = {
    Name = "Private Routing"
  }
}

resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.duh.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Public Routing"
  }
}

resource "aws_main_route_table_association" "duh_assoc" {
  vpc_id         = aws_vpc.duh.id
  route_table_id = aws_route_table.pvt.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.a.id
  route_table_id = aws_route_table.pvt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.b.id
  route_table_id = aws_route_table.pvt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.c.id
  route_table_id = aws_route_table.pub.id
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.duh.id

  tags = {
    Name = "VPC Gateway"
  }
}
