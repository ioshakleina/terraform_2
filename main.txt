# main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "nginx_container"
  image = docker_image.nginx.image_id
  
  ports {
    internal = 80
    external = 8080
  }

  command = ["nginx", "-g", "daemon off;"]
 
  env = [
    "NGINX_V=My First and Lastname: ${var.first_and_lastname}",  
  ]

# provisioner "local-exec" {
   # command = "sleep 15 && curl -s 127.0.0.1:8080 | grep -q 'My First and Lastname: John Snow'"
 #  }
}

# container MariaDB
resource "docker_container" "mariadb_container" {
  name  = "mariadb_container"
  image = "mariadb:latest"

  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${var.db_root_password}",
  ]
}

# password
variable "db_root_password" {
  type        = string
  default = "passexample"
}

variable "first_and_lastname" {
  type        = string
  default = "John Snow"
}
