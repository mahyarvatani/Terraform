variable "ec2_bastionhost_type" {
  description = "The Type of ec2 instance"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "test" = "t2.micro"
    "opr"  = "t2.micro"
  }
}

variable "ec2_bastionhost_keypair" {
  description = "The key pair that used to connect to ec2 instance"
  type        = string
  default     = "mahyar-ohaio"
}

variable "ec2_bastionhost_monitoring" {
  type = bool
  default = false
}
