terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.0"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = var.allow_unverified_ssl
}

# Data sources for vSphere resources
data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Create VM from template
resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vm_folder

  num_cpus = var.num_cpus
  memory   = var.memory_mb
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = var.disk_size_gb
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vm_name
        domain    = var.domain_name
      }

      network_interface {
        ipv4_address = var.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }

      ipv4_gateway = var.ipv4_gateway
    }
  }

  extra_config = {
    "guestinfo.metadata" = base64encode(jsonencode({
      instance_type = var.instance_type
      environment   = var.environment
      project       = var.project
      created_by    = "GitHub Actions"
      created_at    = timestamp()
    }))
  }

  tags = [
    vsphere_tag.environment.id,
    vsphere_tag.project.id
  ]
}

# Create tags if they don't exist
resource "vsphere_tag_category" "category" {
  name        = "github-actions"
  description = "Tags created by GitHub Actions"
  cardinality = "MULTIPLE"

  associable_types = [
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "environment" {
  name        = var.environment
  category_id = vsphere_tag_category.category.id
}

resource "vsphere_tag" "project" {
  name        = var.project
  category_id = vsphere_tag_category.category.id
} 