resource "aws_vpc" "kiki_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "name" = "dev"
  }
}

resource "aws_subnet" "kiki_public_subnet" {
  vpc_id                  = aws_vpc.kiki_vpc.id
  cidr_block              = "10.0.0.0/17"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    name = "dev-public"
  }
}

resource "aws_internet_gateway" "kiki_internet_gateway" {
  vpc_id = aws_vpc.kiki_vpc.id

  tags = {
    "name" = "dev-igw"
  }
}

resource "aws_route_table" "kiki_public_rt" {
  vpc_id = aws_vpc.kiki_vpc.id

  tags = {
    name = "dev-public-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.kiki_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.kiki_internet_gateway.id

}

resource "aws_route_table_association" "kiki_public_assoc" {
  subnet_id      = aws_subnet.kiki_public_subnet.id
  route_table_id = aws_route_table.kiki_public_rt.id
}

resource "aws_security_group" "kiki_sg" {
  name        = "dev_sg"
  description = "dev security group"
  vpc_id      = aws_vpc.kiki_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.kiki_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


