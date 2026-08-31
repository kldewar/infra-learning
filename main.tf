terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.7"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.36"
    }
  }

  required_version = ">= 1.0"
}

provider "kind" {}

resource "kind_cluster" "default" {
  name           = "learning"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      extra_port_mappings {
        container_port = 30080
        host_port      = 8080
      }

      extra_port_mappings {
        container_port = 30443
        host_port      = 8443
      }
    }

    node {
      role = "worker"
    }
  }
}
