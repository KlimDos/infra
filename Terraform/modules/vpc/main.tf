resource "google_compute_firewall" "reddit-db" {
  name    = "reddit-db"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags   = ["reddit-db"]
  source_tags = ["reddit-app"]
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