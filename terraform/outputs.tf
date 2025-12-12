# outputs.tf

output "databricks_host_url" {
  description = "The host URL of the created Databricks workspace. This is needed for the DATABRICKS_HOST secret."
  value       = azurerm_databricks_workspace.dbr.workspace_url
}

output "databricks_workspace_id" {
  description = "The unique ID of the Databricks workspace."
  value       = azurerm_databricks_workspace.dbr.id
}

output "resource_group_name" {
  description = "The name of the primary resource group."
  value       = azurerm_resource_group.rg.name
}

