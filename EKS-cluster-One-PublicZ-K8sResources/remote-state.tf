data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../EKS-cluster-One-Public-Zone/terraform.tfstate"
    }
  }



  
