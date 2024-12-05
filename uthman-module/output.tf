output "public_dns" {
    value = aws_instance.app_node.public_dns
}

output "public_ip" {
    value = aws_instance.app_node.public_ip
}