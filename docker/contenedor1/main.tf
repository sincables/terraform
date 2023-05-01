terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
resource "docker_container" "ubuntu" {

    name = "ubuntu1"
    image = "ubuntu:18.04"
    command = ["/bin/bash","-c","while true; do sleep 60000; done"]
}