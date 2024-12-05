
provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "python_sg" {

  name = "PYTHON_SG"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 65432
    to_port     = 65432
    protocol    = "tcp"
    security_groups = [aws_security_group.nginx_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }


}
module "python1" {
    source = "../uthman-module"
    node_name = "PYTHON_NODE1"
    sg_id = [aws_security_group.python_sg.id]

}



module "python2" {
    source = "../uthman-module"
    node_name = "PYTHON_NODE2"
    sg_id = [aws_security_group.python_sg.id]

}

resource "aws_security_group" "nginx_sg" {

  name = "NGINX_SG"


  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }


}

module "nginx1" {
    source = "../uthman-module"
    node_name = "NGINX_NODE"
    sg_id = [aws_security_group.nginx_sg.id]

}

resource "aws_route53_record" "domain_name" {
  zone_id = "Z027624519PFOMPX9KS5H"
  name    = "bobisouruncle.com"
  type    = "A"
  ttl     = 300
  records = [module.nginx1.public_ip]
}



