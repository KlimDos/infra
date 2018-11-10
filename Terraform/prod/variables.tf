variable "project" {
  description = "Project ID"
  default     = "infra-220716"
}

variable "region" {
  description = "Region"
  default     = "europe-west1"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
  default = "~/.ssh/id_rsa"
}

variable "app_disk_image" {
  description = "App disk image"
  default     = "reddit-app"
}

variable "db_disk_image" {
  description = "Data Base disk image"
  default     = "reddit-db"
}