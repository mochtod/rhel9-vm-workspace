module "rhel9_vm" {
  source = "./modules/machine"

  name             = "rhel9-vm"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  network_id       = data.vsphere_network.network.id
  adapter_type     = "vmxnet3"
  disk_size        = 20
  template_uuid    = data.vsphere_virtual_machine.template.id
  ipv4_address     = "192.168.1.100"
  ipv4_netmask     = 24
  ipv4_gateway     = "192.168.1.1"
  dns_servers      = ["8.8.8.8", "8.8.4.4"]
  time_zone        = "UTC"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
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