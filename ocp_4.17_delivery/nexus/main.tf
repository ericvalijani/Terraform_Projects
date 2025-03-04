### Section for find free port ###
provider "null" {}

module "port_checker" {
  source     = "../modules/port_checker"
  start_port = var.start_port
  end_port   = var.end_port
  ssh_host   = var.ssh_host
}

data "local_file" "available_port" {
  filename   = "../modules/port_checker/available_port.txt"
  depends_on = [module.port_checker]
}

output "available_port" {
  value = data.local_file.available_port.content
}

###################################
### Section for Accessing Nexus ###
provider "nexus" {
  url      = "http://${var.ssh_host}:${var.ssh_host_port}"
  username = var.nexus_user
  password = var.nexus_pass
}

module "nexus_repository" {
  source      = "../modules/nexus_repository"
  projectname = var.project_name
  bs_quota    = var.bs_quota
  http_port   = tonumber(trimspace(data.local_file.available_port.content))
  depends_on  = [module.port_checker]
}

module "nginx_template" {
  source      = "../modules/nginx_template"
  projectname = var.project_name
  listen_port = tonumber(trimspace(data.local_file.available_port.content) + 1000)
  proxy_port  = tonumber(trimspace(data.local_file.available_port.content))
  server_name = var.ssh_host
  depends_on  = [module.nexus_repository]
}

module "upload_nginx_config" {
  source      = "../modules/upload_nginx_config"
  sourcefile  = "/tmp/${var.project_name}.conf"
  destination = "/etc/nginx/conf.d/${var.project_name}.conf"
  projectname = var.project_name
  ssh_host    = var.ssh_host
  remote_user = var.remote_user
  remote_pass = var.remote_pass
  depends_on  = [module.nginx_template]
}
