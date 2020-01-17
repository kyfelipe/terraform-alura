provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count                  = 3
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "terraform-aws"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]
  
  tags = {
    Name = "dev${count.index}"
  }
}

resource "aws_instance" "dev4" {
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "terraform-aws"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]

  tags = {
    Name = "dev4"
  }
}

resource "aws_instance" "dev5" {
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "terraform-aws"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]

  tags = {
    Name = "dev5"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "felipe-dev4"
  acl    = "private"

  tags = {
    Name = "felipe-dev4"
  }
}

