terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7.1"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
  }
}
