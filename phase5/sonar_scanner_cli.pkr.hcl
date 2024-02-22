packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "sonar-scanner" {
  image  = "sonarsource/sonar-scanner-cli:5.0"
  commit = true
}

build {
  name = "sonar-scanner-revive"
  sources = [
    "source.docker.sonar-scanner"
  ]
  post-processors {
    post-processor "docker-tag" {
      repository = "devopseasylearning/sonar-scanner-revive"
      tags       = ["v1.0.0"]
    }
    post-processor "docker-push" {
      login          = "true"
      login_username = "devopseasylearning"
      login_password = ""
    }
  }
}




