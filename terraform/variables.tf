variable "project_prefix" {
  type        = string
  description = "A prefix for all resource names to ensure uniqueness."
  
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created. Must be 'East US'."
  default     = "East US"
  validation {
    # Policy Enforcement: Only allow the specified location.
    condition     = var.location == "East US"
    error_message = "The deployment location must be 'East US' to comply with organizational policy."
  }
}

variable "databricks_sku" {
  type        = string
  description = "The pricing tier for the Databricks workspace."
  default     = "premium"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the resources."
  default = {
    environment = "dev"
    source      = "terraform"
    project     = "databricks-cicd-pipeline"
  }
}