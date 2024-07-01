resource "aws_security_group" "instance1_sg" {
  name        = "instance1-sg"
  description = "Security group for instance1 in us-east-1"

  vpc_id = aws_vpc.ec2_us_east_1_vpc.id

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

resource "aws_security_group" "instance2_sg" {
  name        = "instance2-sg"
  description = "Security group for instance2 in us-east-2"
  provider = aws.us-east-2

  vpc_id = aws_vpc.ec2_us_east_2_vpc.id

  # Inbound rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}