variable "env_id" {
  description = "The environment ID"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "src_key" {
  description = "The source key"
  type        = string
  default     = "Terraform"
}

variable "location" {
  description = "The Azure location"
  type        = string
  default     = "West US"
}

variable "application_name" {
  description = "The application name"
  type        = string
}