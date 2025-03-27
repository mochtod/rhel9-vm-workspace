terraform {
  backend "atlantis" {
    # Add Atlantis-specific backend configuration here
  }

  # Enable workspaces for managing multiple environments
  required_version = ">= 1.0.0"
}

variable "environment" {
  description = "The environment to deploy (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "host_group" {
  description = "The host group to deploy (e.g., web, database, app)"
  type        = string
  default     = "default-group"
}

variable "host_collections" {
  description = "The host collections to deploy (e.g., collection1, collection2)"
  type        = list(string)
  default     = ["default-collection"]
}

variable "content_key" {
  description = "The content license to use for the environment"
  type        = string
  default     = "default-license"
}

variable "organization" {
  description = "The organization to associate with the environment"
  type        = string
  default     = "default-organization"
}