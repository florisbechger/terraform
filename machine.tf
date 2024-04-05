# machine.tf

# terraform plan -target="libvirt_domain.machine" -out=plan-machine
# terraform apply "plan-machine"

# Provision Disk
resource "libvirt_volume" "disk" {
  count  = var.vm_count
  name   = format("${var.dtap}-${var.name}%02d.qcow2", count.index + var.start_number)
  pool   = var.dtap
  source = "${var.resource}/${var.image}"
  format = var.extension
}

# Provision Machine
resource "libvirt_domain" "machine" {
  count      = var.vm_count
  name       = format("${var.dtap}-${var.name}%02d", count.index + var.start_number)
  vcpu       = var.vcpu
  memory     = var.memory
  qemu_agent = var.agent
  running    = var.running
  autostart  = var.autostart

  #  provisioner "local-exec" {
  #    command = "sudo hostnamectl set-hostname change-me"
  #  }

  disk {
    volume_id = element(libvirt_volume.disk[*].id, count.index)
  }

  network_interface {
    hostname       = format("${var.dtap}-${var.name}%02d", count.index + var.start_number)
    network_name   = var.dtap
    network_id     = libvirt_network.cidr.id
    wait_for_lease = true
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

}

output "ip_addresses" {
  value = libvirt_domain.machine[*].network_interface[0].addresses[0]
}
output "names" {
  value = libvirt_domain.machine[*].name
}

