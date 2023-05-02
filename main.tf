# Define local variables
locals {
  repository_name = replace(var.github_url, "/\\.git$/", "")
  shared_labels = {
    "created_by"  = replace(var.created_by, " ", "_")
    "description" = replace(var.description, " ", "_")
    "owner"       = replace(var.owner, " ", "_")
  }

}



# Clone the repository
resource "null_resource" "clone_repository" {
  provisioner "local-exec" {
    command = <<-EOT
      if [ -d ${var.folder_name} ]; then
        rm -rf ${var.folder_name}
      fi
      git clone ${var.github_url} ${var.folder_name}
    EOT
  }
}

# Install packages for the chosen runtime
resource "null_resource" "install_packages" {
  depends_on = [
    null_resource.clone_repository,
  ]
  provisioner "local-exec" {
    command     = <<-EOT
      ls
      if [ "${var.runtime}" == "python39" ]; then
        if [ -f requirements.txt ]; then
          pip3 install -r requirements.txt -t .
        else
          echo "No requirements.txt found"
        fi
      elif [ "${var.runtime}" == "dotnet3" ]; then
        dotnet restore
      fi
    EOT
    working_dir = var.folder_name
  }
}

# Archive the repository
data "archive_file" "repository_archive" {
  count = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0
  depends_on = [
    null_resource.install_packages
  ]
  type        = "zip"
  source_dir  = var.folder_name
  output_path = "${var.zip_name}.zip"
}

# Upload the archive to Google Cloud Storage
resource "google_storage_bucket_object" "archive" {
  count  = var.trigger_type == var.trigger_type_http || var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? 1 : 0
  name   = "${var.zip_name}.zip"
  bucket = var.function_archive_bucket_name
  source = data.archive_file.repository_archive[count.index].output_path
}


# Create the Google Cloud Function
resource "google_cloudfunctions_function" "cloud_function" {
  name        = var.function_name
  description = "${var.function_name} cloud function"
  runtime     = var.runtime

  available_memory_mb   = var.available_memory_mb
  timeout               = var.timeout
  source_archive_bucket = var.function_archive_bucket_name
  source_archive_object = google_storage_bucket_object.archive[0].name

  entry_point                   = var.entry_point
  environment_variables         = var.environment_vars
  ingress_settings              = var.ingress_settings
  service_account_email         = var.service_account_email == null ? "" : var.service_account_email
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  max_instances                 = var.max_instances


  lifecycle {
    create_before_destroy = true
  }


  # Define the event trigger if necessary
  dynamic "event_trigger" {
    for_each = var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? [1] : []
    content {
      event_type = var.trigger_type == var.trigger_type_pubsub ? var.trigger_event_type_pubsub : var.trigger_event_type_bucket
      resource   = var.trigger_event_resource

      failure_policy {
        retry = true
      }
    }
  }
  trigger_http = var.trigger_type == var.trigger_type_pubsub || var.trigger_type == var.trigger_type_bucket ? null : true


  build_environment_variables = var.build_env_vars
  build_worker_pool           = var.build_worker_pool


  kms_key_name = var.encryption_type == "CUSTOMER_MANAGED_KEY" ? var.kms_key_name : null
  # Configure the source repository if necessary
  /*   dynamic "source_repository" {
    for_each = var.image_repository_type == "CUSTOMER_MANAGED_ARTIFACT" ? [1] : []
    content {
      url = var.image_repository
    }
  } */


  labels = local.shared_labels

}
