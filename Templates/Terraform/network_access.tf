resource "aws_security_group" "allow_all_ssh" {
  name          = "allow_all_ssh"
  description   = "Allow inbound SSH traffic from ALL"
  vpc_id        = aws_vpc.main.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.source_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "Ingress Rule for SSH"
  }
}
