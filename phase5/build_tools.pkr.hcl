packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "maven" {
  image  = "maven:3.8.7-openjdk-18-slim"
  commit = true
}

build {
  name = "maven-revive"
  sources = [
    "source.docker.maven"
  ]
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/maven-revive"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = ""
    }
  }
}




