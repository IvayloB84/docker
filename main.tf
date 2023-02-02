# Creating a Docker Image ubuntu with the latest as the Tag
resource "docker_image" "ubuntu" {               
  name = "ubuntu:latest"
}

resource "docker_network" "private_network" {
  name = "my_network"
  driver = "bridge"
}
# Creating a Docker Container using the latest ubuntu image
resource "docker_container" "my_container" {   
  # Specifying the name of the container as my_container
  name = "my_container"  
  image = docker_image.ubuntu.latest       
}

# Creating a Docker Service named myservice using ubuntu image with a latest
resource "docker_service" "my_service" {       
  name = "myservice"
  task_spec {
   container_spec {
     image = docker_image.ubuntu.latest     
    }
   }
  endpoint_spec {
    ports {
     target_port = "8080"
       }
    }
}
