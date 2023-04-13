module "http_function" {
  source = "../../"
  github_url = "https://github.com/Positivemindset/testcfmodule.git"
  prjid = "proxycertificatecf"
  folder_name ="testcfmodule"
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
  vpc_connector = "projects/proxycertificatecf/locations/europe-west2/connectors/serverlessvpcconnector"
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
  service_account_email = "cfsa-568@proxycertificatecf.iam.gserviceaccount.com"
  trigger_type = "http"
  
  description = "test"
  created_by = "harsha"
  owner = "harsha"
  function_name = "hello_world"
  function_archive_bucket_name = "cloudfunction-archive"
  pubsub_topic_name =""
  trigger_event_resource="trigger_http"
}
