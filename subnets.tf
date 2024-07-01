resource "aws_subnet" "public-us-east-1a" {
  vpc_id            = aws_vpc.ec2_us_east_1_vpc.id
  cidr_block        = "10.0.1.0/24"
  
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name"                                   = "public-us-east-1a"
    "Type"                                   = "public"
  }
}

resource "aws_subnet" "public-us-east-2a" {
  provider          = aws.us-east-2
  vpc_id            = aws_vpc.ec2_us_east_2_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    "Name"                                   = "public-us-east-2a"
    "Type"                                   = "public"
  }
}