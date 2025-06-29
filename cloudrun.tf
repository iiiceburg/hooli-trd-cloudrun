######################################################
# Cloud Run Service Configuration for Python RESTFul API
######################################################
resource "google_cloud_run_v2_service" "cloudrun_api" {
  name                = "${local.prefix}-cloudrun-api"
  location            = local.location
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }
    scaling {
      min_instance_count = 2
      max_instance_count = 4
    }
  }
}

resource "google_cloud_run_service_iam_member" "allow_all_users" {
  service  = google_cloud_run_v2_service.cloudrun_api.name
  location = google_cloud_run_v2_service.cloudrun_api.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

