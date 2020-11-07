
####### vpc 
resource "aws_vpc" "vpctf" {
  cidr_block = var.vpccidr
  enable_dns_hostnames = true 
  tags = {
    Name = "VPCTF"
  }
}
###### create IGW and attach to vpc 
resource "aws_internet_gateway" "igwtf" {
  vpc_id = aws_vpc.vpctf.id 
  tags = {
    Name = "IGWTF"
  }
}
####### create Route table and routed to igw 
resource "aws_route_table" "pubRT" {
  vpc_id = aws_vpc.vpctf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwtf.id
  }
  tags = {
    Name = "PublicRT"
  }
}
###### private RT
resource "aws_route_table" "priRT" {
  vpc_id = aws_vpc.vpctf.id
  tags = {
    Name = "PrivateRT"
  }
}
##### create public subnet
######## create subnet
resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.vpctf.id
  cidr_block = var.pubsubnetcidr
  availability_zone = var.pubaz
  tags = {
    Name = "Publicsubnet"
  }
}
######## associate to Public RT 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pubsubnet.id
  route_table_id = aws_route_table.pubRT.id
}
#### create private subnet 
####### create subnet

resource "aws_subnet" "prisubnet" {
  vpc_id     = aws_vpc.vpctf.id
  cidr_block = var.privsubnetcidr 
  availability_zone = var.privaz 
  tags = {
    Name = "Privatesubnet"
  }
}
######### associte to Private RT
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.prisubnet.id
  route_table_id = aws_route_table.priRT.id
}
##### security group 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpctf.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

