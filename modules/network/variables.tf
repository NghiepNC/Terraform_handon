variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_prefix" {
  description = "Address prefix for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the public IP"
  type        = string
  default     = "Dynamic"
}

variable "public_ip_sku" {
  description = "SKU for the public IP"
  type        = string
  default     = "Basic"
}

variable "dns_label_prefix" {
  description = "DNS label prefix for the public IP"
  type        = string
}

variable "my_ip" {
  description = "Your IP address to allow SSH access"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
} 