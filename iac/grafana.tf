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