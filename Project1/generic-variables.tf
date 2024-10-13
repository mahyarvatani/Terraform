variable "aws_region" {
  description = "The Region in which aws object will be created"
  type        = string
  default     = "us-east-2"
}


variable "environment" {
  description = "Name of Environment"
  type        = string
  default     = "dev"
}

variable "customer" {
  description = "Name of Customer"
  type        = string
  default     = "ISC"
}