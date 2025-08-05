output "vm_id" {
  description = "ID of the created virtual machine"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "Name of the created virtual machine"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_uuid" {
  description = "UUID of the created virtual machine"
  value       = vsphere_virtual_machine.vm.uuid
}

output "vm_guest_id" {
  description = "Guest ID of the virtual machine"
  value       = vsphere_virtual_machine.vm.guest_id
}

output "vm_num_cpus" {
  description = "Number of CPUs allocated to the VM"
  value       = vsphere_virtual_machine.vm.num_cpus
}

output "vm_memory" {
  description = "Memory allocated to the VM in MB"
  value       = vsphere_virtual_machine.vm.memory
}

output "vm_ip_address" {
  description = "IP address of the virtual machine"
  value       = vsphere_virtual_machine.vm.guest_ip_addresses
}

output "vm_power_state" {
  description = "Power state of the virtual machine"
  value       = vsphere_virtual_machine.vm.power_state
}

output "vm_folder" {
  description = "Folder where the VM is located"
  value       = vsphere_virtual_machine.vm.folder
}

output "vm_resource_pool_id" {
  description = "Resource pool ID where the VM is deployed"
  value       = vsphere_virtual_machine.vm.resource_pool_id
}

output "vm_datastore_id" {
  description = "Datastore ID where the VM is stored"
  value       = vsphere_virtual_machine.vm.datastore_id
}

output "vm_network_interface" {
  description = "Network interface information"
  value       = vsphere_virtual_machine.vm.network_interface
}

output "vm_disk" {
  description = "Disk information"
  value       = vsphere_virtual_machine.vm.disk
}

output "vm_tags" {
  description = "Tags applied to the VM"
  value       = vsphere_virtual_machine.vm.tags
} 