# Start a registry container
resource "docker_container" "registry" {
  name    = "registry"
  image   = "registry:2"
  restart = "always"
  ports {
    internal = "5000"
    external = "5000"
  }
  networks_advanced {
    name = "kind"
  }
  lifecycle {
    ignore_changes = [image]
  }
  depends_on = [kind_cluster.meltano]
}

# Build base Meltano docker image
resource "docker_image" "meltano" {
  name = "localhost:5000/meltano:latest"
  build {
    path       = "../../"
    dockerfile = "infrastructure/local/Dockerfile"
    label = {
      # Forces rebuild on tf apply
      build_ts: timestamp()
    }
  }
  provisioner "local-exec" {
    command = "docker push localhost:5000/meltano:latest"
  }
  depends_on = [docker_container.registry]
}

