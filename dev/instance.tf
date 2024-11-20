module "nginx" {
source = "../uthman-module"
node_name = "nginx"

}

module "python" {
source = "../uthman-module"
node_name = "python"

}