terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-2"
}

resource "aws_instance" "app_node" {
  ami           = "ami-0b2ed2e3df8cf9080"
  instance_type = "t2.micro"
  key_name = "uthmanakz"
  vpc_security_group_ids = [aws_security_group.sg.id] 

  tags = {
    Name = var.node_name
  }
}

resource "aws_security_group" "sg" {


  ingress {
    from_port       = 22
    to_port         = 22
    cidr_blocks      = ["0.0.0.0/0"]
    protocol        = "tcp"
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    cidr_blocks      = ["0.0.0.0/0"]
    protocol        = "-1"
  }


}
variable "node_name" {}

output "public_dns" {
  value = aws_instance.app_node.public_dns
}

