output "nginx_dns" {
    value = module.nginx.public_dns
}

output "python_dns" {
    value = module.python.public_dns
}