
resource "aws_vpc" "Wiki_VPC" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name    = "Wiki_VPC"
    Product = "Wiki"
  }
}

resource "aws_subnet" "Wiki-subnet" {
  vpc_id     = "${aws_vpc.Wiki_VPC.id}"
  cidr_block = var.sub_cidr_a
  map_public_ip_on_launch = "true"
  availability_zone       = var.av_zone

  tags = {
    Name    = "${var.app}-Subnet"
    Product = "Wiki"
  }
}


resource "aws_internet_gateway" "Wiki-Internet-GW" {
  vpc_id = aws_vpc.Wiki_VPC.id

  tags = {
    Name    = "${var.app}-InternetGW"
    Product = "Wiki"
  }
}


resource "aws_route_table" "Wiki-Public-RT" {
  vpc_id = aws_vpc.Wiki_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Wiki-Internet-GW.id
  }

  tags = {
    Name    = "${var.app}-Pub-RT"
    Product = "Wiki"
  }
}

resource "aws_route_table_association" "Wiki-Pub-RT" {
  subnet_id      = aws_subnet.Wiki-subnet.id
  route_table_id = aws_route_table.Wiki-Public-RT.id
}




