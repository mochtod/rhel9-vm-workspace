variable "vsphere_user" {
  default = "default_user"
}

variable "vsphere_password" {
  default = "default_password"
}

variable "vsphere_server" {
  default = "default_server"
}

variable "hostname_prefix" {
  description = "Prefix for the server hostname"
  type        = string
}

variable "server_count" {
  description = "Number of servers to create"
  type        = number
}

variable "netbox_token" {
  description = "Token for NetBox API"
  type        = string
  sensitive   = true
}