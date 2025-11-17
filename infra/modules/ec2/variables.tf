variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "ami_id" {
  type = string
}

variable "security_group_name" {
  type = string
  default = "securitygroup"
}

variable "docker_image" {
  type = string
}