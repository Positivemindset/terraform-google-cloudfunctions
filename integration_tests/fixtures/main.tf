 module "http_function" {
  source = "../../"
  github_url = "https://github.com/Positivemindset/ci-cd.git"
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
 