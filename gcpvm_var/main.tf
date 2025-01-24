# Configure the Google Cloud provider
provider "google" {
  project = var.project
  region  = var.region
}

# Define a Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  count        = 1 # Number of instances to create
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  # Define the boot disk and initialize it with an image
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  # Define the network interface
  network_interface {
    network = "default"
    access_config {
    }
  }

  # Add tags for the instance
  tags = var.tags
}

# Optional: Additional settings, like a firewall rule for HTTP/HTTPS
resource "google_compute_firewall" "default" {
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = var.tags
  source_ranges = ["0.0.0.0/0"]
}

