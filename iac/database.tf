resource "docker_container" "postgres" {
  name = "postgres"
  image = "postgres:13-trixie"

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["postgres"]
  }

  ports {
    internal = 5432
    external = 5432
  }

  env = [
    "POSTGRES_USER=example",
    "POSTGRES_PASSWORD=example",
    "POSTGRES_DB=example"
  ]
}

resource "docker_container" "redis" {
  name = "redis"
  image = "redis:8.2.1"

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["redis"]
  }

  ports {
    internal = 6379
    external = 6379
  }
}