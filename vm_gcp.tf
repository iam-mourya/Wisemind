provider "google" {
  project = "terraform-2100"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  count        = 2
  name         = "test-instance-${count.index + 1}"
  machine_type = "e2-medium" # Choose the machine type based on your requirements
  zone         = "us-central1-f" # Choose the zone based on your region
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts" # Specify the image for the boot disk
    }
  }
  
  network_interface {
    network = "default" # Specify the network to attach the interface to
    access_config {
    }
  }
  
  tags = ["web", "dev"] # Specify any tags for the instance
}

