# datastora.tf

# terraform plan -target="libvirt_pool.datastore" -out=plan-datastore
# terraform apply "plan-datastore"

# Provision Storage
resource "libvirt_pool" "datastore" {
  name = var.dtap
  type = "dir"
  path = "${var.path}/${var.dtap}"
}


