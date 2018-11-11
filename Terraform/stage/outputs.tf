output "app_external_ip" {
  #value = "${google_compute_instance.app.network_interface.0.access_config.0.nat_ip}"
  value = "${module.app.app_external_ip}"
}

/*output "db_local_ip" {
  value = "${module.db.db_internal_ip}"
}*/
