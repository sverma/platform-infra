terraform {
  required_version = ">= 1.7"

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
      version = "~> 2.14"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
    }

    http = {
      source = "hashicorp/http"
    }
  }
}