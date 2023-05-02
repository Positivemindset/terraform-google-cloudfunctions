module "my_cloud_function" {
  source = "../../../" # Replace with the path to your module folder

  # Replace the values below with your own input values
  github_url                    = var.github_url
  folder_name                   = var.folder_name
  zip_name                      = var.zip_name
  function_name                 = var.function_name
  runtime                       = var.runtime
  available_memory_mb           = var.available_memory_mb
  timeout                       = var.timeout
  function_archive_bucket_name  = var.function_archive_bucket_name
  entry_point                   = var.entry_point
  environment_vars              = var.environment_vars
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector
  service_account_email         = var.service_account_email

  max_instances         = var.max_instances
  image_repository      = var.image_repository
  image_repository_type = var.image_repository_type
  # Set other variables as needed
  /* trigger_type = var.trigger_type */

  /* trigger_type           = "PUBSUB_TRIGGER"
  trigger_event_resource = "projects/YOUR_PROJECT_ID/topics/YOUR_TOPIC_NAME" */

  trigger_type           = var.trigger_type
  trigger_event_resource = var.trigger_event_resource

  # Add your labels
  created_by  = var.created_by
  description = var.description
  owner       = var.owner
  project_id  = var.project_id

}
