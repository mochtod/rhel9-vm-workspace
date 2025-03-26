terraform {
  backend "vsphere" {
    user           = "mochtodpa"
    password       = "your_password_here"
    vsphere_server = "your_vcenter_server"

    # If you have a self-signed cert
    allow_unverified_ssl = true

    # Define the data store and other configurations as needed
    datastore = "your_datastore"
    default_datastore = "your_default_datastore"
  }
}