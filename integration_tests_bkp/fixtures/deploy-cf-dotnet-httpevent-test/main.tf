module "dotnet_cloud_function_local" {
  source = "../../"
  local_repo_path = "<path_to_local_dotnet_repo>"
  prjid = "proxycertificatecf"
  folder_name ="testcfmodule"
  zip_name = "hello_world"
  runtime = "dotnet3"
  function_name = "hello_world"
  function_archive_bucket_name = "cloudfunction-archive"

  entry_point = "hello_world"
  trigger_type                  = "http"
  available_memory_mb           = 256
  timeout                       = 60
  environment_vars              = { KEY1 = "VALUE1", KEY2 = "VALUE2" }
  ingress_settings              = "ALLOW_ALL"
  service_account_email = "cfsa-568@proxycertificatecf.iam.gserviceaccount.com"
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
  vpc_connector = "projects/proxycertificatecf/locations/europe-west2/connectors/serverlessvpcconnector"
  pubsub_topic_name             =""
  trigger_event_resource        ="trigger_http"
  created_by                    = "chefunittests"
  description                   = ".NET Cloud Function from Local"
  owner                         = "chefunittests"
}

