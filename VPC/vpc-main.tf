resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr-block
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
  tags                             = { Name = "${var.tf-name}" }
}
resource "aws_internet_gateway" "igw-tf" {
  vpc_id = aws_vpc.vpc.id
  tags   = { NAME = "igw-${var.tf-name}" }
}
resource "aws_route_table" "vpc-RT" {
  vpc_id = aws_vpc.vpc.id
  tags   = { NAME = "${var.tf-name}-RT" }
}

resource "aws_route" "internet-route" {
  route_table_id         = aws_route_table.vpc-RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-tf.id
}
resource "aws_route" "ipv6_internet-route" {
  route_table_id              = aws_route_table.vpc-RT.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.igw-tf.id
}
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.azs[0]
  cidr_block        = var.subnet-1
  map_public_ip_on_launch = true
  tags              = { Name = "${var.tf-name}-subnet-1" }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.azs[1]
  cidr_block        = var.subnet-2
  map_public_ip_on_launch = true
  tags              = { Name = "${var.tf-name}-subnet-2" }
}

resource "aws_subnet" "subnet-3" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.azs[2]
  cidr_block        = var.subnet-3
  map_public_ip_on_launch = true
  tags              = { Name = "${var.tf-name}-subnet-3" }
}

resource "aws_route_table_association" "subnet-1-rt" {
  route_table_id = aws_route_table.vpc-RT.id
  subnet_id      = aws_subnet.subnet-1.id
}
resource "aws_route_table_association" "subnet-2-rt" {
  route_table_id = aws_route_table.vpc-RT.id
  subnet_id      = aws_subnet.subnet-2.id
}

resource "aws_route_table_association" "subnet-3-rt" {
  route_table_id = aws_route_table.vpc-RT.id
  subnet_id      = aws_subnet.subnet-3.id
}
