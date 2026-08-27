terraform {
  required_version = ">= 1.3.0"

  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2"
    }
  }
}
