variable "env_id" {
  description = "The environment ID"
  type        = string
  default     = "dev"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default     = "c5f71eed-602e-4482-a9cd-84157520aac5"
}

variable "src_key" {
  description = "The source key"
  type        = string
  default     = "terraform"
}

variable "location" {
  description = "The Azure location"
  type        = string
  default     = "West US"
}

variable "sql_admin_password" {
  description = "The SQL admin password"
  type        = string
}