variable "token_secret" {
  type        = string
  description = "TOKEN SECRET of Digital Ocean"
  sensitive   = true
}

variable "region" {
  type        = map(string)
  description = "Digital Ocean's region"
  default = {
    san_francisco = "sfo3",
    new_york      = "nyc1"
  }
}

variable "version_kubernetes_cluster" {
  type        = string
  description = "Cluster version"
  default     = "1.20.2-do.0"
}

variable "size_node_pool" {
  type        = string
  description = "Cluster version"
  default     = "s-2vcpu-2gb"
}
