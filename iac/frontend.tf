resource "docker_container" "app1" {
  name = "app1"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app1"]
  }

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["app1-db"]
  }

  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "app2" {
  name = "app2"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app2"]
  }

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["app2-db"]
  }

  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "app3" {
  name = "app3"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app3"]
  }

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["app3-db"]
  }

  ports {
    internal = 80
    external = 8082
  }
}