locals {
  outputs = yamldecode(file("${path.module}/outputs.yaml"))
}

locals {
  project_number = [for k, v in local.outputs : v.project_number]
}