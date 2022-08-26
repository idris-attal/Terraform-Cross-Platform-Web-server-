#GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
#Define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP web-server"
}
#Define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "europe-west1"
}
#Define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone"
  default     = "europe-west1-b"
}
#Define subnet CIDR
variable "gcp_subnet_cidr" {
  type        = string
  description = "Subnet CIDR"
  default     = "10.2.0.0/16"
}

# This is application part-which means that 
#Define application name
variable "app_name" {
  type        = string
  description = "Application name"
  default     = "terraform-web"
}
#Define application environment
variable "app_environment" {
  type        = string
  description = "Application environment"
  default     = "test"
}

