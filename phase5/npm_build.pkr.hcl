packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "nodejs01" {
  image  = "node:hydrogen-slim"
  commit = true
}

build {
  name = "nodejs01-revive"
  sources = [
    "source.docker.nodejs01"
  ]
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/nodejs01-revive"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = ""
    }
  }
}




