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

resource "docker_container" "grafana" {
  name = "grafana"
  image = "grafana/grafana:main-ubuntu"

  networks_advanced {
    name = docker_network.monitor_net.name
    aliases = ["grafana"]
  }

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["grafana-app"]
  }

  networks_advanced {
    name = docker_network.persistence_net.name
    aliases = ["grafana-db"]
  }

  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=admin"
  ]
}