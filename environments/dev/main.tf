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
  subnet_name         = var.subnet_name
  public_ip_name      = var.public_ip_name
  dns_label_prefix    = var.dns_label_prefix
  my_ip              = var.my_ip
  tags               = var.tags
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

# Random string for unique DNS name
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
} 