# Declaring the Required provider (Docker provider)
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# Specifying the Docker provider configuration
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
