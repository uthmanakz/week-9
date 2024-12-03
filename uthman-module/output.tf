output "python_sg_id" {
  value = aws_security_group.python_sg.id
}

output "nginx_sg_id" {
  value = aws_security_group.nginx_sg.id
}

output "public_dns" {
  value = aws_instance.app_node.public_dns
}