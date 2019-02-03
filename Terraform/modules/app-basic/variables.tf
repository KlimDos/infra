variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "app_disk_image" {
  description = "App disk image"
  default     = "reddit-app-basic"
}

variable "tags_list" {
  description = "for reddit app use reddit-app\",\"http-server\", prometheus9090 " 
  type = "list"
}
