packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "nginx01" {
  image  = "nginx:latest"
  commit = true
}

build {
  name = "nginx01-revive"
  sources = [
    "source.docker.nginx01"
  ]
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/nginx01-revive"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = ""
    }
  }
}




