/* module "http_function" {
  source = "../../"
  github_url = "https://github.com/Positivemindset/ci-cd.git"
  prjid = "hostproject-379219"
  folder_name ="ci-cd"
  zip_name = "hello_world"
  runtime = "python39"
  available_memory_mb = 256
  timeout = 60
  entry_point = "hello_world"
  environment_vars = {
    VAR1 = "value1"
    VAR2 = "value2"
  }
  ingress_settings = "ALLOW_ALL"
  vpc_connector = "projects/hostproject-379219/locations/europe-west2/connectors/serverlessvpcconnector"
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
  service_account_email = "hostproject-379219@appspot.gserviceaccount.com"
  trigger_type = "http"
  
  description = "test"
  created_by = "harsha"
  owner = "harsha"
  function_name = "hello_world"
  function_archive_bucket_name = "cf-archive-bucket"
  pubsub_topic_name =""
  trigger_event_resource="trigger_http"
}
 */

 module "http_function" {
  source = "../../../"

  github_url = var.github_url
  folder_name = var.folder_name
  zip_name = var.zip_name
  runtime = var.runtime
  available_memory_mb = var.available_memory_mb
  timeout = var.timeout
  entry_point = var.entry_point
  environment_vars = var.environment_vars
  ingress_settings = var.ingress_settings
  vpc_connector = var.vpc_connector
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  service_account_email = var.service_account_email
  trigger_type = var.trigger_type
  description = var.description
  created_by = var.created_by
  owner = var.owner
  function_name = var.function_name
  function_archive_bucket_name = var.function_archive_bucket_name
  pubsub_topic_name = var.pubsub_topic_name
  trigger_event_resource = var.trigger_event_resource
}
