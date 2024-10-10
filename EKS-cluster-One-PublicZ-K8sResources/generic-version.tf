terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}


provider "aws" {
  region = "us-east-2"
}

provider "kubernetes" {
  host = 
  cluster_ca_certificate = 
  token = 
}