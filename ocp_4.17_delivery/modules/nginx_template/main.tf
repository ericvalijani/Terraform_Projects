data "template_file" "nginx_config" {
  template = file("/opt/terraform/modules/nginx_template/nginx.conf.tpl")

  vars = {
    listen_port = var.listen_port
    proxy_port  = var.proxy_port
  }
}

resource "local_file" "nginx_config" {
  content  = data.template_file.nginx_config.rendered
  filename = "/tmp/${var.projectname}.conf"
}
