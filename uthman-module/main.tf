resource "aws_instance" "app_node" {
  ami                    = "ami-0b2ed2e3df8cf9080"
  instance_type          = "t2.micro"
  key_name               = "uthmanakz"
  vpc_security_group_ids = var.sg_id

  tags = {
    Name = var.node_name
  }
}


