# modules/mariadb_container/variables.tf

variable "db_container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "MariaDB"
}

variable "mariadb_image" {
  description = "The name of the Docker image for MariaDB"
  type        = string
  default     = "mariadb"
}

variable "mariadb_version" {
  description = "The version of the Docker image for MariaDB"
  type        = string
  default     = "latest"
}

variable "db_root_password" {
  description = "Password for MariaDB server"
  type        = string
}
