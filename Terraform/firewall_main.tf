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
