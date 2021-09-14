terraform {
  required_providers {
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.4.1"
    }
    helm = {
        source = "hashicorp/helm"
        version = "2.2.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.9"
    }
    http = {
      source = "hashicorp/http"
      version = "2.1.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.11.3"
    }
    local = {
      source = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "kubernetes" {
  host                   = kind_cluster.meltano.endpoint
  client_certificate     = kind_cluster.meltano.client_certificate
  client_key             = kind_cluster.meltano.client_key
  cluster_ca_certificate = kind_cluster.meltano.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.meltano.endpoint
    client_certificate     = kind_cluster.meltano.client_certificate
    client_key             = kind_cluster.meltano.client_key
    cluster_ca_certificate = kind_cluster.meltano.cluster_ca_certificate
  }
}

provider "kubectl" {
  host                   = kind_cluster.meltano.endpoint
  cluster_ca_certificate = kind_cluster.meltano.cluster_ca_certificate
  client_certificate     = kind_cluster.meltano.client_certificate
  client_key             = kind_cluster.meltano.client_key
  load_config_file       = false
}