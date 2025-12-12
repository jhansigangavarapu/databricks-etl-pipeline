# Provider Configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0" # Locking to the specified version
    }
  }
}

# Provider Authentication
provider "azurerm" {
  subscription_id = "2f2474fb-2603-4749-8169-e6dedccc18e5"
  features {}
}

# Local Values for Naming
locals {
  resource_group_name         = "${var.project_prefix}-rg"
  databricks_workspace_name   = "${var.project_prefix}-dbr-ws"
  managed_resource_group_name = "${var.project_prefix}-dbr-managed-rg"
}


# Resource Definitions

# 1. Create the Azure Resource Group (Compliant)
# This resource will be created in the location validated by our variable.
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location # This is now policy-enforced to be "East US"
  tags     = var.tags
}

# 2. Create the Azure Databricks Workspace
# This resource uses the location and SKU validated by our variables.
resource "azurerm_databricks_workspace" "dbr" {
  name                = local.databricks_workspace_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.databricks_sku # This is now policy-enforced

  managed_resource_group_name = local.managed_resource_group_name
  public_network_access_enabled = true
  
  tags = var.tags
}

