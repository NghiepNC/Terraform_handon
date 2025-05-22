output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vm_vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.vm_subnet.id
}

output "public_ip_address" {
  description = "The public IP address"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "network_interface_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.vm_nic.id
}

output "network_security_group_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.vm_nsg.id
} 