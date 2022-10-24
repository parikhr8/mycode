terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  # here we removed the name "tutorial" for the container
  # and replace it with a call to a variable
  # name  = "tutorial"
  name = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port 
  }
}

# must keep the keys (what is to the left of the = sign) the same; the value (on the right of =) is what is defined by the variable
