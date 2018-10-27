provider "google" {
  project = "infra-220716"
  region = "europe-west1"
}
resource "google_compute_instance" "app" {
name = "reddit-app"
machine_type = "g1-small"
zone = "europe-west1-b"
tags = ["puma-server"]
metadata_startup_script = "${file("../deploy.sh")}"
metadata {
    sshKeys = "aalimov:${file("~/.ssh/id_rsa.pub")}" 
    }
# определение загрузочного диска
boot_disk {
    initialize_params {
        image = "reddit-base-1540660523"
        }
    }
# определение сетевого интерфейса
network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {}
    }

}