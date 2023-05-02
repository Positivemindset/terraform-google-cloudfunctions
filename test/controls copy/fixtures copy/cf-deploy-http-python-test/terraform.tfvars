github_url = "https://github.com/Positivemindset/cf-http-python-test.git"
prj_id = "hostproject-379219"
folder_name = "ci-cd"
zip_name = "cf-http-python-test"
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
function_name = "cf-http-python-test"
function_archive_bucket_name = "cf-archive-bucket"
pubsub_topic_name = ""
trigger_event_resource = "trigger_http"

/*
function_name = "my-http-function"
runtime = "python39"
available_memory_mb = 256
timeout = 60
entry_point = "main"
environment_vars = {
  ENV_VAR_1 = "value1"
  ENV_VAR_2 = "value2"
}
ingress_settings = {
  allow_internal = true
  allow_all = true
}
service_account_email = "my-service-account-email@example.com"
vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
vpc_connector = "projects/my-project/locations/us-central1/connectors/my-vpc-connector"
max_instances = 10
trigger_type = var.trigger_type_http
image_repository_type = "gcr"
image_repository = "us.gcr.io/my-project/my-image"
trigger_event_resource = null
pubsub_topic_name = null
trigger_event_type_bucket = null
trigger_event_type_pubsub = null
secret_manager_secret_version = null
kms_key_name = null
secret_volumes = []



function_name = "my-storage-function"
runtime = "python39"
available_memory_mb = 256
timeout = 60
entry_point = "main"
environment_vars = {
  ENV_VAR_1 = "value1"
  ENV_VAR_2 = "value2"
}
ingress_settings = {
  allow_internal = true
  allow_all = true
}
service_account_email = "my-service-account-email@example.com"
vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
vpc_connector = "projects/my-project/locations/us-central1/connectors/my-vpc-connector"
max_instances = 10
trigger_type = var.trigger_type_bucket
image_repository_type = "gcr"
image_repository = "us.gcr.io/my-project/my-image"
trigger_event_resource = "projects/_/buckets/my-bucket"
pubsub_topic_name = null
trigger_event_type_bucket = "google.storage.object.finalize"
trigger_event_type_pubsub = null
secret_manager_secret_version = null
kms_key_name = null
secret_volumes = []


function_name = "my-pubsub-function"
runtime = "python39"
available_memory_mb = 256
timeout = 60
entry_point = "main"
environment_vars = {
  ENV_VAR_1 = "value1"
  ENV_VAR_2 = "value2"
}
ingress_settings = {
  allow_internal = true
  allow_all = true
}
service_account_email = "my-service-account-email@example.com"
vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
vpc_connector = "projects/my-project/locations/us-central1/connectors/my-vpc-connector"
max_instances = 10
trigger_type = var.trigger_type_pubsub
image_repository_type = "gcr"
image_repository = "us.gcr.io/my-project/my-image"
trigger_event_resource = null
pubsub_topic_name = "my-topic"
trigger_event_type_bucket = null
trigger_event_type_pubsub = "google.pubsub.topic.publish"
secret_manager_secret_version = null
kms_key_name = null
secret_volumes = []
*/