# main.tf

terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.1"
    }
  }
  required_version = ">= 0.13.4"
  backend "local" { path = "./terraform.tfstate" }
}

# Configure and use this provider
provider "libvirt" {
  uri = "qemu:///system"
}

