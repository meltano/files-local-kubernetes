resource "helm_release" "postgres" {
  name        = "postgresql"
  repository  = "https://charts.bitnami.com/bitnami"
  chart       = "postgresql"
  namespace   = "meltano"
  version     = "10.5.3"
  wait        = true

  set {
    name  = "postgresqlDatabase"
    value = "postgres"
  }

  set {
    name  = "postgresqlUsername"
    value = "postgres"
  }

  set {
    name  = "postgresqlPassword"
    value = "postgres"
  }

  set {
    name = "persistence.storageClass"
    value = "standard"
  }

  set {
    name = "initdbScripts.init\\.sql"
    value = <<EOF
  CREATE DATABASE meltano OWNER postgres;
  CREATE DATABASE airflow OWNER postgres;
  EOF
  }

}