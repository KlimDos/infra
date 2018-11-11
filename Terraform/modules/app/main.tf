resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]

  #old fashen style of deploy the fresh application code
  #metadata_startup_script = "${file("../deploy.sh")}"
  metadata {
    sshKeys = "aalimov:${file(var.public_key_path)}"
    
  }

    metadata_startup_script = "${file(var.path_to_deploy)}"


  # определение загрузочного диска2
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {
      network_tier = "STANDARD"
      nat_ip       = "${google_compute_address.app_ip.address}"
    }
  }
connection {
    type = "ssh"
    user = "aalimov"
    agent = false
    private_key = "${file("~/.ssh/id_rsa")}"
}
provisioner "file"{
    source = "../files/puma.service"
    destination = "/tmp/puma.service"
}
  provisioner "file" {
    source      = "../files/db_config"
    destination = "/home/aalimov/db_config"
  }
}
resource "google_compute_address" "app_ip" {
  name         = "reddit-app-ip"
  network_tier = "STANDARD"
}
