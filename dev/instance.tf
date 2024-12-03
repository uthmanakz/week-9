module "nginx" {
source = "../uthman-module"
node_name = "nginx"
vpc_sg_id = module.nginx.nginx_sg_id
nginx_sg_name = "nginx_sg_name0"
python_sg_name = "python_sg_3"


}

module "python1" {
source = "../uthman-module"
node_name = "python1"
nginx_sg_name = "nginx_sg_1"
python_sg_name = "python_sg_1"
vpc_sg_id = module.python1.python_sg_id

}

module "python2" {
source = "../uthman-module"
node_name = "python2"
nginx_sg_name = "nginx_sg_name2"
python_sg_name = "python_sg_2"
vpc_sg_id = module.python2.python_sg_id

}