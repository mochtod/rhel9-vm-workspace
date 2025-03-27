variable "quantity" {
  description = "Number of machines to create"
  type        = number
  default     = 1
}

module "rhel9_vm" {
  source = "./modules/machine"

  name             = var.name
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  num_cpus         = var.num_cpus
  memory           = var.memory
  guest_id         = var.guest_id
  network_id       = var.network_id
  adapter_type     = var.adapter_type
  disk_size        = var.disk_size
  template_uuid    = var.template_uuid
  ipv4_address     = var.ipv4_address
  ipv4_netmask     = var.ipv4_netmask
  ipv4_gateway     = var.ipv4_gateway
  dns_servers      = var.dns_servers
  time_zone        = var.time_zone
}

resource "vsphere_virtual_machine" "vm" {
  count = var.quantity

  name             = "${var.name}-${var.start_number + count.index}"
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  num_cpus         = var.num_cpus
  memory           = var.memory
  guest_id         = var.guest_id
  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }
  disk {
    label            = "disk0"
    size             = var.disk_size
    eagerly_scrub    = false
    thin_provisioned = true
  }

  dynamic "disk" {
    for_each = var.additional_disks
    content {
      label            = "disk${disk.key + 1}"
      size             = disk.value.size
      eagerly_scrub    = false
      thin_provisioned = disk.value.type == "thin"
    }
  }

  clone {
    template_uuid = var.template_uuid
  }

  custom_attributes = {
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "rhel9-template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "external" "next_ip" {
  program = ["python", "fetch_next_ip.py"]
  query = {
    range = "192.168.1.0/24"
    token