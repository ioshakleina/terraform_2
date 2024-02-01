# variables.tf

variable "web_container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "nginx"
}

variable "db_container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "MariaDB"
}

variable "db_root_password" {
  description = "Password for MariaDB server"
  type        = string
  default     = "root"
}
