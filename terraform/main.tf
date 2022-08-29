resource "aws_vpc" "kiki_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "name" = "dev"
  }
}

resource "aws_subnet" "kiki_public_subnet" {
    vpc_id = aws_vpc.kiki_vpc.id
    cidr_block = "10.0.0.0/17"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"

       tags = {
          name = "dev-public"
}
}
