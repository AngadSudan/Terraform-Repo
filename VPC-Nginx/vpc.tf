resource "aws_vpc" "http_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "http_vpc"
  }
}

resource "aws_subnet" "aws_public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.http_vpc.id
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "aws_private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.http_vpc.id
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_route_table" "vpc_routing_table" {
  vpc_id = aws_vpc.http_vpc
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
  tags = {
    Name = "vpc-routing-table"
  }
}

resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.http_vpc.id
  tags = {
    Name = "aws-igw"
  }
}

resource "aws_route_table_association" "vpc_routing_rule" {
  subnet_id = aws_subnet.aws_public_subnet.id
  gateway_id = aws_internet_gateway.aws_igw.id 
  route_table_id = aws_route_table.vpc_routing_table.id
}