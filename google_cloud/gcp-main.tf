#Setup the GCP provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
  project     = var.gcp_project
  credentials = file(var.gcp_auth_file)
  region      = var.gcp_region
  zone        = var.gcp_zone
}



#Firewall allow http
resource "google_compute_firewall" "gcp-allow-http" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-http"
  network = "default"


  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http", "http-server"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}


#Define bootstrap file
data "template_file" "metadata_startup_script" {
  template = file("gcp-user-data.sh")
}

#Create VM for web server
resource "google_compute_instance" "gpc-web-server" {
  name         = "${var.app_name}-${var.app_environment}-web-server"
  machine_type = "f1-micro"
  zone         = var.gcp_zone
  tags         = ["http-server", "gcp-allow-http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  metadata_startup_script = data.template_file.metadata_startup_script.rendered

  metadata = {
    enable-oslogin = "TRUE",
  }


  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }

}
