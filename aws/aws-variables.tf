#AWS authentication variables
variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}
variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

#AWS Region
variable "aws_region" {
  type        = string
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}
#AWS AZ
variable "aws_az" {
  type        = string
  description = "AWS AZ(availibilty zone)"
  default     = "us-east-1"
}


#Define application name
variable "app_name" {
  type        = string
  description = "Application name"
  default     = "aws-cloud-computing-web-app"
}
#Define application environment
variable "app_environment" {
  type        = string
  description = "Application environment"
  default     = "demo"
}

#ami id change it ubuntu 
variable "ami" {
  type        = string
  description = "AMI ID"
  default     = "ami-0b0ea68c435eb488d"
}
