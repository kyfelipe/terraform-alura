provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count                  = 3
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "terraform-aws"
  vpc_security_group_ids = ["sg-08756969e6e8f31f2"]
  
  tags = {
    Name = "dev${count.index}"
  }
}

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

