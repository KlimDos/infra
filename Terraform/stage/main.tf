terraform {
  backend "gcs" {
    credentials = "infra-c700d8575b91.json"
    bucket  = "aalimov-tf-state"
    prefix  = "terraform/staging/state"
    #credentials = "${file("infra-c700d8575b91.json")}"
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  credentials = "${var.creds}"
}


module "app" {
  source = "../modules/app-basic"
  public_key_path = "${var.public_key_path}"
  app_disk_image = "${var.app_disk_image}"  
}

module "db" {
  source = "../modules/db"
  public_key_path = "${var.public_key_path}"
  db_disk_image = "${var.db_disk_image}" 
}

module "vpc" {
  source = "../modules/vpc"  
}
