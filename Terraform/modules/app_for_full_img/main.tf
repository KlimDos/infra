resource "google_compute_instance" "app" {
  name         = "reddit-app-all-in-from-full"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]

  #old fashen style of deploy the fresh application code
  #metadata_startup_script = "${file("../deploy.sh")}"
  metadata {
    sshKeys = "aalimov:${file(var.public_key_path)}"
    
  }

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

}
resource "google_compute_address" "app_ip" {
  name         = "reddit-app-ip"
  network_tier = "STANDARD"
}
