variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Password for the VM"
  type        = string
  sensitive   = true
}

variable "os_version" {
  description = "OS version"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the Network Interface"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for VM authentication"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
} 