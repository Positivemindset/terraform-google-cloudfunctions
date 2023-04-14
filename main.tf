
locals {
  # Get the repository name from the URL
  repository_name = substr(var.github_url, 20, -4)

  # Shared labels for all resources
  shared_labels = {
    "created_by"  = var.created_by
    "description" = var.description
    "owner"       = var.owner
  }
}



resource "null_resource" "clone_repository" {
  provisioner "local-exec" {
    command = <<-EOT
      bash -c '
      if [ -d ${var.folder_name} ]; then
        rm -rf ${var.folder_name}
      fi
      git clone ${var.github_url} ${var.folder_name}'
    EOT
  }
}

resource "null_resource" "install_packages" {
  depends_on = [
    null_resource.clone_repository,
  ]
  provisioner "local-exec" {
    command     = <<-EOT
      bash -c '
      ls
      if [ "${var.runtime}" == "python39" ]; then
        if [ -f requirements.txt ]; then
          pip3 install -r requirements.txt -t .
        else
          echo "No requirements.txt found"
        fi
      elif [ "${var.runtime}" == "dotnet3" ]; then
        dotnet restore
      fi'
    EOT
    working_dir = var.folder_name
  }
}



data "archive_file" "repository_archive" {
  count = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub ? 1 : 0

  depends_on = [
    null_resource.install_packages
  ]
  type        = "zip"
  source_dir  = var.folder_name
  output_path = "${var.zip_name}.zip"
}


# Upload the archive to a Google Cloud Storage bucket
resource "google_storage_bucket_object" "archive" {
  count = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub ? 1 : 0

  name   = "${var.zip_name}.zip"
  bucket = var.function_archive_bucket_name
  source = data.archive_file.repository_archive[count.index].output_path
}



# Create HTTP-triggered Cloud Function
resource "google_cloudfunctions_function" "http_function" {
  count = var.trigger_type == var.trigger_type_http ? 1 : 0

  name        = var.function_name
  description = "${var.function_name} http cloud function"

  runtime               = var.runtime
  available_memory_mb   = var.available_memory_mb
  timeout               = var.timeout
  source_archive_bucket = var.function_archive_bucket_name
  source_archive_object = google_storage_bucket_object.archive[count.index].name

  trigger_http          = true
  entry_point           = var.entry_point
  environment_variables = var.environment_vars
  ingress_settings      = var.ingress_settings
  service_account_email = var.service_account_email == null ? "" : var.service_account_email

  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  lifecycle {
    create_before_destroy = true
  }
}

# Create event-triggered Cloud Function
resource "google_cloudfunctions_function" "event_function" {
  count = var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0

  name        = var.function_name
  description = "${var.function_name} events cloud function"
  runtime     = var.runtime

  available_memory_mb   = var.available_memory_mb
  timeout               = var.timeout
  source_archive_bucket = var.function_archive_bucket_name
  source_archive_object = google_storage_bucket_object.archive[count.index].name

  max_instances = var.max_instances

  event_trigger {
    event_type = var.trigger_type == var.trigger_type_pubsub ? var.trigger_event_type_pubsub : var.trigger_event_type_bucket
    resource   = var.trigger_type == var.trigger_type_pubsub ? var.pubsub_topic_name : var.trigger_event_resource
  }

  entry_point                   = var.entry_point
  environment_variables         = var.environment_vars
  ingress_settings              = var.ingress_settings
  service_account_email         = var.service_account_email == null ? "" : var.service_account_email
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  labels                        = merge(local.shared_labels)
  lifecycle {
    create_before_destroy = true
  }
}





