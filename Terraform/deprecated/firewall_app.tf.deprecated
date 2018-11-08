resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
  network_tier = "STANDARD"
}
resource "google_compute_firewall" "reddit-app" {
  name    = "reddit-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  target_tags   = ["reddit-app"]
  source_ranges = ["0.0.0.0/0"]
}