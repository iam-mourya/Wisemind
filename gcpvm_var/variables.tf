variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy the VM"
  type        = string
  default     = "us-central1-f"
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "The image to use for the boot disk"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "tags" {
  description = "Tags for the VM instance"
  type        = list(string)
  default     = ["http-server", "https-server"]
}

