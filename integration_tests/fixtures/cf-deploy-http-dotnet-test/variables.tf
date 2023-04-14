variable "created_by" {
  type        = string
  description = "Person who created the terraform resources"
}

variable "description" {
  type        = string
  description = "Short description on the resources created and their usage"
}

variable "owner" {
  type        = string
  description = "Person who manages the resources"
}

variable "github_url" {
  type        = string
  description = "The URL of the GitHub repository to clone"
}


variable "prj_id" {
  type        = string
  description = "The ID of the project"
}

variable "function_name" {
  type        = string
  description = "The cloud function name"
}

variable "trigger_type" {
  type        = string
  default     = "http"
  description = "The type of trigger for the Cloud Function"
}

variable "trigger_type_pubsub" {
  type        = string
  default     = "pubsub"
  description = "The Pub/Sub trigger type for the Cloud Function"
}

variable "trigger_type_bucket" {
  type        = string
  default     = "bucket"
  description = "The Cloud Storage trigger type for the Cloud Function"
}

variable "trigger_type_http" {
  type        = string
  default     = "http"
  description = "The HTTP trigger type for the Cloud Function"
}

variable "trigger_event_type_pubsub" {
  type        = string
  default     = "google.pubsub.topic.publish"
  description = "The event type for Pub/Sub trigger"
}

variable "trigger_event_type_bucket" {
  type        = string
  default     = "google.storage.object.finalize"
  description = "The event type for Cloud Storage trigger"
}

variable "pubsub_topic_name" {
  type        = string
  description = "The name of the Pub/Sub topic to use for the event trigger"
}

variable "runtime" {
  type        = string
  description = "The runtime of the Cloud Function"
}

variable "available_memory_mb" {
  type        = number
  default     = 256
  description = "The amount of memory available to the Cloud Function, in megabytes"
}

variable "timeout" {
  type        = number
  default     = 60
  description = "The amount of time the Cloud Function has to complete, in seconds"
}

variable "function_archive_bucket_name" {
  type        = string
  description = "The name of the Google Cloud Storage bucket to use for the Cloud Function archive"
}

variable "entry_point" {
  type        = string
  default     = "handler"
  description = "The entry point for the Cloud Function"
}

variable "environment_vars" {
  type        = map(string)
  default     = {}
  description = "The environment variables to set for the Cloud Function"
}

variable "ingress_settings" {
  type        = string
  default     = "ALLOW_ALL"
  description = "The ingress settings for the function. Allowed values are ALLOW_ALL, ALLOW_INTERNAL_AND_GCLB and ALLOW_INTERNAL_ONLY. Changes to this field will recreate the cloud function."
}


variable "service_account_email" {
  type        = string
  default     = null
  description = "The email address of the service account to associate with the Cloud Function"
}

variable "vpc_connector_egress_settings" {
  type        = string
  default     = null
  description = "The VPC connector egress settings for the Cloud Function"
}

variable "vpc_connector" {
  type        = string
  default     = null
  description = "The name of the VPC connector to use for the Cloud Function"
}

variable "max_instances" {
  type        = number
  default     = null
  description = "The maximum number of instances of the Cloud Function to run"
}
variable "trigger_event_resource" {
  type        = string
  description = "The resource to use for the Cloud Function event trigger"
}
variable "folder_name" {
  type        = string
  description = "The folder name in the cloud storage"
}
variable "zip_name" {
  type        = string
  description = "The zip file name to zip"
}
