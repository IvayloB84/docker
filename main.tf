terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
provider "docker" {
  host = "tcp://192.168.56.102:2375/"
}

resource "docker_image" "img-web" {
  name = "shekeriev/bgapp-web"
}

resource "docker_network" "private_network" {
  name = "app-net"
}

resource "docker_container" "con-web" {
  name  = "con-web"
  image = docker_image.img-web
  ports {
    internal = "80"
    external = "80"
  }
}

resource "docker_image" "img-db" {
  name = "shekeriev/bgapp-db"
}
