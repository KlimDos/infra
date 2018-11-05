provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["puma-server"]

  #old fashen style of deploy the fresh application code
  #metadata_startup_script = "${file("../deploy.sh")}"
  metadata {
    sshKeys = "aalimov:${file(var.public_key_path)}"
  }

  # определение загрузочного диска2
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }

  connection {
    type        = "ssh"
    user        = "aalimov"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  #change this, deploy script shoul creates this file db_config
  provisioner "file" {
    source      = "files/db_config"
    destination = "/home/aalimov/db_config"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
