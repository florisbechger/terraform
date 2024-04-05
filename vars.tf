# vars.tf

# variable "user" {}
# variable "password" {}

# Provision Environment

variable "dtap" {
  default = "dev"
}

# Provision Bridged network

variable "net_mode" {
  default = "bridge"
}
variable "net_bridge" {
  default = "br1"
}
variable "net_cidr" {
  default = "192.168.0.0/24"
}
variable "net_gateway" {
  default = "192.168.0.1"
}
variable "net_dns" {
  default = "1.1.1.1"
}
variable "net_dhcp" {
  default = true
}
variable "net_autostart" {
  default = "true"
}

# Provision Machine

variable "name" {
  default = "bookworm"
}
variable "vm_count" {
  default = 1
}
variable "start_number" {
  default = 1
}
variable "vcpu" {
  default = "2"
}
variable "memory" {
  default = "2048"
}
variable "agent" {
  default = "false"
}
variable "running" {
  default = "true"
}
variable "autostart" {
  default = "true"
}

# Provision Disk

variable "resource" {
  # default = "/home/[username]/Downloads"
  # default = "https://cloud.debian.org/images/cloud/bullseye/latest" # Debian 11 download
  default = "https://cloud.debian.org/images/cloud/bookworm/latest" # Debian 12 download
  # default = "wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd" # Debian download
}
variable "image" {
  # default = "debian-11-generic-amd64.qcow2"
  default = "debian-12-generic-amd64.qcow2"
  # default = "debian-12.0.0-amd64-netinst.iso"
}
variable "path" {
  default = "/var/lib/libvirt/images"
}
variable "extension" {
  default = "qcow2"
}
