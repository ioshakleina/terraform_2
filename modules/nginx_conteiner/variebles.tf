# modules/mariadb_container/variables.tf

variable "web_container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "nginx"
}

variable "nginx_image" {
  description = "The name of the Docker image for Nginx"
  type        = string
  default     = "nginx"
}

variable "nginx_version" {
  description = "The version of the Docker image for Nginx"
  type        = string
  default     = "latest"
}

variable "person_name" {
  description = "A person name for html context"
  type        = string
  default     = "Joe Shmoe"
}
