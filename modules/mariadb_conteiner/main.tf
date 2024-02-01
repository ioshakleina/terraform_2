# modules/mariadb_container/main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "mariadb" {
  name         = "${var.mariadb_image}:${var.mariadb_version}"
  keep_locally = true
}

resource "docker_container" "mariadb" {
  image = docker_image.mariadb.image_id
  name  = "db-${var.db_container_name}"
  ports {
    internal = 3306
    external = 3306
  }
  env = ["MARIADB_ROOT_PASSWORD=${var.db_root_password}"]
}
