terraform {
  backend "gcs" {
    credentials = "infra-c700d8575b91.json"
    bucket  = "aalimov-tf-state"
    prefix  = "terraform/staging/state"    
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  credentials = "${var.creds}"
}

data "google_compute_image" "my_image" {
  family    = "centos-7"
  project = "centos-cloud"
}

module "app" {
  source = "../modules/app-basic"
  public_key_path = "${var.public_key_path}"
  app_disk_image = "${var.wdev == true ? var.app_disk_image : data.google_compute_image.my_image.self_link}" 
  tags_list = ["${var.tags_list}"]
}

#module "db" {
#  source = "../modules/db"
#  public_key_path = "${var.public_key_path}"
#  db_disk_image = "${var.db_disk_image}" 
#}

module "vpc" {
  source = "../modules/vpc"  
}
