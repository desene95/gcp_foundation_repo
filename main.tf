resource "google_access_context_manager_service_perimeter" "my_perimeter" {
  name           = "accessPolicies/299155975207/servicePerimeters/${var.perimeter_name}" 
  title          = var.perimeter_title
  parent = "accessPolicies/299155975207"
  perimeter_type = "PERIMETER_TYPE_REGULAR"

  status {
    resources = [for id in local.project_number : "projects/${id}"]

    restricted_services = [
      "storage.googleapis.com",
      "bigquery.googleapis.com"
    ]

    access_levels = [] # optional if using Access Levels
  }

  description = "VPC-SC perimeter with projects from outputs.json"
}