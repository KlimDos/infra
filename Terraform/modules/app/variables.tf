variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "app_disk_image" {
  description = "App disk image"
  default     = "reddit-app"
}

variable "path_to_deploy" {
  description = "path_to_deploy"
  default     = "../files/deploy.sh"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
  default = "~/.ssh/id_rsa"
}