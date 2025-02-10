resource "aws_instance" "web" {
  ami             = "ami-12345678"  # Replace with a valid AMI
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public[0].id
  security_groups = [aws_security_group.web.name]
  user_data       = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y nginx
                systemctl start nginx
                systemctl enable nginx
                EOF
}