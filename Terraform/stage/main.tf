terraform {
  backend "gcs" {
    bucket  = "aalimov-tf-state"
    prefix  = "terraform/staging/state"
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}


module "app_for_full_img" {
  source = "../modules/app_for_full_img"
  public_key_path = "${var.public_key_path}"
  app_disk_image = "${var.app_disk_image}"  
}

/*module "db" {
  source = "../modules/db"
  public_key_path = "${var.public_key_path}"
  db_disk_image = "${var.db_disk_image}" 
}*/

module "vpc" {
  source = "../modules/vpc"  
}