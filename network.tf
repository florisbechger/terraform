# network.tf

# terraform plan -target="libvirt_network.cidr" -out=plan-network
# terraform apply "plan-network"

# Provision Bridged network
resource "libvirt_network" "cidr" {
  name      = var.dtap
  mode      = var.net_mode
  bridge    = var.net_bridge
  addresses = [var.net_cidr]
  autostart = var.net_autostart
  dhcp {
    enabled = var.net_dhcp
  }

  /*
  routes {
    cidr    = var.net_cidr
    gateway = var.net_gateway
  }
  dns {
    enabled    = true
    local_only = true
    forwarders {
      address = var.net_dns
    }
  }
*/

}
