# vSphere Connection Variables
variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
}

variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "allow_unverified_ssl" {
  description = "Allow unverified SSL certificates"
  type        = bool
  default     = false
}

# vSphere Infrastructure Variables
variable "datacenter_name" {
  description = "Name of the vSphere datacenter"
  type        = string
}

variable "cluster_name" {
  description = "Name of the vSphere cluster"
  type        = string
}

variable "datastore_name" {
  description = "Name of the vSphere datastore"
  type        = string
}

variable "network_name" {
  description = "Name of the vSphere network"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone from"
  type        = string
}

variable "resource_pool_name" {
  description = "Name of the resource pool"
  type        = string
  default     = ""
}

variable "vm_folder" {
  description = "vSphere folder to place the VM"
  type        = string
  default     = ""
}

# VM Configuration Variables
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "instance_type" {
  description = "Instance type/size identifier"
  type        = string
  default     = "small"
}

variable "num_cpus" {
  description = "Number of CPUs for the VM"
  type        = number
  default     = 2
}

variable "memory_mb" {
  description = "Memory in MB for the VM"
  type        = number
  default     = 4096
}

variable "disk_size_gb" {
  description = "Size of the primary disk in GB"
  type        = number
  default     = 50
}

# Network Configuration Variables
variable "ipv4_address" {
  description = "IPv4 address for the VM"
  type        = string
}

variable "ipv4_netmask" {
  description = "IPv4 netmask (e.g., 24 for /24)"
  type        = number
  default     = 24
}

variable "ipv4_gateway" {
  description = "IPv4 gateway address"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the VM"
  type        = string
  default     = "local"
}

# Metadata Variables
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "github-actions-demo"
} 