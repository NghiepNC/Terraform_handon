variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-yamaha-demo"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vm-demo-001"
}

variable "admin_username" {
  description = "Username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
  default     = "pip-vm-demo-001"
}

variable "dns_label_prefix" {
  description = "DNS label prefix for the public IP"
  type        = string
  default     = "vm-demo-001"
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "nsg-vm-demo-001"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet-vm-demo-001"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "snet-vm-demo-001"
}

variable "nic_name" {
  description = "Name of the network interface"
  type        = string
  default     = "nic-vm-demo-001"
}

variable "os_version" {
  description = "OS version"
  type        = string
  default     = "18.04-LTS"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "VM Demo"
  }
}

variable "my_ip" {
  description = "Your IP address to allow SSH access"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for VM authentication"
  type        = string
  default     = null
}

variable "vm2_name" {
  description = "Name of the second virtual machine"
  type        = string
  default     = "vm-server-002"
}

variable "vm2_size" {
  description = "Size of the second virtual machine"
  type        = string
  default     = "Standard_B4ms"
}

variable "vm2_admin_username" {
  description = "Username for the second VM"
  type        = string
  default     = "azureuser"
}

variable "vm2_admin_password" {
  description = "Password for the second VM"
  type        = string
  sensitive   = true
}

variable "vm2_os_version" {
  description = "OS version for the second VM"
  type        = string
  default     = "18.04-LTS"
}

variable "vm2_nic_name" {
  description = "NIC name for the second VM"
  type        = string
  default     = "nic-vm-server-002"
}

variable "vm2_public_ip_name" {
  description = "Public IP name for the second VM"
  type        = string
  default     = "pip-vm-server-002"
}

variable "vm2_dns_label_prefix" {
  description = "DNS label prefix for the second VM"
  type        = string
  default     = "vm-server-002"
} 