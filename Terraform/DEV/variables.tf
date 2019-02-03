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

variable "app_disk_image" {
  description = "App disk image"
  default     = "reddit-app-basic"
}

variable "db_disk_image" {
  description = "Data Base disk image"
  default     = "reddit-db"
}

variable "creds" {
  default = "/home/sasha/Desktop/gcp-creds/infra-c700d8575b91.json"
  }

variable "wdev" {
  description = "0 for centos-7 clean / 1 for reddit app"
}
variable "tags_list" {
  #type="list"
}
