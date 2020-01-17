resource "aws_security_group" "access-ssh" {
  name        = "access-ssh"
  description = "access-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["201.59.53.171/32"]
  }

  tags = {
    Name = "ssh"  
  }
}