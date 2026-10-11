resource "google_dataform_team_folder" "dataform_team_folders" {
  for_each = var.dataform_team_folders

  display_name    = each.value.display_name
  region          = each.value.region
  deletion_policy = each.value.deletion_policy
  project         = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

