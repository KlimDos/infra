resource "google_compute_firewall" "default" {
  name    = "puma9292"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  target_tags   = ["puma-server"]
  source_ranges = ["0.0.0.0/0"]

  # allow {
  #   protocol = "tcp"
  #   ports    = ["80", "8080", "1000-2000"]
  # }

  #  source_tags = ["puma-server"]
}
