variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}

variable "runtime" {
  description = "Runtime of the Cloud Function"
  type        = string
  default     = "python39"
}

variable "available_memory_mb" {
  description = "Memory allocated to the Cloud Function in MB"
  type        = number
  default     = 256
}

variable "timeout" {
  description = "Timeout for the Cloud Function in seconds"
  type        = number
  default     = 60
}

variable "function_archive_bucket_name" {
  description = "Name of the Google Cloud Storage bucket containing the function archive"
  type        = string
}
variable "api_version" {
  description = "The API version to use for the Cloud Functions API"
  type        = string
  default     = "v1"
}

variable "entry_point" {
  description = "Name of the function to be executed in the Cloud Function"
  type        = string
  default     = ""
}

variable "environment_vars" {
  description = "Environment variables for the Cloud Function"
  type        = map(string)
  default     = {}
}

variable "ingress_settings" {
  description = "Ingress settings for the Cloud Function"
  type        = map
  default     = {}
}

variable "service_account_email" {
  description = "Service account email for the Cloud Function"
  type        = string
  default     = null
}

variable "vpc_connector_egress_settings" {
  description = "Egress settings for the VPC connector"
  type        = string
  default     = null
}

variable "vpc_connector" {
  description = "VPC connector for the Cloud Function"
  type        = string
  default     = null
}

variable "max_instances" {
  description = "Maximum number of instances for the Cloud Function"
  type        = number
  default     = 1
}

variable "build_env_vars" {
  description = "Build environment variables for the Cloud Function"
  type        = map(string)
  default     = {}
}

variable "builder_worker_pool" {
  description = "Builder worker pool for the Cloud Function"
  type        = string
  default     = null
}

variable "secret_manager_secret_version" {
  description = "Secret Manager secret version for the Cloud Function"
  type        = string
  default     = null
}

variable "kms_key_name" {
  description = "KMS key name for customer-managed encryption"
  type        = string
  default     = null
}

variable "image_repository_type" {
  description = "Image repository type for the Cloud Function"
  type        = string
  default     = null
}

variable "image_repository" {
  description = "Image repository for the Cloud Function"
  type        = string
  default     = null
}

variable "trigger_type" {
  description = "Type of trigger for the Cloud Function"
  type        = string
}

variable "trigger_type_http" {
  description = "Constant for the HTTP trigger type"
  type        = string
  default     = "HTTP_TRIGGER"
}

variable "trigger_type_pubsub" {
  description = "Constant for the Pub/Sub trigger type"
  type        = string
  default     = "PUBSUB_TRIGGER"
}

variable "trigger_type_bucket" {
  description = "Type of Cloud Storage trigger for the Cloud Function"
  type        = string
}

variable "trigger_event_type_pubsub" {
  description = "Event type for the Pub/Sub trigger"
  type        = string
  default     = null
}

variable "trigger_event_type_bucket" {
  description = "Event type for the Cloud Storage trigger"
  type        = string
  default     = null
}

variable "trigger_event_resource" {
  description = "Resource for the event trigger"
  type        = string
  default     = null
}

variable "pubsub_topic_name" {
  description = "Name of the Pub/Sub topic for the event trigger"
  type        = string
  default     = null
}

variable "encryption_type" {
  description = "Encryption type for the Cloud Function"
  type        = string
  default     = "GOOGLE_MANAGED_KEY"
}

variable "CUSTOMER_MANAGED_KEY" {
  description = "Constant for the customer-managed encryption key type"
  type        = string
  default     = "CUSTOMER_MANAGED_KEY"
}

variable "secret_volumes" {
  description = "Secret volumes for the Cloud Function"
  type        = list(object({
    secret_version = string
    mount_path     = string
    method         = string
  }))
  default = []
}

variable "github_url" {
  description = "URL of the GitHub repository to deploy the Cloud Function from"
  type        = string
}

variable "folder_name" {
  description = "Name of the local folder to clone the repository to"
  type        = string
}

variable "zip_name" {
  description = "Name of the archive to create from the local folder"
  type        = string
}

