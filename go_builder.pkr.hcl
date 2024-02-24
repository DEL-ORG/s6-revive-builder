packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "golang01" {
  image  = "golang:latest"
  commit = true
}

build {
  name = "golang01-revive"
  sources = [
    "source.docker.golang01"
  ]
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/golang01-revive"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = ""
    }
  }
}




