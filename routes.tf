resource "aws_route_table" "us_east_1a_public" {
  vpc_id = aws_vpc.ec2_us_east_1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east_1_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "us_east_2a_public" {
  provider = aws.us-east-2
  vpc_id = aws_vpc.ec2_us_east_2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east_2_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}



resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.us_east_1a_public.id
}

resource "aws_route_table_association" "public-us-east-2a" {
  provider = aws.us-east-2
  subnet_id      = aws_subnet.public-us-east-2a.id
  route_table_id = aws_route_table.us_east_2a_public.id
}