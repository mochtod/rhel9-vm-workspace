# RHEL 9 VM Workspace

This repository contains Terraform configurations to create a Red Hat Enterprise Linux 9 virtual machine on VMware vSphere.

## Project Structure

- **atlantis.cfg**: Configuration file for Atlantis specifying the Terraform version.
- **backend.tf**: Defines the backend configuration for Terraform, currently set to use VMware ESXi/vCenter.
- **data.tf**: Contains data source definitions and local variables for the project.
- **providers.tf**: Specifies the required providers, including VMware and Vault.
- **machine.tf**: Contains the Terraform configuration to create a RHEL 9 virtual machine on VMware.
- **README.md**: Documentation for the project.

## Prerequisites

- Terraform installed on your local machine.
- Access to a VMware ESXi/vCenter environment.
- Atlantis configured for managing Terraform workflows.

## Default SSH Login Credentials

- **Username**: centos
- **Password**: centos

## How to Use

1. **Set Up Variables**:
   - Create a `terraform.tfvars` file with the following variables:
     ```hcl
     vsphere_user     = "your-username"
     vsphere_password = "your-password"
     vsphere_server   = "your-vcenter-server"
     ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

5. **Verify the VM**:
   - Log in to the VM using the provided IP address and credentials.

## Modules

The `machine` module simplifies the creation of virtual machines. Users only need to provide basic inputs in `hostname.tf`.

## Atlantis Integration

This repository is compatible with Atlantis for managing Terraform workflows.

## Useful Features of the VMware Provider

- Manage VM lifecycle (create, update, delete).
- Configure networking and storage directly from Terraform.
- Support for VM templates and cloning.
- Ability to manage resource pools and datastores.

For more information on the VMware provider, refer to the [Terraform VMware Provider Documentation](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs).