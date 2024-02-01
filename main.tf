# main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "nginx_container" {
  source             = "./modules/nginx_container"
  nginx_image        = "nginx"
  nginx_version      = "latest"
  web_container_name = var.web_container_name
}

module "mariadb_container" {
  source = "./modules/mariadb_container"

  mariadb_image     = "mariadb"
  mariadb_version   = "latest"
  db_container_name = var.db_container_name
  db_root_password = var.db_root_password
}

