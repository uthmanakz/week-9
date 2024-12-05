/* output "nginx_dns" {
    value = module.nginx.public_dns
} 

output "python1_dns" {
    value = module.python1.public_dns
}

output "python2_dns" {
    value = module.python2.public_dns
}

output "nginx_sg_id1" {
    value = module.nginx.nginx_sg_id
} */




output "NGINX_SG_ID" {
  value = aws_security_group.nginx_sg.id
}

output "NGINX1_PUBLIC_DNS" {
    value = module.nginx1.public_dns
}

output "PYTHON2_PUBLIC_DNS" {
    value = module.python2.public_dns
}

output "PYTHON1_PUBLIC_DNS" {
    value = module.python1.public_dns
}

output "NGINX1_PUBLIC_IP" {
    value = module.nginx1.public_ip 
}
