output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_private_ip" {
  description = "The private IP address of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "vm_public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "vm_dns_name" {
  description = "The DNS name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "vm_username" {
  description = "The username of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.admin_username
}

output "vm_size" {
  description = "The size of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.size
}

output "vm_os_disk" {
  description = "The OS disk of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.os_disk
}

output "vm_source_image" {
  description = "The source image of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.source_image_reference
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = var.resource_group_name
}

output "location" {
  description = "The location of the resources"
  value       = var.location
}

output "storage_account_name" {
  description = "The name of the storage account for boot diagnostics"
  value       = azurerm_storage_account.boot_diagnostics.name
}

output "storage_account_id" {
  description = "The ID of the storage account for boot diagnostics"
  value       = azurerm_storage_account.boot_diagnostics.id
}

output "admin_username" {
  description = "The admin username of the Virtual Machine"
  value       = var.admin_username
  sensitive   = true
}

output "vm2_id" {
  description = "The ID of the second Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm2_name" {
  description = "The name of the second Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm2_private_ip" {
  description = "The private IP address of the second Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "vm2_public_ip" {
  description = "The public IP address of the second Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
} 