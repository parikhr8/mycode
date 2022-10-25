terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}


provider "docker" {}

#resource "simpleflaskservice" "sfservice" {

resource "docker_image" "sfservice" {
  name         = "registry.gitlab.com/alta3research/simpleflaskservice:1.0"
  keep_locally = true       // keep image after "destroy"
}

resource "docker_container" "sfservice" {
  name  = var.container_name
  image= docker_image.sfservice.image_id   //added
  ports {
    internal = var.internal_port 
    external = var.external_port
  }
}
