terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "stterraformstate"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

locals {
  ssh_public_key = file("${path.module}/../keypair/yamhkey.pub")
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "network" {
  source = "../../modules/network"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  virtual_network_name = var.virtual_network_name
  address_prefix      = "10.0.0.0/16"
  subnet_name         = var.subnet_name
  subnet_prefix       = "10.0.1.0/24"
  public_ip_name      = var.public_ip_name
  public_ip_allocation_method = "Dynamic"
  public_ip_sku       = "Basic"
  dns_label_prefix    = var.dns_label_prefix
  my_ip               = var.my_ip
  tags                = var.tags

  # VM2 network variables
  vm2_nic_name        = var.vm2_nic_name
  vm2_public_ip_name  = var.vm2_public_ip_name
  vm2_dns_label_prefix = var.vm2_dns_label_prefix
}

module "vm" {
  source = "../../modules/vm"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  os_version          = var.os_version
  network_interface_id = module.network.network_interface_id
  ssh_public_key      = local.ssh_public_key
  tags                = var.tags
}

module "vm2" {
  source = "../../modules/vm"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  vm_name             = var.vm2_name
  vm_size             = var.vm2_size
  admin_username      = var.vm2_admin_username
  admin_password      = var.vm2_admin_password
  os_version          = var.vm2_os_version
  network_interface_id = module.network.network_interface_id_vm2
  ssh_public_key      = local.ssh_public_key
  tags                = var.tags
  cloud_init_file     = "cloud-init-vm2.yml"
}

# Random string for unique DNS name
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
} 