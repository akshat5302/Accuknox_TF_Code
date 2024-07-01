resource "aws_instance" "instance1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = local.instance_type
  security_groups = [aws_security_group.instance1_sg.id]
  subnet_id     = aws_subnet.public-us-east-1a.id
  user_data     = <<-EOF
                     #!/bin/bash
                     apt-get update
                     apt-get install -y nginx
                     systemctl start nginx
                     systemctl enable nginx
                  EOF

  tags = {
    Name = "us-east-1a-instance"
  }
}

resource "aws_instance" "instance2" {
  provider      = aws.us-east-2 
  ami           = "ami-07d7e3e669718ab45"
  instance_type = local.instance_type
  security_groups = [aws_security_group.instance2_sg.id]
  subnet_id     = aws_subnet.public-us-east-2a.id 
  user_data     = <<-EOF
                     #!/bin/bash
                     apt-get update
                     apt-get install -y nginx
                     systemctl start nginx
                     systemctl enable nginx
                  EOF

  tags = {
    Name = "us-east-2a-instance"
  }
}