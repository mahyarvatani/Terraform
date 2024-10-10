variable "cluster_name" {
  type    = string
  default = "demo"

}

variable "cluster_version" {
  type    = string
  default = null
}

variable "cluster_ipv4_cidr" {
  type    = string
  default = "10.0.0.0/16"

}


variable "cluster_endpoint_public_access" {
  type    = bool
  default = true

}

variable "cluster_endpoint_public_access_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}