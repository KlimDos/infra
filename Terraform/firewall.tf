resource "google_compute_firewall" "puma9292" {
  name    = "puma9292"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  target_tags   = ["puma-server"]
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "firewall_ssh" {
  name    = "default-allow-ssh"
  network = "default"
  description = "Allow SSH to the instance from anywhere"
  allow {
     protocol = "tcp"
     ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  #  source_tags = ["puma-server"]
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
  network_tier = "STANDARD"
}
