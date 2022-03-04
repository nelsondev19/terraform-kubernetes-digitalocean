terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token_secret
}

resource "digitalocean_kubernetes_cluster" "my_cluster" {
  name         = "my-cluster"
  region       = "sfo3"
  version      = "1.21"
  auto_upgrade = true

  node_pool {
    name       = "jj6shs654"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.my_cluster.endpoint
  token                  = digitalocean_kubernetes_cluster.my_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.my_cluster.kube_config[0].cluster_ca_certificate)
}

