# Dev ENV vars
locals {
  meltano_env_variables = []
}

resource "helm_release" "meltano" {
  name        = "meltano"
  repository  = "https://meltano.gitlab.io/infra/helm-meltano/meltano"
  chart       = "meltano"
  namespace   = "meltano"
  version     = "0.1.0"
  wait        = true
  # values = [
  #   "${file("values.yml")}"
  # ]

  set {
    name  = "extraEnv"
    value = yamlencode(local.meltano_env_variables)
  }

  # This is not a chart value, but just a way to trick helm_release into running every time.
  # Without this, helm_release only updates the release if the chart version (in Chart.yaml) has been updated
  set {
    name  = "timestamp"
    value = timestamp()
  }

  depends_on = [docker_image.meltano, helm_release.postgres]
}