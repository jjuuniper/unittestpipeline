variable "image_build" {
  type = string
  description = "latest build version"
}

variable "iac_resource_group" {
  type = string
  default = "rg_juuniper_webapp"
}

variable "iac_linux_web_app" {
  default = "juunipertesttfwebapp"
}

variable "iac_docker_image" {
  default = "juuniper/mywebapp"
}