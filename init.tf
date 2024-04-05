# init.tf

data "template_file" "user_data" {
  template = file("cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool      = var.dtap
}
