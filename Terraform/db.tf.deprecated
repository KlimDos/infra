resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-db"]

  #old fashen style of deploy the fresh application code
  #metadata_startup_script = "${file("../deploy.sh")}"
  metadata {
    sshKeys = "aalimov:${file(var.public_key_path)}"
  }

  # определение загрузочного диска2
  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
  }
}