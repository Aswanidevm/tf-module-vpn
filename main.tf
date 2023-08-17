resource "aws_vpc" "main" {
  enable_dns_support = true
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    tags = merge ({ Name = "${var.env}-vpc"}, var.tags )
  }
}

resource "aws_subnet" "main" {
  count = length(var.web_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  web_subnet_cidr_block = element(var.web_subnet_cidr_block, count.index)

  tags = {
    Name = "Main"
  }
}