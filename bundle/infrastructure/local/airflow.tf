resource "helm_release" "airflow" {
  name        = "airflow"
  repository  = "https://meltano.gitlab.io/infra/helm-meltano/airflow/"
  chart       = "airflow"
  namespace   = "meltano"
  version     = "0.1.0"
  wait        = false
  # values = [
  #   "${file("values.yml")}"
  # ]

  # This is not a chart value, but just a way to trick helm_release into running every time.
  # Without this, helm_release only updates the release if the chart version (in Chart.yaml) has been updated
  set {
    name  = "timestamp"
    value = timestamp()
  }

  depends_on = [docker_image.meltano, helm_release.postgres, helm_release.nfs_server_provisioner]
}