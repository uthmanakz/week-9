provider "aws" {
  region  = "eu-west-2"
}

resource "aws_instance" "app_node" {
  ami           = "ami-0b2ed2e3df8cf9080"
  instance_type = "t2.micro"
  key_name = "uthmanakz"
  vpc_security_group_ids = [var.vpc_sg_id]

  tags = {
    Name = var.node_name
  }
}



resource "aws_security_group" "python_sg" {

  name = var.python_sg_name


  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.nginx_sg.id]
  }

  ingress {
    from_port       = 65432
    to_port         = 65432
    protocol        = "tcp"
    security_groups = [aws_security_group.nginx_sg.id]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    cidr_blocks      = ["0.0.0.0/0"]
    protocol        = "-1"
  }


}


resource "aws_security_group" "nginx_sg" {

  name = var.nginx_sg_name


  ingress {
    from_port       = 22
    to_port         = 22
    cidr_blocks      = ["0.0.0.0/0"]
    protocol        = "tcp"
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
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


