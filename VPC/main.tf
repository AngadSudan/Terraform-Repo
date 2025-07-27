terraform {
  required_providers {
    aws= {
        source = "hashicorp/aws"
        version = "5.54.1"
    }
    random_id = {
        source = "hashicorp/random"
        version = "3.6.2"
    }
  }
}

resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-aws-vpc"
  }
}

resource "aws_subnet" "aws_public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "aws_private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = "my-internet-gateway"
  }
}

resource "aws_route_table" "aws_vpc_route_table" {
  vpc_id = aws_vpc.aws_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
  tags= {
    Name = "my-vpc-routing-table"
  }
}


resource "aws_route_table_association" "connecting_route_table" {
  route_table_id = aws_route_table.aws_vpc_route_table.id
  subnet_id =  aws_subnet.aws_public_subnet.id
}

resource "aws_instance" "private_ec2" {
  ami = "aws-xxxxxxx"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aws_private_subnet.id
  tags = {
    Name = "aws-private-subnet-ec2"
  }
}