resource "aws_vpc" "main" {
  cidr_block       = var.cidr 
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "Network"
  }
}