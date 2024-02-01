# modules/nginx_container/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "local_file" "html_file" {
  content  = templatefile("${path.module}/data/index.html.tpl", { person_name = var.person_name })
  filename = "${path.module}/html/index.html"
}

resource "docker_image" "nginx" {
  name         = "${var.nginx_image}:${var.nginx_version}"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "web-${var.web_container_name}"
  ports {
    internal = 80
    external = 8080
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "${dirname(abspath(local_file.html_file.filename))}"
    read_only      = true
  }
}
