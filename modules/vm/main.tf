terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

variable "cloud_init_file" {
  description = "Path to cloud-init file"
  type        = string
  default     = "cloud-init.yml"
}

# Storage Account for boot diagnostics
# resource "azurerm_storage_account" "boot_diagnostics" {
#   name                     = "bootdiags${random_string.suffix.result}"
#   resource_group_name      = var.resource_group_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags                     = var.tags
# }

# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  tags                = var.tags

  network_interface_ids = [
    var.network_interface_id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  custom_data = base64encode(templatefile("${path.module}/${var.cloud_init_file}", {
    admin_username = var.admin_username
    ssh_public_key = var.ssh_public_key
  }))

  # boot_diagnostics {
  #   storage_account_uri = azurerm_storage_account.boot_diagnostics.primary_blob_endpoint
  # }
}

# Random string for unique storage account name
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
} 