resource "aws_internet_gateway" "us_east_1_igw" {
  vpc_id = aws_vpc.ec2_us_east_1_vpc.id

  tags = {
    Name = "${local.project}-igw"
  }
}

resource "aws_internet_gateway" "us_east_2_igw" {
  provider = aws.us-east-2
  vpc_id = aws_vpc.ec2_us_east_2_vpc.id

  tags = {
    Name = "${local.project}-igw"
  }
}