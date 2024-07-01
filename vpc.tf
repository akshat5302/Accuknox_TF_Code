resource "aws_vpc" "ec2_us_east_1_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${local.project}-vpc"
  }

}

resource "aws_vpc" "ec2_us_east_2_vpc" {
  provider = aws.us-east-2
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${local.project}-vpc"
  }

}