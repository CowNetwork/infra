terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.25.2"
    }
  }

  backend "remote" {
    organization = "cow-network"
    workspaces {
      name = "infrastructure"
    }
  }
}

variable "hcloud_token" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}
