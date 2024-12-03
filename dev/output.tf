output "nginx_dns" {
    value = module.nginx.public_dns
}

output "python1_dns" {
    value = module.python1.public_dns
}

output "python2_dns" {
    value = module.python2.public_dns
}